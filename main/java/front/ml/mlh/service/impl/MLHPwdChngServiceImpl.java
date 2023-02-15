package front.ml.mlh.service.impl;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovNetworkState;
import egovframework.com.utl.sim.service.SeedCipher;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.lg.sso.exception.SsoException;
import front.lg.sso.service.SSOService;
import front.ml.mlh.service.MLHPwdChngService;
import front.ml.mlh.service.dao.MLHPwdChngDAO;

/**
 * <pre> 
 * 비밀번호 변경을 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: MLHPwdChngServiceImpl.java
 * @Description		: 비밀번호 변경을 위한 ServiceImpl
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
@Service("mLHPwdChngService")
public class MLHPwdChngServiceImpl extends EmfAbstractService implements MLHPwdChngService {	

	@Resource(name="mLHPwdChngDAO")
	private MLHPwdChngDAO mLHPwdChngDAO;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

	@Resource(name = "ssoService")
	private SSOService ssoService;

	/**
	 * 비밀번호 변경
	 * @param emfMap
	 * @return
	 * @throws Exception
	 */
	public EmfMap updatePwdChng(EmfMap emfMap) throws Exception {
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		emfMap.put("id", lgnMap.getString("integrationId"));
		//단방향 암호화 처리
    	emfMap.put("pwd", SeedCipher.oneencrypt(emfMap.getString("exisPwd")));
    	
    	//비밀번호를 변경을 위한 유효성 체크
    	int rtnCnt = mLHPwdChngDAO.selectMemInfChk(emfMap);
    	
		Pattern p = Pattern.compile("^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{6,16}$");
		Matcher m = p.matcher(emfMap.getString("newPwd"));
    	if (rtnCnt < 1) {
    		emfMap.put("msg", "기존 비밀번호가 맞지 않습니다.");
    		emfMap.put("url", "/my-lifeway/member/password-change/index.do");
    	} else if (!emfMap.getString("newPwd").equals(emfMap.getString("newPwdConfirm"))) {
    		emfMap.put("msg", "비밀번호와 비밀번호 확인이 일치하지 않습니다.");
    		emfMap.put("url", "/my-lifeway/member/password-change/index.do");
    	} else if (m.find() == false) {
    		emfMap.put("msg", "패스워드 입력값이 올바르지 않습니다. 비밀번호는 영문 대/소문자, 숫자, 특수문자(!@#$%^&*+=)를 조합하여 6~16자로 입력합니다.");
    		emfMap.put("url", "/my-lifeway/member/password-change/index.do");
    	} else {
    		//단방향 암호화 처리
	    	emfMap.put("pwd", SeedCipher.oneencrypt(emfMap.getString("newPwd")));

			emfMap.put("homepageId", lgnMap.getString("homepageId"));
	    	emfMap.put("modId", lgnMap.getString("homepageId"));
	    	emfMap.put("modIp", lgnMap.getString("loginIp"));
    
	    	mLHPwdChngDAO.updatePwdChng(emfMap);
			mLHPwdChngDAO.updatePwdIntegrationUser(emfMap);
	    	
	    	emfMap.put("msg", "비밀번호 변경이 완료되었습니다.");
	    	emfMap.put("url", "/my-lifeway/join-product-information/join-details/index.do");
	    	
			/*
			 홈페이지 개인정보 로그 - 보안관련 로직 신규 구현
			 2017.12.26
			 */
			EmfMap userLgnMap = (EmfMap) RequestContextHolder.getRequestAttributes().getAttribute("userLgnMap", RequestAttributes.SCOPE_SESSION);
			if(userLgnMap != null) {
				RequestContextHolder.getRequestAttributes().setAttribute("logIp", userLgnMap.getString("loginIp"), RequestAttributes.SCOPE_SESSION);
				RequestContextHolder.getRequestAttributes().setAttribute("logName", userLgnMap.getString("name"), RequestAttributes.SCOPE_SESSION);
				RequestContextHolder.getRequestAttributes().setAttribute("logHp", userLgnMap.getString("hp"), RequestAttributes.SCOPE_SESSION);
				RequestContextHolder.getRequestAttributes().setAttribute("logId", userLgnMap.getString("id"), RequestAttributes.SCOPE_SESSION);
				RequestContextHolder.getRequestAttributes().setAttribute("unqNo", userLgnMap.getString("unqNo"), RequestAttributes.SCOPE_SESSION);
			}

			EmfMap logMap = new EmfMap();
			logMap.put("ip", RequestContextHolder.getRequestAttributes().getAttribute("logIp", RequestAttributes.SCOPE_SESSION));
			logMap.put("gubun", "나의 라이프웨이 - 회원정보 관리 - 비밀번호 변경");
			logMap.put("flag", "M");
			logMap.put("pageGubun", "H");
			logMap.put("name", lgnMap.getString("name"));
			logMap.put("hp", lgnMap.getString("hp"));
			logMap.put("id", lgnMap.getString("id"));
			cmmUseService.actionViewAuthLog(logMap);
    	}
    	
    	return emfMap;
	}

	/**
	 * 비밀번호 변경 - SSO
	 * @param emfMap
	 * @return
	 * @throws Exception
	 */
	public EmfMap updatePwdChngSso(EmfMap emfMap, HttpServletRequest request) throws Exception
	{
		if (!emfMap.getString("newPwd").equals(emfMap.getString("newPwdConfirm")))
		{
    		emfMap.put("msg", "기존 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.");
    		emfMap.put("url", "/my-lifeway/member/password-change/index.do");

    		return emfMap;
		}

		Pattern p = Pattern.compile("^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{6,16}$");
		Matcher m = p.matcher(emfMap.getString("newPwd"));
		if (m.find() == false)
		{
    		emfMap.put("msg", "패스워드 입력값이 올바르지 않습니다. 비밀번호는 영문 대/소문자, 숫자, 특수문자(!@#$%^&*+=)를 조합하여 6~16자로 입력합니다.");
    		emfMap.put("url", "/my-lifeway/member/password-change/index.do");

    		return emfMap;
		}
		
		
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
    	
		String id = (String)lgnMap.getString("integrationId");
		String ci = (String)lgnMap.getString("ci");
		String clientIp = EgovNetworkState.getMyIPaddress(request);
		String oldPwd = SeedCipher.oneencrypt(emfMap.getString("exisPwd"));		// 비밀번호 암호화
		String newPwd = SeedCipher.oneencrypt(emfMap.getString("newPwd"));		// 비밀번호 암호화
		try
		{
    		ssoService.updatePassword(id, ci, null, oldPwd, newPwd, clientIp);

    		//단방향 암호화 처리
	    	emfMap.put("pwd", newPwd);
			emfMap.put("homepageId", id);
	    	emfMap.put("modId", id);
	    	emfMap.put("modIp", clientIp);
    
	    	mLHPwdChngDAO.updatePwdChng(emfMap);
	    	
	    	emfMap.put("msg", "비밀번호 변경이 완료되었습니다.");
	    	emfMap.put("url", "/my-lifeway/join-product-information/join-details/index.do");
	    	
			/*
			 홈페이지 개인정보 로그 - 보안관련 로직 신규 구현
			 2017.12.26
			 */
			EmfMap userLgnMap = (EmfMap) RequestContextHolder.getRequestAttributes().getAttribute("userLgnMap", RequestAttributes.SCOPE_SESSION);
			if(userLgnMap != null) {
				RequestContextHolder.getRequestAttributes().setAttribute("logIp", userLgnMap.getString("loginIp"), RequestAttributes.SCOPE_SESSION);
				RequestContextHolder.getRequestAttributes().setAttribute("logName", userLgnMap.getString("name"), RequestAttributes.SCOPE_SESSION);
				RequestContextHolder.getRequestAttributes().setAttribute("logHp", userLgnMap.getString("hp"), RequestAttributes.SCOPE_SESSION);
				RequestContextHolder.getRequestAttributes().setAttribute("logId", userLgnMap.getString("id"), RequestAttributes.SCOPE_SESSION);
				RequestContextHolder.getRequestAttributes().setAttribute("unqNo", userLgnMap.getString("unqNo"), RequestAttributes.SCOPE_SESSION);
			}

			EmfMap logMap = new EmfMap();
			logMap.put("ip", EgovNetworkState.getMyIPaddress(request));
			logMap.put("gubun", "나의 라이프웨이 - 회원정보 관리 - 비밀번호 변경");
			logMap.put("flag", "M");
			logMap.put("pageGubun", "H");
			logMap.put("name", lgnMap.getString("name"));
			logMap.put("hp", lgnMap.getString("hp"));
			logMap.put("id", lgnMap.getString("id"));
			cmmUseService.actionViewAuthLog(logMap);
		}
		catch (SsoException ex)
		{
			if (ex.getMessage().equals("R1220"))
			{
	    		emfMap.put("msg", "기존 비밀번호가 맞지 않습니다.");
			}
			else if (ex.getMessage().equals("R1200"))
			{
	    		emfMap.put("msg", "중복 아이디가 존재합니다.");
			}
			else
			{
	    		emfMap.put("msg", "에러가 발생하였습니다.");
			}
    		emfMap.put("url", "/my-lifeway/member/password-change/index.do");
		}

    	return emfMap;
	}

}
