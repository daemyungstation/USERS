package front.lg.lgb.service.impl;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import front.lg.lga.service.dao.LGAMemLoginDAO;
import front.lg.sso.exception.SsoException;
import front.lg.sso.service.SSOService;
import front.ml.mlh.service.dao.MLHMemDrotDAO;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.MailService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovNetworkState;
import egovframework.com.utl.sim.service.SeedCipher;
import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.lg.lgb.service.DMLifeMemService;
import front.lg.lgb.service.LGBMemJoinService;
import front.lg.lgb.service.dao.LGBMemJoinDAO;
import front.ml.mlh.service.dao.MLHPrsnDataChngDAO;

/**
 * <pre>
 * 회원 가입을 위한 ServiceImpl
 * </pre>
 *
 * @ClassName		: LGBMemJoinServiceImpl.java
 * @Description		: 회원 가입을 위한 ServiceImpl
 * @author 김필기
 * @since 2016.03.02
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.02		   김필기				  최초 생성
 * </pre>
 */
@Service("lGBMemJoinService")
public class LGBMemJoinServiceImpl extends EmfAbstractService implements LGBMemJoinService {

	@Resource(name="lGBMemJoinDAO")
	private LGBMemJoinDAO lGBMemJoinDAO;

	@Resource(name="mLHPrsnDataChngDAO")
	private MLHPrsnDataChngDAO mLHPrsnDataChngDAO;

	@Resource(name="dMLifeMemService")
    private DMLifeMemService dMLifeMemService;

	@Resource(name = "lGAMemLoginDAO")
	private LGAMemLoginDAO lGAMemLoginDAO;

	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

	@Resource(name = "ssoService")
	private SSOService ssoService;

	@Resource(name = "mLHMemDrotDAO")
	private MLHMemDrotDAO mLHMemDrotDAO;

	@Resource(name = "lGBMemJoinService")
	private LGBMemJoinService lGBMemJoinService;


	/*메일 service*/
    @Resource(name="mailService")
	private MailService mailService;

	private String ENCODE = EgovProperties.getProperty("Global.CHARCODE");

	@Resource(name="memChngIdgen")
	private EgovTableIdGnrService memChngIdgen;


	/**
	 * 회원 정보를 등록한다.
	 *
	 * @param emfMap
	 * @param request
	 * @return List<EmfMap>
	 * @throws Exception 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertMemInf(EmfMap emfMap, HttpServletRequest request) throws Exception {
		String email = emfMap.getString("email");

		// 본인 인증 후 세션에 저장된 정보를 가져온다(이름, 생년월일)
		EmfMap authMap = (EmfMap) EgovUserDetailsHelper.getIndividualInfAuth();

		emfMap.put("name", authMap.getString("name"));
		emfMap.put("birth", authMap.getString("birth"));
		emfMap.put("ci", authMap.getString("ci"));
		emfMap.put("di", authMap.getString("di"));
		emfMap.put("sex", authMap.getString("sex"));

		// 가입 아이디 및 ip
		emfMap.put("regId", emfMap.getString("id"));
		emfMap.put("regIp", EgovNetworkState.getMyIPaddress(request));
		emfMap.put("modId", emfMap.getString("regId"));
		emfMap.put("modIp", emfMap.getString("regIp"));
		emfMap.put("agreementForThirdParty", request.getParameter("agreementForThirdParty"));
		emfMap.put("marketingYn", emfMap.get("marketingYn"));

		// 고유번호 전산db에서 가져오기(이름, 생년월일, 핸드폰 번호가 일치하는 회원 정보)
		EmfMap dmLifeMemInf = new EmfMap();

		dmLifeMemInf.put("join", true);
		dmLifeMemInf.put("name", authMap.getString("name"));
		dmLifeMemInf.put("hp", authMap.getString("telNo"));
		dmLifeMemInf.put("birth", authMap.getString("birth"));

		List<EmfMap> dmInfo = (List) dMLifeMemService.selectDMLifeMemInf(dmLifeMemInf).get("info");
		if (dmInfo.size() > 0) {
			dmLifeMemInf = dmInfo.get(0);
		} else {
			dmLifeMemInf = null;
		}

		if(dmLifeMemInf != null) {
			emfMap.put("unqNo", dmLifeMemInf.getString("memNo"));
		}

		// 비번, 이메일, 핸드폰, 전화번호, 상세주소 암호화
		if(!"".equals(emfMap.getString("pwd"))) {
			emfMap.put("pwd", SeedCipher.oneencrypt(emfMap.getString("pwd")));				// 비밀번호 암호화(단방향)
		}

		if ("".equals(emfMap.getString("telRcvYn"))) {
			emfMap.put("telRcvYn", "N");
		}
		if ("".equals(emfMap.getString("smsRcvYn"))) {
			emfMap.put("smsRcvYn", "N");
		}
		if ("".equals(emfMap.getString("emailRcvYn"))) {
			emfMap.put("emailRcvYn", "N");
		}
		if ("".equals(emfMap.getString("ctlgRcvYn"))) {
			emfMap.put("ctlgRcvYn", "N");
		}

		lGBMemJoinDAO.insertMemInf(emfMap);		// 회원정보 등록
		// 통합회원 테이블 등록
		lGBMemJoinDAO.insertIntegrationMemInf(emfMap);

		String[] srvcRcvGb = EgovProperties.getProperty("Globals.srvcRcvGb").split(",");

		//고객서비스 수신동의 최초 로그를 등록한다.
		for (int i = 0; i < srvcRcvGb.length; i++) {
			emfMap.put("rcvGb", srvcRcvGb[i]);
			emfMap.put("regId", emfMap.getString("id"));
			emfMap.put("regIp", EgovNetworkState.getMyIPaddress(request));
			emfMap.put("modId", emfMap.getString("regId"));
			emfMap.put("modIp", emfMap.getString("regIp"));

			mLHPrsnDataChngDAO.insertInitialSrvcRcvModLog(emfMap);
		}

		// 관심분야 setting
//		List<String> intrFields = emfMap.getList("intrField");
//		String intrField = "";
//		for(int i = 0; i < intrFields.size(); i++) {
//			if (i == 0) intrField = intrFields.get(i);
//			else intrField = intrField.concat("|" + intrFields.get(i));
//		}

		emfMap.put("intrField", null);

		// 옵션 관심분야 setting
//		List<String> optionIntrFields = emfMap.getList("optionintrfield");
//		String optionIntrField = "";
//		for (int i = 0; i < optionIntrFields.size(); i++) {
//			if (i == 0) optionIntrField = optionIntrFields.get(i);
//			else optionIntrField = optionIntrField.concat("|" + optionIntrFields.get(i));
//		}

		emfMap.put("optionintrfield", null);

		//관심내역 setting
//		List<String> intrPtcs = emfMap.getList("intrPtc");
//		String intrPtc = "";
//		for (int i = 0; i < intrPtcs.size(); i++) {
//			if (i == 0) {
//				intrPtc = intrPtcs.get(i);
//			} else {
//				intrPtc = intrPtc.concat(", " + intrPtcs.get(i));
//			}
//		}
		emfMap.put("intrPtc", null);

		//선호내역 setting
//		List<String> pfrnPtcs = emfMap.getList("pfrnPtc");
//		String pfrnPtc = "";
//		for (int i = 0; i < pfrnPtcs.size(); i++) {
//			if (i == 0) {
//				pfrnPtc = pfrnPtcs.get(i);
//			} else {
//				pfrnPtc = pfrnPtc.concat(", " + pfrnPtcs.get(i));
//			}
//		}
		emfMap.put("pfrnPtc", null);
		emfMap.put("joinPath", null);
		emfMap.put("joinPathEtc", null);
		emfMap.put("pfrnEtc", null);
		emfMap.put("mrrgYn", emfMap.get("mrrgYn"));
		emfMap.put("chdrnGb", emfMap.get("chdrnGb"));

		lGBMemJoinDAO.insertMemEtcInf(emfMap);	// 기타정보 등록
		lGBMemJoinDAO.insertIdntInf(emfMap);	// 본인인증 로그

		if (!"".equals(emfMap.getString("unqNo"))) {
			// 고유번호가 있을시 변경정보 등록
			EmfMap chngPtcMap = new EmfMap();

			chngPtcMap.put("seq", memChngIdgen.getNextIntegerId());
			chngPtcMap.put("id", emfMap.getString("id"));
			chngPtcMap.put("bfrEmail", emfMap.getString("email"));
			chngPtcMap.put("bfrHp", emfMap.getString("hp"));
			chngPtcMap.put("bfrTel", emfMap.getString("tel"));
			chngPtcMap.put("bfrZipcd", emfMap.getString("zipcd"));
			chngPtcMap.put("bfrAdr", emfMap.getString("adr"));
			chngPtcMap.put("bfrAdrDtl", emfMap.getString("adrDtl"));
			chngPtcMap.put("aftEmail", emfMap.getString("email"));
			chngPtcMap.put("aftHp", emfMap.getString("hp"));
			chngPtcMap.put("aftTel", emfMap.getString("tel"));
			chngPtcMap.put("aftZipcd", emfMap.getString("zipcd"));
			chngPtcMap.put("aftAdr", emfMap.getString("adr"));
			chngPtcMap.put("aftAdrDtl", emfMap.getString("adrDtl"));
			chngPtcMap.put("regId", emfMap.getString("regId"));
			chngPtcMap.put("regIp", emfMap.getString("regIp"));

			lGBMemJoinDAO.insertMemChngPtc(chngPtcMap);
		}

		//메일 발송
		if (!"".equals(email)) {
			//사용자메일발송
			EmfMap mailMap = new EmfMap();

			mailMap.put("subject", "["+EgovProperties.getProperty("Globals.SITENAME")+"] 회원가입 완료메일입니다.");
			mailMap.put("toUser", email);

			//메일내용
			mailMap.put("name", emfMap.getString("name"));

			//이메일 발송
			mailService.sendTempleteMail(mailMap, "lg/lgb/join_complete.html");
		}

		/*
		 홈페이지 개인정보 로그 - 보안관련 로직 신규 구현
		 2017.12.26
		 */
		EmfMap logMap = new EmfMap();
		logMap.put("ip", EgovNetworkState.getMyIPaddress(request));
		logMap.put("gubun", "로그인 - 회원가입");
		logMap.put("flag", "J");
		logMap.put("pageGubun", "H");
		logMap.put("name", emfMap.getString("name"));
		logMap.put("hp", emfMap.getString("hp"));
		logMap.put("id", emfMap.getString("id"));
		cmmUseService.actionViewAuthLog(logMap);
    }

	/**
	 * 회원 정보를 등록한다. - SSO
	 *
	 * @param emfMap
	 * @param request
	 * @return List<EmfMap>
	 * @throws Exception 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertMemInfSso(EmfMap emfMap, HttpServletRequest request) throws Exception {
		String email = emfMap.getString("email");

		// 본인 인증 후 세션에 저장된 정보를 가져온다(이름, 생년월일)
		EmfMap authMap = (EmfMap) EgovUserDetailsHelper.getIndividualInfAuth();

		emfMap.put("name", authMap.getString("name"));
		emfMap.put("birth", authMap.getString("birth"));
		emfMap.put("ci", authMap.getString("ci"));
		emfMap.put("di", authMap.getString("di"));
		emfMap.put("sex", authMap.getString("sex"));

		// 가입 아이디 및 ip
		emfMap.put("regId", emfMap.getString("id"));
		emfMap.put("regIp", EgovNetworkState.getMyIPaddress(request));
		emfMap.put("modId", emfMap.getString("regId"));
		emfMap.put("modIp", emfMap.getString("regIp"));
		emfMap.put("agreementForThirdParty", request.getParameter("agreementForThirdParty"));
		emfMap.put("marketingYn", emfMap.get("marketingYn"));

		// 고유번호 전산db에서 가져오기(이름, 생년월일, 핸드폰 번호가 일치하는 회원 정보)
		EmfMap dmLifeMemInf = new EmfMap();

		dmLifeMemInf.put("join", true);
		dmLifeMemInf.put("name", authMap.getString("name"));
		dmLifeMemInf.put("hp", authMap.getString("telNo"));
		dmLifeMemInf.put("birth", authMap.getString("birth"));

		List<EmfMap> dmInfo = (List) dMLifeMemService.selectDMLifeMemInf(dmLifeMemInf).get("info");
		if (dmInfo.size() > 0) {
			dmLifeMemInf = dmInfo.get(0);
		} else {
			dmLifeMemInf = null;
		}

		if(dmLifeMemInf != null) {
			emfMap.put("unqNo", dmLifeMemInf.getString("memNo"));
		}

		// 비번, 이메일, 핸드폰, 전화번호, 상세주소 암호화
		if(!"".equals(emfMap.getString("pwd"))) {
			emfMap.put("pwd", SeedCipher.oneencrypt(emfMap.getString("pwd")));				// 비밀번호 암호화(단방향)
		}

		if ("".equals(emfMap.getString("telRcvYn"))) {
			emfMap.put("telRcvYn", "N");
		}
		if ("".equals(emfMap.getString("smsRcvYn"))) {
			emfMap.put("smsRcvYn", "N");
		}
		if ("".equals(emfMap.getString("emailRcvYn"))) {
			emfMap.put("emailRcvYn", "N");
		}
		if ("".equals(emfMap.getString("ctlgRcvYn"))) {
			emfMap.put("ctlgRcvYn", "N");
		}

		try
		{
			String gender = "";
			if (emfMap.getString("sex").equals("1"))
				gender = "M";
			else if (emfMap.getString("sex").equals("0"))
				gender = "W";
			
			HashMap ssoMemberInfo = ssoService.join(emfMap.getString("ci")
													, emfMap.getString("id")
													, emfMap.getString("name")
													, emfMap.getString("pwd")
													, gender
													, emfMap.getString("birth")
													, emfMap.getString("email")
													, null
													, emfMap.getString("hp")
													, emfMap.getString("zipcd")
													, emfMap.getString("adr")
													, emfMap.getString("adrDtl")
													, emfMap.getString("marketingYn")
													, emfMap.getString("regIp"));
		}
		catch (SsoException ex)
		{
			throw new Exception("통합회원 등록에 실패하였습니다.");
		}
		
		lGBMemJoinDAO.insertMemInf(emfMap);		// 회원정보 등록

		String[] srvcRcvGb = EgovProperties.getProperty("Globals.srvcRcvGb").split(",");

		//고객서비스 수신동의 최초 로그를 등록한다.
		for (int i = 0; i < srvcRcvGb.length; i++) {
			emfMap.put("rcvGb", srvcRcvGb[i]);
			emfMap.put("regId", emfMap.getString("id"));
			emfMap.put("regIp", EgovNetworkState.getMyIPaddress(request));
			emfMap.put("modId", emfMap.getString("regId"));
			emfMap.put("modIp", emfMap.getString("regIp"));

			mLHPrsnDataChngDAO.insertInitialSrvcRcvModLog(emfMap);
		}


		emfMap.put("intrField", null);
		emfMap.put("optionintrfield", null);
		emfMap.put("intrPtc", null);
		emfMap.put("pfrnPtc", null);
		emfMap.put("joinPath", null);
		emfMap.put("joinPathEtc", null);
		emfMap.put("pfrnEtc", null);
		emfMap.put("mrrgYn", emfMap.get("mrrgYn"));
		emfMap.put("chdrnGb", emfMap.get("chdrnGb"));

		lGBMemJoinDAO.insertMemEtcInf(emfMap);	// 기타정보 등록
		lGBMemJoinDAO.insertIdntInf(emfMap);	// 본인인증 로그

		if (!"".equals(emfMap.getString("unqNo"))) {
			// 고유번호가 있을시 변경정보 등록
			EmfMap chngPtcMap = new EmfMap();

			chngPtcMap.put("seq", memChngIdgen.getNextIntegerId());
			chngPtcMap.put("id", emfMap.getString("id"));
			chngPtcMap.put("bfrEmail", emfMap.getString("email"));
			chngPtcMap.put("bfrHp", emfMap.getString("hp"));
			chngPtcMap.put("bfrTel", emfMap.getString("tel"));
			chngPtcMap.put("bfrZipcd", emfMap.getString("zipcd"));
			chngPtcMap.put("bfrAdr", emfMap.getString("adr"));
			chngPtcMap.put("bfrAdrDtl", emfMap.getString("adrDtl"));
			chngPtcMap.put("aftEmail", emfMap.getString("email"));
			chngPtcMap.put("aftHp", emfMap.getString("hp"));
			chngPtcMap.put("aftTel", emfMap.getString("tel"));
			chngPtcMap.put("aftZipcd", emfMap.getString("zipcd"));
			chngPtcMap.put("aftAdr", emfMap.getString("adr"));
			chngPtcMap.put("aftAdrDtl", emfMap.getString("adrDtl"));
			chngPtcMap.put("regId", emfMap.getString("regId"));
			chngPtcMap.put("regIp", emfMap.getString("regIp"));

			lGBMemJoinDAO.insertMemChngPtc(chngPtcMap);
		}

		//메일 발송
		if (!"".equals(email)) {
			//사용자메일발송
			EmfMap mailMap = new EmfMap();

			mailMap.put("subject", "["+EgovProperties.getProperty("Globals.SITENAME")+"] 회원가입 완료메일입니다.");
			mailMap.put("toUser", email);

			//메일내용
			mailMap.put("name", emfMap.getString("name"));

			//이메일 발송
			mailService.sendTempleteMail(mailMap, "lg/lgb/join_complete.html");
		}

		/*
		 홈페이지 개인정보 로그 - 보안관련 로직 신규 구현
		 2017.12.26
		 */
		EmfMap logMap = new EmfMap();
		logMap.put("ip", EgovNetworkState.getMyIPaddress(request));
		logMap.put("gubun", "로그인 - 회원가입");
		logMap.put("flag", "J");
		logMap.put("pageGubun", "H");
		logMap.put("name", emfMap.getString("name"));
		logMap.put("hp", emfMap.getString("hp"));
		logMap.put("id", emfMap.getString("id"));
		cmmUseService.actionViewAuthLog(logMap);
    }

	/**
	 * 로그인 시도 횟수 조회
	 *
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public EmfMap selectMemLgnCnt(String id) throws Exception {
		return lGBMemJoinDAO.selectMemLgnCnt(id);
	}

	/**
	 * 로그인 시도 횟수 조회 By Ci
	 *
	 * @param ci
	 * @return
	 * @throws Exception
	 */
	public EmfMap selectMemLgnCntByCi(String ci) throws Exception {
		return lGBMemJoinDAO.selectMemLgnCntByCi(ci);
	}

	/**
	 * 최초 로그인 시도 저장
	 *
	 * @param id
	 */
	public void insertMemLgnCnt(String id) {
		lGBMemJoinDAO.insertMemLgnCnt(id);
	}

	/**
	 * 로그인 시도 횟수 수정
	 *
	 * @param emfMap
	 */
	public void updateMemLgnCnt(EmfMap emfMap) {
		lGBMemJoinDAO.updateMemLgnCnt(emfMap);
	}

	/**
	 * 로그인 시도 횟수 삭제 (초기화)
	 *
	 * @param id
	 */
	public void deleteMemLgnCnt(String id) {
		lGBMemJoinDAO.deleteMemLgnCnt(id);
	}

	/**
	 * 통합회원 전환
	 *
	 * @param emfMap
	 * @param request
	 * @throws Exception
	 */
	public void updateIntegrationMemInf(EmfMap emfMap, HttpServletRequest request) throws Exception {
		// 가입 아이디 및 ip
		emfMap.put("modId", emfMap.getString("homepageId"));
		emfMap.put("modIp", EgovNetworkState.getMyIPaddress(request));

		if(!"".equals(emfMap.getString("pwd"))) {
			emfMap.put("pwd", SeedCipher.oneencrypt(emfMap.getString("pwd")));				// 비밀번호 암호화(단방향)
		}

		if(emfMap.get("telRcvYn") == null || "".equals(emfMap.get("telRcvYn"))) emfMap.put("telRcvYn", "N");
		if(emfMap.get("smsRcvYn") == null || "".equals(emfMap.get("smsRcvYn"))) emfMap.put("smsRcvYn", "N");
		if(emfMap.get("emailRcvYn") == null || "".equals(emfMap.get("emailRcvYn"))) emfMap.put("emailRcvYn", "N");
		if(emfMap.get("ctlgRcvYn") == null || "".equals(emfMap.get("ctlgRcvYn"))) emfMap.put("ctlgRcvYn", "N");

		EmfMap integrationMap = new EmfMap();
		integrationMap.put("integrationId", emfMap.get("integrationId"));
		integrationMap.put("integrationPw", emfMap.get("pwd"));
		integrationMap.put("homepageId", emfMap.get("homepageId"));

		EmfMap homepageIdParam = new EmfMap();
		homepageIdParam.put("id", emfMap.get("homepageId"));
		EmfMap homepageMemberInfo = lGBMemJoinDAO.selectMemInf(homepageIdParam);
		integrationMap.put("memberId", homepageMemberInfo.get("unqNo"));
		// 통합 회원 테이블 업데이트
		lGBMemJoinDAO.changeIntegrationMemInf(integrationMap);

		//		관심분야 setting
//		List<String> intrFields = emfMap.getList("intrField");
//		String intrField = "";
//		for(int i = 0; i < intrFields.size(); i++) {
//			if (i == 0) intrField = intrFields.get(i);
//			else intrField = intrField.concat("|" + intrFields.get(i));
//		}
		emfMap.put("intrField", null);

		// 홈페이지 정보 업데이트
		lGAMemLoginDAO.updateHomepageMemberInfo(emfMap, "UPDATE");

//		옵션 관심분야 setting
//		List<String> optionIntrFields = emfMap.getList("optionintrfield");
//		String optionIntrField = "";
//		for(int i = 0; i < optionIntrFields.size(); i++) {
//			if (i == 0) optionIntrField = optionIntrFields.get(i);
//			else optionIntrField = optionIntrField.concat("|" + optionIntrFields.get(i));
//		}
		emfMap.put("optionintrfield", null);

//		관심내역 setting
//		List<String> intrPtcs = emfMap.getList("intrPtc");
//		String intrPtc = "";
//
//		for(int i = 0; i < intrPtcs.size(); i++) {
//			if (i == 0) intrPtc = intrPtcs.get(i);
//			else intrPtc = intrPtc.concat(", " + intrPtcs.get(i));
//		}
		emfMap.put("intrPtc", null);

//		선호내역 setting
//		List<String> pfrnPtcs = emfMap.getList("pfrnPtc");
//		String pfrnPtc = "";
//
//		for (int i = 0; i < pfrnPtcs.size(); i++) {
//			if (i == 0) pfrnPtc = pfrnPtcs.get(i);
//			else pfrnPtc = pfrnPtc.concat(", " + pfrnPtcs.get(i));
//		}
		emfMap.put("pfrnPtc", null);

//		if (emfMap.getString("joinPathEtc") == null) emfMap.put("joinPathEtc", "");
//		if (emfMap.getString("pfrnEtc") == null) emfMap.put("pfrnEtc", "");
		emfMap.put("joinPath", null);
		emfMap.put("joinPathEtc", null);
		emfMap.put("pfrnEtc", null);
		emfMap.put("mrrgYn", emfMap.get("mrrgYn"));
		emfMap.put("chdrnGb", emfMap.get("chdrnGb"));

		lGAMemLoginDAO.updateHomepageMemberEtcInfo(emfMap, "UPDATE");

		EmfMap logMap = new EmfMap();
		logMap.put("ip", EgovNetworkState.getMyIPaddress(request));
		logMap.put("gubun", "로그인 - 통합 회원 전환");
		logMap.put("flag", "J");
		logMap.put("pageGubun", "H");
		logMap.put("name", emfMap.getString("name"));
		logMap.put("hp", emfMap.getString("hp"));
		logMap.put("id", emfMap.getString("homepageId"));
		cmmUseService.actionViewAuthLog(logMap);
	}

	/**
	 * 통합회원 전환 - SSO
	 *
	 * @param emfMap
	 * @param request
	 * @throws Exception
	 */
	public void updateIntegrationMemInfSso(EmfMap emfMap, HttpServletRequest request) throws Exception {
		// 가입 아이디 및 ip
		emfMap.put("modId", emfMap.getString("homepageId"));
		emfMap.put("modIp", EgovNetworkState.getMyIPaddress(request));

		if(!"".equals(emfMap.getString("pwd"))) {
			emfMap.put("pwd", SeedCipher.oneencrypt(emfMap.getString("pwd")));				// 비밀번호 암호화(단방향)
		}

		if(emfMap.get("telRcvYn") == null || "".equals(emfMap.get("telRcvYn"))) emfMap.put("telRcvYn", "N");
		if(emfMap.get("smsRcvYn") == null || "".equals(emfMap.get("smsRcvYn"))) emfMap.put("smsRcvYn", "N");
		if(emfMap.get("emailRcvYn") == null || "".equals(emfMap.get("emailRcvYn"))) emfMap.put("emailRcvYn", "N");
		if(emfMap.get("ctlgRcvYn") == null || "".equals(emfMap.get("ctlgRcvYn"))) emfMap.put("ctlgRcvYn", "N");

		EmfMap integrationMap = new EmfMap();
		integrationMap.put("integrationId", emfMap.get("integrationId"));
		integrationMap.put("integrationPw", emfMap.get("pwd"));
		integrationMap.put("homepageId", emfMap.get("homepageId"));

		EmfMap homepageIdParam = new EmfMap();
		homepageIdParam.put("id", emfMap.get("homepageId"));
		EmfMap homepageMemberInfo = lGBMemJoinDAO.selectMemInf(homepageIdParam);
		emfMap.put("ci", homepageMemberInfo.getString("ci"));
		integrationMap.put("memberId", homepageMemberInfo.get("unqNo"));
		// 통합 회원 테이블 업데이트
		//lGBMemJoinDAO.changeIntegrationMemInf(integrationMap);
		try
		{
			String gender = "";
			if (homepageMemberInfo.getString("sex").equals("1"))
				gender = "M";
			else if (homepageMemberInfo.getString("sex").equals("0"))
				gender = "W";
			
			String marketingYn = "";
			if (emfMap.getString("marketingYn") == null || emfMap.getString("marketingYn") == "")
				marketingYn = "N";
			else
				marketingYn = emfMap.getString("marketingYn");
				
			HashMap ssoMemberInfo = ssoService.join(emfMap.getString("ci")
													, emfMap.getString("integrationId")
													, emfMap.getString("name")
													, emfMap.getString("pwd")
													, gender
													, homepageMemberInfo.getString("birth")
													, emfMap.getString("email")
													, homepageMemberInfo.getString("tel")
													, emfMap.getString("hp")
													, emfMap.getString("zipcd")
													, emfMap.getString("adr")
													, emfMap.getString("adrDtl")
													, marketingYn
													, emfMap.getString("modIp"));
		}
		catch (SsoException ex)
		{
			throw new Exception("통합회원 등록에 실패하였습니다.");
		}

		// 관심분야 setting
		emfMap.put("intrField", null);
		// 홈페이지 정보 업데이트
		lGAMemLoginDAO.updateHomepageMemberInfo(emfMap, "UPDATE");

//		옵션 관심분야 setting
		emfMap.put("optionintrfield", null);
//		관심내역 setting
		emfMap.put("intrPtc", null);
//		선호내역 setting
		emfMap.put("pfrnPtc", null);
		emfMap.put("joinPath", null);
		emfMap.put("joinPathEtc", null);
		emfMap.put("pfrnEtc", null);
		emfMap.put("mrrgYn", emfMap.get("mrrgYn"));
		emfMap.put("chdrnGb", emfMap.get("chdrnGb"));

		lGAMemLoginDAO.updateHomepageMemberEtcInfo(emfMap, "UPDATE");

		//lGAMemLoginDAO.updateHomepageMemberIndtInfoSso(emfMap, "UPDATE");

		EmfMap logMap = new EmfMap();
		logMap.put("ip", EgovNetworkState.getMyIPaddress(request));
		logMap.put("gubun", "로그인 - 통합 회원 전환");
		logMap.put("flag", "J");
		logMap.put("pageGubun", "H");
		logMap.put("name", emfMap.getString("name"));
		logMap.put("hp", emfMap.getString("hp"));
		logMap.put("id", emfMap.getString("homepageId"));
		cmmUseService.actionViewAuthLog(logMap);
	}

	/**
	 * 회원 정보를 가져온다(아이디, 이메일 중복검사 혼용)
	 *
	 * @param emfMap (check : id or email)
	 * @return EmfMap
	 * @throws Exception 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectMemInf(EmfMap emfMap) throws Exception {
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();

		if (!"".equals(emfMap.getString("check"))) {
			// 이메일 중복검사 일 경우 암호화하여 비교
			if("email".equals(emfMap.getString("check"))) {
				// 로그인 일 경우(수정화면 일 경우)
				if(lgnMap != null) {
					emfMap.put("id", lgnMap.getString("id"));
				}
			}
		}

		EmfMap rtnMemInfMap = lGBMemJoinDAO.selectMemInf(emfMap);
 		int rtnQscnMemInfMap = lGBMemJoinDAO.selectQscnMemIdEmailCheck(emfMap);

		if (rtnQscnMemInfMap > 0) {
			emfMap.put("qscnYn", "Y");
		} else {
			emfMap.put("qscnYn", "N");
		}

		int rtnDrotMemInfMap = lGBMemJoinDAO.selectDrotMemIdEmailCheck(emfMap);

		if (rtnDrotMemInfMap > 0) {
			emfMap.put("drot_yn", "Y");
		} else {
			emfMap.put("drot_yn", "N");
		}

		if (!"".equals(emfMap.getString("check"))) {
			// 아이디, 이메일 중복검사 일 경우 사용가능 여부 정보만 제공
			if ("id".equals(emfMap.getString("check")) || "email".equals(emfMap.getString("check"))) {
				if (rtnMemInfMap != null) {
					emfMap.put("useYn", "Y");
				} else {

					emfMap.put("useYn", "N");
				}
			} else {
				emfMap.put("info", rtnMemInfMap);
			}
		} else {
			emfMap.put("info", rtnMemInfMap);
		}

		return emfMap;
	}

	/**
	 * 통합 회원 이메일 중복 체크
	 *
	 * @param emfMap
	 * @return
	 * @throws Exception
	 */
	public int checkIntegrationEmail(EmfMap emfMap) throws Exception {
		return lGBMemJoinDAO.checkDuplicateEmail(emfMap);
	}

	/**
	 * 통합 회원 가입 정보를 가져온다.
	 *
	 * @param ci
	 * @throws Exception
	 */
	public List<EmfMap> selectIntegrationMemberInfo(String ci, String id) {
		return lGBMemJoinDAO.selectIntegrationMemberInfo(ci, id);
	}

	/**
	 * 상조 회원 가입 정보를 가져온다.
	 *
	 * @param ci
	 * @return
	 * @throws Exception
	 */
	public List<EmfMap> selectFuneralMemberInfo(String ci) {
		return lGBMemJoinDAO.selectFuneralMemberInfo(ci);
	}

	/**
	 * 사용가능한 아이디 조회
	 *
	 * @param emfMap
	 */
	public Map<String, Object> checkAvailableAccount(EmfMap emfMap) {
		Map<String, Object> map = new HashMap<String, Object>();
		// TODO 회원몰 가입 여부 확인
//		lGAMemLoginDAO.getMallMemberInfo(memberId);
		if (emfMap.get("mallId") != null) {
			Map<String, String> mallMap = new HashMap<String, String>();
			String mallId = emfMap.getString("mallId");
			if (isNumber(mallId)) {
				// 아이디가 숫자로만 이루어진 경우
				mallMap.put("id", mallId);
				mallMap.put("mallJoinDate", emfMap.getString("mallJoinDate"));
				mallMap.put("availableFlag", "N");
			} else {
				mallMap.put("id", mallId);
				mallMap.put("mallJoinDate", emfMap.getString("mallJoinDate"));
				if (lGBMemJoinDAO.checkAvailableAccount("MALL", mallId) == 0) mallMap.put("availableFlag", "Y");
				else mallMap.put("availableFlag", "N");
			}
			map.put("MALL", mallMap);
		} else {
			map.put("MALL", null);
		}

		if (emfMap.get("homepageId") != null) {
			String homepageId = emfMap.getString("homepageId") ;
			Map<String, String> homepageMap = new HashMap<String, String>();
			homepageMap.put("id", homepageId);
			homepageMap.put("homepageJoinDate", emfMap.getString("homepageJoinDate"));
			if (lGBMemJoinDAO.checkAvailableAccount("HOMEPAGE", homepageId) == 0) homepageMap.put("availableFlag", "Y");
			else homepageMap.put("availableFlag", "N");
			map.put("HOMEPAGE", homepageMap);
		}

		if (emfMap.get("integrationId") != null) {
			String integrationId = emfMap.getString("integrationId") ;
			Map<String, String> homepageMap = new HashMap<String, String>();
			homepageMap.put("id", integrationId);
			if (lGBMemJoinDAO.checkAvailableAccount("INTEGRATION", integrationId) == 0) homepageMap.put("availableFlag", "Y");
			else homepageMap.put("availableFlag", "N");
			map.put("INTEGRATION", homepageMap);
		}
		return map;
	}

	/**
	 * 사용가능한 아이디 조회 - SSO
	 *
	 * @param emfMap
	 */
	public Map<String, Object> checkAvailableAccountSso(EmfMap emfMap, HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		// TODO 회원몰 가입 여부 확인
//		lGAMemLoginDAO.getMallMemberInfo(memberId);
		if (emfMap.get("mallId") != null) {
			Map<String, String> mallMap = new HashMap<String, String>();
			String mallId = emfMap.getString("mallId");
			if (isNumber(mallId)) {
				// 아이디가 숫자로만 이루어진 경우
				mallMap.put("id", mallId);
				mallMap.put("mallJoinDate", emfMap.getString("mallJoinDate"));
				mallMap.put("availableFlag", "N");
			} else {
				mallMap.put("id", mallId);
				mallMap.put("mallJoinDate", emfMap.getString("mallJoinDate"));
				if (lGBMemJoinDAO.checkAvailableAccount("MALL", mallId) == 0) mallMap.put("availableFlag", "Y");
				else mallMap.put("availableFlag", "N");
			}
			map.put("MALL", mallMap);
		} else {
			map.put("MALL", null);
		}

		if (emfMap.get("homepageId") != null) {
			String homepageId = emfMap.getString("homepageId") ;
			Map<String, String> homepageMap = new HashMap<String, String>();
			homepageMap.put("id", homepageId);
			homepageMap.put("homepageJoinDate", emfMap.getString("homepageJoinDate"));
			if (lGBMemJoinDAO.checkAvailableAccount("HOMEPAGE", homepageId) == 0) homepageMap.put("availableFlag", "Y");
			else homepageMap.put("availableFlag", "N");
			map.put("HOMEPAGE", homepageMap);
		}

		if (emfMap.get("integrationId") != null) {
			String clientIp = EgovNetworkState.getMyIPaddress(request);
			String integrationId = emfMap.getString("integrationId") ;

			Map<String, String> homepageMap = new HashMap<String, String>();
			homepageMap.put("id", integrationId);
			try
			{
				HashMap ssoMemberInfo = ssoService.find(integrationId, null, null, clientIp);

				if (ssoMemberInfo == null) //통합회원 ID 조회
				{
					// 탈퇴회원인지 조회
					List<HashMap> ssoDropMemberInfo = null;
					try
					{
						ssoDropMemberInfo = ssoService.findDrop(integrationId, null, null, clientIp);
					}
					catch (SsoException ex)
					{
			    		emfMap.put("msg", "에러가 발생하였습니다.(" + ex.getMessage() + ")");
			    		emfMap.put("vwUrl",  "/member/join/Login.do");
			    		emfMap.put("success", false);

			    		return emfMap;
					}
					
					if (ssoDropMemberInfo != null && ssoDropMemberInfo.size() > 0) // 탈퇴회원 처리
					{
						homepageMap.put("availableFlag", "N");
					}
					else
					{
						EmfMap infoMap = new EmfMap();
						infoMap.put("id", integrationId);
						EmfMap homepageMemberInfo = lGBMemJoinDAO.selectMemInfFromMemAndQscnMem(infoMap);
						if (homepageMemberInfo == null) //홈페이지 아이디 조회
						{
							homepageMap.put("availableFlag", "Y");
						}
						else
						{
							homepageMap.put("homepageJoinDate", homepageMemberInfo.getString("regDtm"));
							if (emfMap.getString("loginId").equals(homepageMap.get("id"))) // 홈페이지 로그인 아이디와 동일이면 사용가능
							{
								homepageMap.put("availableFlag", "Y");
							}
							else
							{
								homepageMap.put("availableFlag", "N");
							}
						}
						map.put("HOMEPAGE", homepageMap);
					}
				}
				else
				{
					homepageMap.put("availableFlag", "N");
				}

				map.put("INTEGRATION", homepageMap);
			}
			catch (SsoException ex)
			{
	    		emfMap.put("msg", "에러가 발생하였습니다.(" + ex.getMessage() + ")");
	    		emfMap.put("vwUrl",  "/member/login/Login.do");
	    		emfMap.put("success", false);
			}
		}
		return map;
	}

	private boolean isNumber(String str) {
		try {
			Integer.parseInt(str);
			return true;
		} catch(NumberFormatException e) {
			return false;
		}
	}

	/**
	 * 비밀번호를 변경한다.
	 *
	 * @param emfMap
	 * @return EmfMap
	 * @throws Exception 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateMemPwdInf(EmfMap emfMap) throws Exception {
		if(!"".equals(emfMap.getString("pwd"))) {
			emfMap.put("pwd", SeedCipher.oneencrypt(emfMap.getString("pwd")));		// 비밀번호 암호화
			lGBMemJoinDAO.updateMemPwdInf(emfMap);
		}
	}

	/**
	 * 통합 회원 비밀번호를 변경한다.
	 *
	 * @param emfMap
	 * @throws Exception
	 */
	@Override
	public void updateIntegrationMemPwdInf(EmfMap emfMap) throws Exception {
		if(!"".equals(emfMap.getString("pwd"))) {
			emfMap.put("pwd", SeedCipher.oneencrypt(emfMap.getString("pwd")));		// 비밀번호 암호화
			lGBMemJoinDAO.updateIntegrationMemPwdInf(emfMap);
		}
	}

	public void updateMemAgreement(EmfMap emfMap) throws Exception {
		lGBMemJoinDAO.updateMemAgreement(emfMap);
	}

	/**
	 * 회원 정보를 가져온다(아이디, 이메일 중복검사 혼용)
	 *
	 * @param emfMap (check : id or email)
	 * @return EmfMap
	 * @throws Exception 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectIdEmailCheck(EmfMap emfMap) throws Exception {
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();

		if (!"".equals(emfMap.getString("check"))) {
			// 이메일 중복검사 일 경우 암호화하여 비교
			if ("email".equals(emfMap.getString("check"))) {
				// 로그인 일 경우(수정화면 일 경우)
				if (lgnMap != null) {
					emfMap.put("id", lgnMap.getString("id"));
				}
				// 이메일 암호화
				//2017.04.25 박주석 디아모 적용
//				emfMap.put("email", SeedCipher.encrypt(emfMap.getString("email"), ENCODE));
			}
		}

		int rtnMemInfMap = lGBMemJoinDAO.selectMemIdEmailCheck(emfMap);

		if (!"".equals(emfMap.getString("check"))) {
			// 아이디, 이메일 중복검사 일 경우 사용가능 여부 정보만 제공
			if ("id".equals(emfMap.getString("check")) || "email".equals(emfMap.getString("check"))) {
				if (rtnMemInfMap > 0) {
					emfMap.put("useYn", "Y");
				} else {
					emfMap.put("useYn", "N");
				}
			} else {
				emfMap.put("info", rtnMemInfMap);
			}
		} else {
			emfMap.put("info", rtnMemInfMap);
		}
		return emfMap;
	}

	/**
	 * 본인 인증 후 결과 처리 (SSO 버전)
	 *
	 * @param emfMap
	 * @return
	 * @throws Exception
	 */
	public EmfMap getCheckAuth(EmfMap emfMap, HttpServletRequest request) throws Exception {
		String clientIp = EgovNetworkState.getMyIPaddress(request);
		EmfMap resultMap = new EmfMap();

		// 본인 인증 후 세션에 저장된 정보를 가져와서 세션에 저장한다.(이름, 생년월일)
		EmfMap authMap = (EmfMap) EgovUserDetailsHelper.getIndividualInfAuth();
		if (authMap == null)
		{
			resultMap.put("msg", "인증정보가 없습니다.");
			//resultMap.put("url", "redirect:/member/login/Login.do");
			resultMap.put("url", "/member/join/agree.do");
			RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
			return resultMap;
		}

		String ci = authMap.getString("ci");
		String name = authMap.getString("name");
		String birth = authMap.getString("birth");
		String sex = authMap.getString("sex");

		emfMap.put("ci", ci);			// 유저 고유값
		emfMap.put("name", name);		// 이름
		emfMap.put("birth", birth);	// 생년월일
		emfMap.put("sex", sex);	// 생년월일

		HashMap ssoMemberInfo = null;
		try
		{
			ssoMemberInfo = ssoService.find(null, null, ci, clientIp);
		}
		catch (SsoException ex)
		{
			resultMap.put("msg", "에러가 발생하였습니다.(" + ex.getMessage() + ")");
			resultMap.put("url", "/member/join/agree.do");
			RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
			return resultMap;
		}

		if (ssoMemberInfo != null) //SSO 회원 존재
		{
			resultMap.put("loginType", "ALREADY_INTEGRATION_MEMBER");
			resultMap.put("msg", "이미 통합회원에 가입되어 있는 회원정보입니다. \\n 아이디 찾기를 통해 로그인 하세요.");
			resultMap.put("url", "/member/login/Login.do");
			RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
			return resultMap;
		}
		else
		{
			EmfMap infoMap = new EmfMap();
			infoMap.put("ci", ci);
			EmfMap homepageMemberInfo = lGBMemJoinDAO.selectMemInfFromMemAndQscnMem(infoMap);

			if (homepageMemberInfo != null) //로컬 회원 존재
			{
				// SSO 회원이 아니면 탈퇴한 회원인지 조회 (타 사이트에서 탈퇴를 진행한 경우 홈페이지디비 회원도 탈퇴 진행을 해야한다.)
				List<HashMap> ssoDropMemberInfo = null;
				try
				{
					ssoDropMemberInfo = ssoService.findDrop(null, null, ci, clientIp);
				}
				catch (SsoException ex)
				{
					resultMap.put("msg", "에러가 발생하였습니다.(" + ex.getMessage() + ")");
					resultMap.put("url", "/member/join/agree.do");
					RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
					return resultMap;
				}
				if (ssoDropMemberInfo != null && ssoDropMemberInfo.size() > 0) // 탈퇴회원 처리
				{
					EmfMap dropUserParam = new EmfMap();
					dropUserParam.put("id", homepageMemberInfo.get("id"));
					if ("Y".equals(homepageMemberInfo.get("qscnYn"))) //휴면회원 탈퇴처리
					{
						dropUserParam.put("dropReason", "타사이트 SSO 탈퇴");
						mLHMemDrotDAO.insertMemDropInfoFromQscn(dropUserParam);
						mLHMemDrotDAO.deleteMemDrotFromQscn(dropUserParam);
					}
					else // 일반회원 탈퇴처리
					{
						mLHMemDrotDAO.insertMemDropInfo(dropUserParam);
						mLHMemDrotDAO.deleteMemDrot(dropUserParam);
					}
					mLHMemDrotDAO.deleteMemEtcDrot(dropUserParam.getString("id"));
					mLHMemDrotDAO.deleteIdntInf(dropUserParam);
				}
				else
				{
					resultMap.put("loginType", "NECESSARY_INTEGRATION_MEMBER");
					resultMap.put("msg", "이미 홈페이지에 등록된 회원정보입니다.");
					resultMap.put("url", "/member/findid/complete_sso.do");
					RequestContextHolder.getRequestAttributes().setAttribute("individualInfAuth", null, RequestAttributes.SCOPE_SESSION);
					return resultMap;
				}
			}
		}

		// 통합회원 전환 프로세스
		// 상조회원 DB 조회
		List<EmfMap> funeralMemberList = lGBMemJoinService.selectFuneralMemberInfo(ci);
		if (funeralMemberList == null || funeralMemberList.isEmpty()) {
			// 회원몰 서비스 이용불가 안내
			resultMap.put("loginType", "REGISTER_MEMBER_WITHOUT_MEMBER_MALL");
		} else {
			resultMap.put("loginType", "REGISTER_MEMBER");
		}

		resultMap.put("url", "/member/join/write.do");
		RequestContextHolder.getRequestAttributes().setAttribute("loginType", resultMap.get("loginType"), RequestAttributes.SCOPE_SESSION);

		return resultMap;
	}

}
