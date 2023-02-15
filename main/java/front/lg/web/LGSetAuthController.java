package front.lg.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 본인인증을 위한 Controller
 * </pre>
 * 
 * @ClassName		: LGSetAuthController.java
 * @Description		: 본인인증을 위한 Controller
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
@RequestMapping("/auth")
public class LGSetAuthController extends EmfController {

	/**
     * 휴대폰 본인인증 팝업 화면
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/phoneAuth.do")
	public String getPhoneAuth(EmfMap emfMap, ModelMap modelMap) throws Exception{
		return "front/okname/hs_cnfrm_popup2.pop";
	}

	@RequestMapping(value="/phoneAuth3.do")
	public String getPhoneAuth3(EmfMap emfMap, ModelMap modelMap) throws Exception{
		return "front/okname/hs_cnfrm_popup3.pop";
	}

	/**
     * 휴대폰 인증 결과 수신
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/getPhoneAuthInf.do")
	public String getPhoneAuthInf(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		String url = "error/blank.error";
		String ci = "", di = "", name = "", birth = "", telNo = "", sex = "";
		
		try
		{
			/*
			 * 본인인증 복호화 후 세션에 저장된 값을 가져와서 조회
			 */
			List result = new ArrayList(); 
			result = (List)RequestContextHolder.getRequestAttributes().getAttribute("phoneAuthInfo", RequestAttributes.SCOPE_SESSION);
			
			/**
			 *	인증 정보 저장
			 */
			if(emfMap.getString("ci") != "" && emfMap.getString("ci") != null){
				ci = result.get(5).toString(); 
				di = result.get(4).toString(); 
				name = result.get(7).toString();
				birth = result.get(8).toString();
				sex = result.get(9).toString();
				telNo = result.get(12).toString();
				
				emfMap.put("ci", ci);			// 인증 고유값
				emfMap.put("di", di);			// 회사별 인증 고유값
				emfMap.put("name", name);	// 이름
				emfMap.put("birth", birth);	// 생년월일
				emfMap.put("sex", sex);		// 성별(0 = 여자, 1 = 남자),
				emfMap.put("telNo", telNo);	// 핸드폰 번혼
				
				RequestContextHolder.getRequestAttributes().setAttribute("phoneAuthInfo", null, RequestAttributes.SCOPE_SESSION);
				RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", emfMap, RequestAttributes.SCOPE_SESSION);
				
				url = "redirect:" + emfMap.getString("returnMsg");	// 인증 후 처리되어야 할 url				
			}else{
				modelMap.addAttribute("msg", "인증을 다시 해주세요.");
				modelMap.addAttribute("url", "/");
			}
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return url;
	}	
	
	
	/**
     * 아이핀 본인인증 팝업 화면
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/ipinAuth.do")
	public String getIpinAuth(EmfMap emfMap, ModelMap modelMap) throws Exception{
		return "front/okname/ipin2.pop";
	}

	@RequestMapping(value="/ipinAuth2.do")
	public String getIpinAuth3(EmfMap emfMap, ModelMap modelMap) throws Exception{
		return "front/okname/ipin3.pop";
	}
	
	/**
     * 아이핀 인증 결과 수신
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/getIpinAuthInf.do")
	public String getIpinAuthInf(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		String url = "error/blank.error";
		String ci = "", di = "", name = "", birth = "", sex = "";
		try
		{
			/*
			 * 본인인증 복호화 후 세션에 저장된 값을 가져와서 조회
			 */
			List result = new ArrayList(); 
			result = (List)RequestContextHolder.getRequestAttributes().getAttribute("ipinAuthInfo", RequestAttributes.SCOPE_SESSION);
			
			/**
			 *	인증 정보 저장
			 */
			if(result.size() > 0){
				if(result.get(1).toString() != "" && result.get(1) != null){
					ci = result.get(1).toString();
					di = result.get(0).toString(); 
					name = result.get(6).toString();
					sex = result.get(9).toString();
					birth = result.get(11).toString();
					
					emfMap.put("ci", ci);			// 인증 고유값
					emfMap.put("di", di);			// 회사별 인증 고유값
					emfMap.put("name", name);	// 이름
					emfMap.put("birth", birth);	// 생년월일
					emfMap.put("sex", sex);		// 성별(0 = 여자, 1 = 남자),

					RequestContextHolder.getRequestAttributes().setAttribute("ipinAuthInfo", null, RequestAttributes.SCOPE_SESSION);
					RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", emfMap, RequestAttributes.SCOPE_SESSION);
					
					url = "redirect:" + emfMap.getString("returnMsg");	// 인증 후 처리되어야 할 url				
				}else{
					modelMap.addAttribute("msg", "인증을 다시 해주세요.1");
					modelMap.addAttribute("url", "/");
				}				
			}else{
				modelMap.addAttribute("msg", "인증을 다시 해주세요.2");
				modelMap.addAttribute("url", "/");
			}
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return url;
	}	
}
