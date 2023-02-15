package front.lg.lge.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.lg.lga.service.LGAMemLoginService;
import front.lg.lgb.service.LGBMemJoinService;

/**
 * <pre> 
 * 이전 회원 인증을 위한 Controller
 * </pre>
 * 
 * @ClassName		: LGEMemOldController.java
 * @Description		: 이전 회원 인증을 위한 Controller
 * @author 김필기
 * @since 2016.03.04
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.04		   김필기				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/member/old/")
public class LGEMemOldController extends EmfController {

	/** 서비스 **/
	@Resource(name="lGAMemLoginService")
    private LGAMemLoginService lGAMemLoginService;
	
	/** 서비스 **/
	@Resource(name="lGBMemJoinService")
    private LGBMemJoinService lGBMemJoinService;
	
	
	/**
     * 이전 회원 인증 화면
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/index.do")
	public String getMemOldView(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/lg/lge/LGEMemOld.front";
	}    
	
	/**
     * 본인 인증 후 결과 처리
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/checkAuth.do")
	public String getPhoneAuthInf(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		String url = "error/blank.error";
		String id = "", ci = "";
		try
		{
			EmfMap authMap = (EmfMap)EgovUserDetailsHelper.getIndividualInfAuth();	// 본인인증 후 넘어온 값
			EmfMap compareMap = (EmfMap)RequestContextHolder.getRequestAttributes().getAttribute("compareMap", RequestAttributes.SCOPE_SESSION);	// 로그인 후 넘어온 비교값
			
			if(authMap != null && compareMap != null){
				id = compareMap.getString("id");
				ci = compareMap.getString("ci");
				
				if(ci.equals(authMap.getString("ci"))){
					emfMap.put("id", id);
					emfMap.put("oldAuthYn", "Y");
					
					modelMap.addAttribute("msg", "본인인증이 완료되었습니다. 비밀번호 변경화면으로 이동합니다.");
					modelMap.addAttribute("url", "/member/old/changepass/index.do");
				}else{
					RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
					RequestContextHolder.getRequestAttributes().setAttribute("compareMap", null, RequestAttributes.SCOPE_SESSION);
					modelMap.addAttribute("msg", "가입된 정보와 일치하지 않습니다.관리자에게 문의하여 주세요.");
					modelMap.addAttribute("url", "/member/login/Login.do");
				}
										
			}else{
				if(compareMap == null){
					modelMap.addAttribute("msg", "인증 시간이 지체되어 인증에 실패했습니다. 다시 로그인해주세요.");
				}else{
					modelMap.addAttribute("msg", "인증에 실패했습니다. 다시 로그인해주세요.");
				}				
				modelMap.addAttribute("url", "/member/login/Login.do");
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
	
	@RequestMapping(value="/changepass/index.do")
	public String getMemOldChangePwdView(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/lg/lge/LGEMemOldChangePwd.front";
	}
	
	/**
     * 비밀번호 변경
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/changepass/complete.do")
	public String updateFindPassChange(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		String url = "error/blank.error";
		try
		{
			EmfMap compareMap = (EmfMap)RequestContextHolder.getRequestAttributes().getAttribute("compareMap", RequestAttributes.SCOPE_SESSION);	// 로그인 후 넘어온 비교값
			
			if(compareMap != null){
				emfMap.put("id", compareMap.getString("id"));
				emfMap.put("ci", compareMap.getString("ci"));
				
				lGBMemJoinService.updateMemPwdInf(emfMap);		// 비밀번호 변경
				
				emfMap.put("oldAuthYn", "Y");								// 인증여부
				lGAMemLoginService.updateMemInfQscn(emfMap);		// 이전 회원 인증 여부 변경
				
				modelMap.addAttribute("msg", "비밀번호가 변경되었습니다.");
				modelMap.addAttribute("url", "/main/index.do");
				
				RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
				RequestContextHolder.getRequestAttributes().setAttribute("compareMap", null, RequestAttributes.SCOPE_SESSION);				
			}else{
				url = "redirect:/member/login/Login.do";
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
