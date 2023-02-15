package front.ml.mlh.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import egovframework.com.cmm.util.EgovUserDetailsHelper;

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
import front.ml.mlh.service.MLHMemDrotService;

/**
 * <pre> 
 * 회원탈퇴를 위한 Controller
 * </pre>
 * 
 * @ClassName		: MLHMemDrotController.java
 * @Description		: 회원탈퇴를 위한 Controller
 * @author 허진영
 * @since 2016.03.08
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.08		   허진영				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/my-lifeway/member/drop-out")
public class MLHMemDrotController extends EmfController {	
	
	/** 서비스 **/
	@Resource(name="mLHMemDrotService")
    private MLHMemDrotService mLHMemDrotService;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

	/**
	 * 회원탈퇴 페이지.
	 *
	 * @param emfMap
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/index.do")
	public String getMemDrotWritePage(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception {
		/*
		 홈페이지 개인정보 로그 - 보안관련 로직 신규 구현
		 2017.12.26
		*/
		EmfMap lgnMap = (EmfMap) RequestContextHolder.getRequestAttributes().getAttribute("userLgnMap", RequestAttributes.SCOPE_SESSION);
		EmfMap logMap = new EmfMap();
		logMap.put("ip", EgovNetworkState.getMyIPaddress(request));
		logMap.put("gubun", "나의 라이프웨이 - 회원정보 관리 - 회원탈퇴");
		logMap.put("flag", "S");
		logMap.put("pageGubun", "H");
		logMap.put("name", lgnMap.getString("name"));
		logMap.put("hp", lgnMap.getString("hp"));
		logMap.put("id", lgnMap.getString("id"));
		cmmUseService.actionViewAuthLog(logMap);

		return "front/ml/mlh/MLHMemDrotWrite.front";
	}

	/**
	 * 회원탈퇴
	 *
	 * @param emfMap
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String updateMemDrot(EmfMap emfMap, ModelMap modelMap) throws Exception {
		String url = "error/blank.error";
		try {
			mLHMemDrotService.updateMemDrot(emfMap);
			modelMap.addAttribute("msg", "회원탈퇴가 완료되었습니다.");
			modelMap.addAttribute("url", "/member/login/setLogout.do");
		} catch (Exception he) {
			if (log.isDebugEnabled()) log.debug(he);
			throw new EmfException(he.getMessage());
		} 
		return url;
	}

	/**
	 * 회원탈퇴 - SSO
	 *
	 * @param emfMap
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/update_sso.do", method=RequestMethod.POST)
	public String updateMemDrotSso(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "error/blank.error";
		try {
			mLHMemDrotService.updateMemDrotSso(emfMap, request, response);
			modelMap.addAttribute("msg", "회원탈퇴가 완료되었습니다.");
			modelMap.addAttribute("url", "/member/login/setLogout.do");
		} catch (Exception he) {
			if (log.isDebugEnabled()) log.debug(he);
			throw new EmfException(he.getMessage());
		} 
		return url;
	}

}
