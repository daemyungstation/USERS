package front.ml.mlh.service.impl;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import front.lg.lgb.service.dao.LGBMemJoinDAO;
import front.lg.sso.service.SSOService;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.MailService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovNetworkState;
import egovframework.com.utl.sim.service.SeedCipher;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.ml.mlh.service.MLHMemDrotService;
import front.ml.mlh.service.dao.MLHMemDrotDAO;

import java.util.HashMap;
import java.util.List;

/**
 * <pre> 
 * 회원탈퇴를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: MLHMemDrotServiceImpl.java
 * @Description		: 회원탈퇴를 위한 ServiceImpl
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
@Service("mLHMemDrotService")
public class MLHMemDrotServiceImpl extends EmfAbstractService implements MLHMemDrotService {	

	@Resource(name="mLHMemDrotDAO")
	private MLHMemDrotDAO mLHMemDrotDAO;
	
	@Resource(name="mailService")
	private MailService mailService;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

	@Resource(name = "lGBMemJoinDAO")
	private LGBMemJoinDAO lGBMemJoinDAO;

	@Resource(name = "ssoService")
	private SSOService ssoService;

	private String ENCODE = EgovProperties.getProperty("Global.CHARCODE");

	/**
	 * 회원몰에서 탈퇴한 유저라면 홈페이지 회원 정보 탈퇴 처리
	 *
	 * @param ci
	 * @throws Exception
	 */
	public void selectIntegrationDeleteMemberInfo(String ci) throws Exception {
		List<EmfMap> dropMemberList = lGBMemJoinDAO.selectIntegrationDeleteMemberInfo(ci);
		if (dropMemberList.size() > 0) {
			for (EmfMap dropMember : dropMemberList) {
				dropMember.put("drotRsn", "기타");
				dropMember.put("drotRsnEtc", "회원몰 탈퇴");
				updateMemDrot(dropMember);
			}
		}
	}

	/**
	 * 회원탈퇴
	 *
	 * @param emfMap
	 * @throws Exception
	 */
	public void updateMemDrot(EmfMap emfMap) throws Exception {
//		System.out.print("updateMemDrot :: ");
//		System.out.println(emfMap);
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		if (lgnMap == null) {
			emfMap.put("id", emfMap.get("homepageId"));
		} else {
			emfMap.put("integrationId", lgnMap.get("integrationId"));
			emfMap.put("id", lgnMap.get("homepageId"));
		}

		//회원탈퇴를 한다.
		lGBMemJoinDAO.dropIntegrationInfo(emfMap);

		mLHMemDrotDAO.updateMemDrot(emfMap);
		//회원 탈퇴 테이블로 이관 후 회원정보 테이블에서 삭제
		//2017-12-28 개인정보 보호에 의한 프로그램 수정
		//----------------------------------------
		mLHMemDrotDAO.insertMemDropInfo(emfMap);
		mLHMemDrotDAO.deleteMemDrot(emfMap);
		mLHMemDrotDAO.deleteMemEtcDrot(emfMap.getString("id"));
		//----------------------------------------
		
		//부가식별정보를 삭제한다.
		mLHMemDrotDAO.deleteIdntInf(emfMap);

		if (lgnMap != null) {
			if (!"".equals(EMFStringUtil.nullConvert(lgnMap.get("email")))) {
				EmfMap mailMap = new EmfMap();
				mailMap.put("subject", "[대명아임레디 회원 탈퇴 완료] 메일입니다.");
				mailMap.put("toUser", lgnMap.getString("email"));
				mailMap.put("name", lgnMap.getString("name"));

				mailService.sendTempleteMail(mailMap, "ml/mlh/MLHMemDrotComp.html");
			}

		/*
		 홈페이지 개인정보 로그 - 보안관련 로직 신규 구현
		 2017.12.26
		 */
			EmfMap logMap = new EmfMap();
			logMap.put("ip", RequestContextHolder.getRequestAttributes().getAttribute("logIp", RequestAttributes.SCOPE_SESSION));
			logMap.put("gubun", "나의 라이프웨이 - 회원정보 관리 - 회원탈퇴");
			logMap.put("flag", "W");
			logMap.put("pageGubun", "H");
			logMap.put("name", lgnMap.getString("name"));
			logMap.put("hp", lgnMap.getString("hp"));
			logMap.put("id", lgnMap.getString("id"));
			cmmUseService.actionViewAuthLog(logMap);
		}
	}

	/**
	 * 회원탈퇴 - SSO
	 *
	 * @param emfMap
	 * @throws Exception
	 */
	public void updateMemDrotSso(EmfMap emfMap, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();

		// SSO 회원 조회
		String clientIp = EgovNetworkState.getMyIPaddress(request);
		HashMap ssoMemberInfo = ssoService.find(lgnMap.getString("integrationId"), null, null, clientIp);

		if (ssoMemberInfo != null)
		{
//			System.out.print("ssoMemberInfo :: ");
//			System.out.println(ssoMemberInfo);

			if (ssoMemberInfo.get("id") != null && ssoMemberInfo.get("id") != "") //SSO 회원 존재
			{
				ssoService.drop((String)ssoMemberInfo.get("id"), (String)ssoMemberInfo.get("uid"), clientIp);

				// _tk cookie 삭제
				Cookie kc = new Cookie("_tk", null);
				kc.setMaxAge(0);
				kc.setPath("/");
				response.addCookie(kc);
			}
		}
		
		emfMap.put("id", lgnMap.getString("id"));
		mLHMemDrotDAO.updateMemDrot(emfMap);
		//회원 탈퇴 테이블로 이관 후 회원정보 테이블에서 삭제
		//2017-12-28 개인정보 보호에 의한 프로그램 수정
		//----------------------------------------
		mLHMemDrotDAO.insertMemDropInfo(emfMap);
		mLHMemDrotDAO.deleteMemDrot(emfMap);
		mLHMemDrotDAO.deleteMemEtcDrot(emfMap.getString("id"));
		//----------------------------------------
		
		//부가식별정보를 삭제한다.
		mLHMemDrotDAO.deleteIdntInf(emfMap);

		if (lgnMap != null) {
			if (!"".equals(EMFStringUtil.nullConvert(lgnMap.get("email")))) {
				EmfMap mailMap = new EmfMap();
				mailMap.put("subject", "[대명아임레디 회원 탈퇴 완료] 메일입니다.");
				mailMap.put("toUser", lgnMap.getString("email"));
				mailMap.put("name", lgnMap.getString("name"));

				mailService.sendTempleteMail(mailMap, "ml/mlh/MLHMemDrotComp.html");
			}

		/*
		 홈페이지 개인정보 로그 - 보안관련 로직 신규 구현
		 2017.12.26
		 */
			EmfMap logMap = new EmfMap();
			logMap.put("ip", EgovNetworkState.getMyIPaddress(request));
			logMap.put("gubun", "나의 라이프웨이 - 회원정보 관리 - 회원탈퇴");
			logMap.put("flag", "W");
			logMap.put("pageGubun", "H");
			logMap.put("name", lgnMap.getString("name"));
			logMap.put("hp", lgnMap.getString("hp"));
			logMap.put("id", lgnMap.getString("id"));
			cmmUseService.actionViewAuthLog(logMap);
		}
	}

}
