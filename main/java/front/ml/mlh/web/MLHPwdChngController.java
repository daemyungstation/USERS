package front.ml.mlh.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.utl.sim.service.EgovNetworkState;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.ml.mlh.service.MLHPwdChngService;

/**
 * <pre> 
 * 비밀번호 변경을 위한 Controller
 * </pre>
 * 
 * @ClassName		: MLHPwdChngController.java
 * @Description		: 비밀번호 변경을 위한 Controller
 * @author 허진영
 * @since 2016.03.04
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.04		   허진영				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/my-lifeway/member/password-change")
public class MLHPwdChngController extends EmfController {	
	
	/** 서비스 **/
	@Resource(name="mLHPwdChngService")
    private MLHPwdChngService mLHPwdChngService;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

	/**
	 * 비밀번호 변경 페이지
	 *
	 * @param emfMap
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/index.do")
	public String getPwdChngWritePage(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception {
		/*
		 홈페이지 개인정보 로그 - 보안관련 로직 신규 구현
		 2017.12.26
		 */
		try {
			EmfMap lgnMap = (EmfMap) RequestContextHolder.getRequestAttributes().getAttribute("userLgnMap", RequestAttributes.SCOPE_SESSION);
			EmfMap logMap = new EmfMap();
			logMap.put("ip", EgovNetworkState.getMyIPaddress(request));
			logMap.put("gubun", "나의 라이프웨이 - 회원정보 관리 - 비밀번호 변경");
			logMap.put("flag", "S");
			logMap.put("pageGubun", "H");
			logMap.put("name", lgnMap.getString("name"));
			logMap.put("hp", lgnMap.getString("hp"));
			logMap.put("id", lgnMap.getString("id"));
			cmmUseService.actionViewAuthLog(logMap);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "front/ml/mlh/MLHPwdChngWrite.front";
	}

	/**
	 * 비밀번호를 변경한다
	 *
	 * @param emfMap
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String updatePwdChng(EmfMap emfMap, ModelMap modelMap) throws Exception {
		String url = "error/blank.error";
		try {
			EmfMap rtnMap = mLHPwdChngService.updatePwdChng(emfMap);
			modelMap.addAttribute("msg", rtnMap.getString("msg"));
			modelMap.addAttribute("url", rtnMap.getString("url"));
		} catch (Exception he) {
			if (log.isDebugEnabled()) log.debug(he);
			throw new EmfException(he.getMessage());
		} 
		return url;
	}

	/**
	 * 비밀번호를 변경한다 - SSO
	 *
	 * @param emfMap
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/update_sso.do", method=RequestMethod.POST)
	public String updatePwdChngSso(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception {
		String url = "error/blank.error";
		try {
			
			EmfMap rtnMap = mLHPwdChngService.updatePwdChngSso(emfMap, request);
			modelMap.addAttribute("msg", rtnMap.getString("msg"));
			modelMap.addAttribute("url", rtnMap.getString("url"));
		} catch (Exception he) {
			if (log.isDebugEnabled()) log.debug(he);
			throw new EmfException(he.getMessage());
		} 
		return url;
	}

}
