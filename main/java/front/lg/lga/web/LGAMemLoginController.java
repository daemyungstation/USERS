package front.lg.lga.web;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.SeedCipher;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.lg.lga.service.LGAMemLoginService;

/**
 * <pre> 
 * 회원 로그인을 위한 Controller
 * </pre>
 * 
 * @ClassName		: LGAMemLoginController.java
 * @Description		: 회원 로그인을 위한 Controller
 * @author 김필기
 * @since 2016.03.03
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.03		   김필기				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/member/login")
public class LGAMemLoginController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="lGAMemLoginService")
    private LGAMemLoginService lGAMemLoginService;

	/**
	 * 회원로그인 화면
	 *
	 * @param emfMap
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/Login.do")
	public String getLoginView(EmfMap emfMap, ModelMap modelMap) {
		modelMap.addAttribute("vwUrl", emfMap.getString("vwUrl"));
		modelMap.addAttribute("idx", emfMap.getString("idx"));		
		return "front/lg/lga/LGAMemLogin.front";
	}

	/**
	 * 일반(세션) 로그인을 처리한다
	 *
	 * @param emfMap
	 * @param request
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
    @RequestMapping(value="/setLogin.do", method=RequestMethod.POST)
    public String actionLogin(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception {
    	String url = "error/blank.error";
    	try {
    		/*
    		일반 로그인
		   	EmfMap resultMap = lGAMemLoginService.actionLogin(emfMap, request);
		   	modelMap.addAttribute("msg", resultMap.get("msg"));
		   	modelMap.addAttribute("url", resultMap.get("url"));
		   	return EgovStringUtil.nullConvert( resultMap.get("vwUrl") );
		   	*/

    		// 통합 로그인
			EmfMap resultMap = lGAMemLoginService.actionIntegrationLogin(emfMap, request);

			modelMap.addAttribute("msg", resultMap.get("msg"));
			modelMap.addAttribute("url", resultMap.get("url"));
/** 2020년 보안 조치			
			modelMap.addAttribute("ci", resultMap.get("ci"));
			modelMap.addAttribute("id", resultMap.get("id"));
**/
			modelMap.addAttribute("token", resultMap.get("token"));

//			System.out.println("================setLogin.do===============");
//			System.out.println(modelMap);

			return EgovStringUtil.nullConvert( resultMap.get("vwUrl") );

    	} catch (Exception he) {
			if (log.isDebugEnabled()) log.debug(he);
			if("보안문자오류".equals(EgovStringUtil.nullConvert(he.getMessage()))) {
				modelMap.addAttribute("msg", "보안문자 입력이 올바르지 않습니다.");
				modelMap.addAttribute("url", "/member/login/Login.do");
			} else {
				throw new EmfException(he.getMessage());
			}
			return url;
		}
    }

	@RequestMapping(value="/setLogin_sso.do", method=RequestMethod.POST)
	public ModelAndView actionLoginSso(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception {
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("jsonView");
		try {
			// 통합 로그인
			EmfMap resultMap = lGAMemLoginService.actionLoginSso(emfMap, request);

			mav.addObject("msg", resultMap.get("msg"));
			mav.addObject("url", resultMap.get("vwUrl"));
/** 2020년 보안 조치			
			mav.addObject("ci", resultMap.get("ci"));
			mav.addObject("id", resultMap.get("id"));
**/
			mav.addObject("token", resultMap.get("token"));
			mav.addObject("serviceKey", resultMap.get("serviceKey"));
			mav.addObject("success", resultMap.get("success"));

		} catch (Exception he) {
			he.printStackTrace();
			if (log.isDebugEnabled()) log.debug(he);

			if("보안문자오류".equals(EgovStringUtil.nullConvert(he.getMessage()))) {
				mav.addObject("msg", "보안문자 입력이 올바르지 않습니다.");
				mav.addObject("url", "/member/login/Login.do");
				mav.addObject("success", false);
			} else {
				throw new EmfException(he.getMessage());
			}
		}

		return mav;
	}

	/**
	 * 일반(세션) 로그아웃을 처리한다
	 *
	 * @param emfMap
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
    @RequestMapping(value="/setLogout.do", method=RequestMethod.GET)
    public String actionLogout(EmfMap emfMap, HttpServletRequest request, ModelMap model) throws Exception {
    	try {
    		lGAMemLoginService.actionLogout(request);
		   //보안 처리(로그인 세션 변경)
		   if(request.getSession() != null) {
			   request.getSession().invalidate();
		   }
		   return "redirect:/";
    	} catch (Exception he) {
			if (log.isDebugEnabled()) log.debug(he);
			throw new EmfException(he.getMessage());
		} 	
    }

    @RequestMapping(value="/setLogout_sso.do", method=RequestMethod.GET)
    public String actionLogoutSso(EmfMap emfMap, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	try {
    		lGAMemLoginService.actionLogout(request);
		   //보안 처리(로그인 세션 변경)
		   if(request.getSession() != null) {
			   request.getSession().invalidate();
		   }

			// _tk cookie 삭제
			Cookie kc = new Cookie("_tk", null);
			kc.setMaxAge(0);
			kc.setPath("/");
			response.addCookie(kc);

			return "redirect:/";
    	} catch (Exception he) {
			if (log.isDebugEnabled()) log.debug(he);
			throw new EmfException(he.getMessage());
		} 	
    }

    /**
	 * 대리(세션) 로그인을 처리한다
	 *
	 * @param emfMap
	 * @param request
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/admin-login.do", method=RequestMethod.POST)
    public String actionProxyLogin(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception {
    	String url = "error/blank.error";
    	try {
    		//보안 처리(로그인 세션 변경)
    		if (request.getSession() != null) {
    			request.getSession().invalidate();
    		}
    		
    		String authKey = SeedCipher.encrypt("대명아임레디", "UTF-8");
    		
    		if(!authKey.equals(emfMap.getString("authKey"))) {
    			modelMap.addAttribute("msg", "잘못된 접근입니다.");
    			modelMap.addAttribute("url", "/main/index.do");
    		} else {
    			lGAMemLoginService.actionProxyLogin(emfMap, request);
    			url = "redirect:/my-lifeway/join-product-information/join-details/index.do";
//    			url = "redirect:/main/index.do";
    		}
    	} catch (Exception he) {
			if (log.isDebugEnabled()) log.debug(he);
			throw new EmfException(he.getMessage());
		} 	
    	return url;
    }

    @RequestMapping(value = "/auth.do")
	public String setAuth() {
    	System.out.println("/member/login/auth.do");
		return "front/lg/lga/auth.front";
	}

    
    private String getClientIP(){
    	String ip = null;
    	try {
			boolean isLoopBack = true;
			Enumeration<NetworkInterface> en;		
			en = NetworkInterface.getNetworkInterfaces();

			while(en.hasMoreElements()) {
				NetworkInterface ni = en.nextElement();
				if (ni.isLoopback())
					continue;

				Enumeration<InetAddress> inetAddresses = ni.getInetAddresses();
				while(inetAddresses.hasMoreElements()) { 
					InetAddress ia = inetAddresses.nextElement();
					if (ia.getHostAddress() != null && ia.getHostAddress().indexOf(".") != -1) {
						ip = ia.getHostAddress();
						isLoopBack = false;
						break;
					}
				}
				if (!isLoopBack)
					break;
			}
		} catch (SocketException e) {
			e.printStackTrace();
		} 	
    	return ip;
    }
}
