package front.lg.lgd.web;

import javax.annotation.Resource;

import front.lg.lgd.service.LGDMemQscnService;
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

/**
 * <pre> 
 * 휴면 계정 인증을 위한 Controller
 * </pre>
 * 
 * @ClassName		: LGDMemQscnController.java
 * @Description		: 휴면 계정 인증을 위한 Controller
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
@RequestMapping("/member/qscn/")
public class LGDMemQscnController extends EmfController {
	
	@Resource(name="lGAMemLoginService")
    private LGAMemLoginService lGAMemLoginService;

	@Resource(name="lGDMemQscnService")
	private LGDMemQscnService lGDMemQscnService;
	
	/**
     * 휴면계정 인증 화면
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/index.do")
	public String getQuiescencyView(EmfMap emfMap, ModelMap modelMap) throws Exception {
		return "front/lg/lgd/LGDMemQscn.front";
	}    
	
	/**
     * 본인 인증 후 결과 처리
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/checkAuth.do")
	public String getPhoneAuthInf(EmfMap emfMap, ModelMap modelMap) throws Exception {
		String url = "error/blank.error";
		String id = "", ci = "";
		try {
			EmfMap authMap = (EmfMap)EgovUserDetailsHelper.getIndividualInfAuth();	// 본인인증 후 넘어온 값
			EmfMap compareMap = (EmfMap)RequestContextHolder.getRequestAttributes().getAttribute("compareMap", RequestAttributes.SCOPE_SESSION);	// 로그인 후 넘어온 비교값
			
			id = compareMap.getString("id");
			ci = compareMap.getString("ci");
			
			if (ci.equals(authMap.getString("ci"))) {
				emfMap.put("id", id);
				emfMap.put("qscnYn", "N");

				lGDMemQscnService.changeQscnUserToActiveUser(id, ci);
				lGAMemLoginService.updateMemInfQscn(emfMap);
				
				modelMap.addAttribute("msg", "본인인증이 완료되었습니다. 휴면 계정이 해제되었습니다.");
			} else {
				modelMap.addAttribute("msg", "가입된 정보와 일치하지 않습니다.관리자에게 문의하여 주세요.");				
			}
			
			RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
			RequestContextHolder.getRequestAttributes().setAttribute("compareMap", null, RequestAttributes.SCOPE_SESSION);
			
			modelMap.addAttribute("url", "/member/login/Login.do");			
		} catch (Exception he) {
			if (log.isDebugEnabled()) log.debug(he);
			throw new EmfException(he.getMessage());
		} 
		return url;
	}		
}
