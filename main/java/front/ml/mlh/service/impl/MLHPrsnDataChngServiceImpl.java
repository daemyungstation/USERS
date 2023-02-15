package front.ml.mlh.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovNetworkState;
import egovframework.com.utl.sim.service.SeedCipher;
import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.lg.lgb.service.LGBMemJoinService;
import front.lg.sso.exception.SsoException;
import front.lg.sso.service.SSOService;
import front.ml.mlh.service.MLHPrsnDataChngService;
import front.ml.mlh.service.dao.MLHPrsnDataChngDAO;

/**
 * <pre> 
 * 개인정보 변경을 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: MLHPrsnDataChngServiceImpl.java
 * @Description		: 개인정보 변경을 위한 ServiceImpl
 * @author 허진영
 * @since 2016.03.07
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.07		   허진영				  최초 생성
 * </pre>
 */ 
@Service("mLHPrsnDataChngService")
public class MLHPrsnDataChngServiceImpl extends EmfAbstractService implements MLHPrsnDataChngService {	

	@Resource(name="mLHPrsnDataChngDAO")
	private MLHPrsnDataChngDAO mLHPrsnDataChngDAO;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;
	
	@Resource(name="lGBMemJoinService")
	private LGBMemJoinService lGBMemJoinService;
	
	@Resource(name = "ssoService")
	private SSOService ssoService;

	@Resource(name="memChngIdgen")
	private EgovTableIdGnrService memChngIdgen;
	
	private String ENCODE = EgovProperties.getProperty("Global.CHARCODE");
	
	private String[] srvcRcvGb = EgovProperties.getProperty("Globals.srvcRcvGb").split(",");

	/**
	 * 회원 정보를 조회한다.
	 *
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectMemInf(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();

		emfMap.put("id", lgnMap.getString("homepageId"));
		emfMap.put("integrationId", lgnMap.getString("integrationId"));

		//단방향 암호화 처리
    	emfMap.put("pwd", SeedCipher.oneencrypt(emfMap.getString("pwd")));

    	EmfMap memInfo = mLHPrsnDataChngDAO.selectMemInf(emfMap);

    	if(memInfo != null)
    	{
    		emfMap.put("memInfo", memInfo);
    		//2017.04.25 박주석 디아모 적용
//    		if(!"".equals(EMFStringUtil.nullConvert(memInfo.get("email"))))
//			{
//    			memInfo.put("email", SeedCipher.decrypt(memInfo.getString("email"), ENCODE));
//			}
//    		
//    		if(!"".equals(EMFStringUtil.nullConvert(memInfo.get("hp"))))
//			{
//    			memInfo.put("hp", SeedCipher.decrypt(memInfo.getString("hp"), ENCODE));
//			}
//    		
//    		if(!"".equals(EMFStringUtil.nullConvert(memInfo.get("tel"))))
//			{
//    			memInfo.put("tel", SeedCipher.decrypt(memInfo.getString("tel"), ENCODE));
//			}
//    		
//    		if(!"".equals(EMFStringUtil.nullConvert(memInfo.get("adrDtl"))))
//			{
//    			memInfo.put("adrDtl", SeedCipher.decrypt(memInfo.getString("adrDtl"), ENCODE));
//			}
    	}
    	else
    	{
    		throw new Exception("비밀번호오류");
    	}
    	
    	//공통코드 배열 셋팅
		ArrayList<String> cdDtlList = new ArrayList<String>();

		//회원 - 가입경로
		cdDtlList.add("JOIN_PATH_GB");

		//회원 - 관심정보
		cdDtlList.add("INTR_GB");

		//회원 - 선호정보
		cdDtlList.add("PFRN_GB");

		//정의된 코드id값들의 상세 코드 맵 반환
		emfMap.put("cdDtlList", cmmUseService.selectCmmCodeBindAll(cdDtlList));
    	
		/*
		 홈페이지 개인정보 로그 - 보안관련 로직 신규 구현
		 2017.12.26
		 */
		EmfMap logMap = new EmfMap();
		logMap.put("ip", RequestContextHolder.getRequestAttributes().getAttribute("logIp", RequestAttributes.SCOPE_SESSION));
		logMap.put("gubun", "나의 라이프웨이 - 회원정보 관리 - 개인정보 변경 조회");
		logMap.put("flag", "S");
		logMap.put("pageGubun", "H");
		logMap.put("name", lgnMap.getString("name"));
		logMap.put("hp", lgnMap.getString("hp"));
		logMap.put("id", lgnMap.getString("id"));
		cmmUseService.actionViewAuthLog(logMap);
		
    	return emfMap;
	}
	
	/**
	 * 회원 정보를 조회한다. - SSO
	 *
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectMemInfSso(EmfMap emfMap, HttpServletRequest request) throws Exception
	{
		String clientIp = EgovNetworkState.getMyIPaddress(request);
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		emfMap.put("integrationId", lgnMap.getString("integrationId"));

		//단방향 암호화 처리
		String pwd = SeedCipher.oneencrypt(emfMap.getString("pwd"));
		emfMap.put("pwd", pwd);

		EmfMap rtnMemInfMap = mLHPrsnDataChngDAO.selectMemInf(emfMap);
    	HashMap ssoFindMap = null;
    	try
    	{
    		ssoFindMap = ssoService.find(lgnMap.getString("integrationId"), null, null, clientIp);
    	}
		catch (SsoException ex)
    	{
    		throw new Exception("비밀번호오류");
    	}

    	if (ssoFindMap != null)
    	{
    		if (pwd.equals((String)ssoFindMap.get("pwd")) && "N".equals((String)ssoFindMap.get("isOut")))
    			emfMap.put("memInfo", ssoFindMap);
    		else
        		throw new Exception("비밀번호오류");
    	}
    	else
    	{
    		throw new Exception("비밀번호오류");
    	}

		emfMap.put("memInfo2", rtnMemInfMap);
    	//공통코드 배열 셋팅
		ArrayList<String> cdDtlList = new ArrayList<String>();

		//회원 - 가입경로
		cdDtlList.add("JOIN_PATH_GB");

		//회원 - 관심정보
		cdDtlList.add("INTR_GB");

		//회원 - 선호정보
		cdDtlList.add("PFRN_GB");

		//정의된 코드id값들의 상세 코드 맵 반환
		emfMap.put("cdDtlList", cmmUseService.selectCmmCodeBindAll(cdDtlList));
    	
		/*
		 홈페이지 개인정보 로그 - 보안관련 로직 신규 구현
		 2017.12.26
		 */
		EmfMap logMap = new EmfMap();
		logMap.put("ip", EgovNetworkState.getMyIPaddress(request));
		logMap.put("gubun", "나의 라이프웨이 - 회원정보 관리 - 개인정보 변경 조회");
		logMap.put("flag", "S");
		logMap.put("pageGubun", "H");
		logMap.put("name", lgnMap.getString("name"));
		logMap.put("hp", lgnMap.getString("hp"));
		logMap.put("id", lgnMap.getString("id"));
		cmmUseService.actionViewAuthLog(logMap);
		
    	return emfMap;
	}

	/**
	 * 회원 정보를 변경한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateMemInf(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("chngSeq", memChngIdgen.getNextIntegerId());
		emfMap.put("id", lgnMap.getString("id"));
		//2017.04.25 박주석 디아모 적용
//		if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("email"))))
//		{
//			emfMap.put("email", SeedCipher.encrypt(emfMap.getString("email"), ENCODE));	
//		}	
//		
//		if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("hp"))))
//		{
//			emfMap.put("hp", SeedCipher.encrypt(emfMap.getString("hp"), ENCODE));	
//		}
//		
//		if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("tel"))))
//		{
//			emfMap.put("tel", SeedCipher.encrypt(emfMap.getString("tel"), ENCODE));	
//		}
//		
//		if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("adrDtl"))))
//		{
//			emfMap.put("adrDtl", SeedCipher.encrypt(emfMap.getString("adrDtl"), ENCODE));	
//		}	
		
		emfMap.put("regId", lgnMap.getString("id"));
		emfMap.put("regIp", lgnMap.getString("loginIp"));
		emfMap.put("modId", lgnMap.getString("id"));
		emfMap.put("modIp", lgnMap.getString("loginIp"));
		
		if("".equals(emfMap.getString("telRcvYn"))){
			emfMap.put("telRcvYn", "N");
		}
		if("".equals(emfMap.getString("smsRcvYn"))){
			emfMap.put("smsRcvYn", "N");
		}
		if("".equals(emfMap.getString("emailRcvYn"))){
			emfMap.put("emailRcvYn", "N");
		}
		if("".equals(emfMap.getString("ctlgRcvYn"))){
			emfMap.put("ctlgRcvYn", "N");
		}
		
		//회원 정보 수정 로그등록
		mLHPrsnDataChngDAO.insertMemInfModLog(emfMap);
		
		//고객서비스 수신동의 변경 로그를 등록한다.
		for(int i = 0; i < srvcRcvGb.length; i++)
		{
//			System.out.println("aaaaaaaaaa "+srvcRcvGb[i]);
			emfMap.put("rcvGb", srvcRcvGb[i]);
			mLHPrsnDataChngDAO.insertSrvcRcvModLog(emfMap);
		}

//		log.debug(emfMap);
		//회원 정보 수정
		mLHPrsnDataChngDAO.updateMemInf(emfMap);
		
		//관심내역 setting
		List<String> intrPtcs = emfMap.getList("intrPtc");
		
		String intrPtc = "";
		
		for(int i = 0; i < intrPtcs.size(); i++)
		{
			if(i == 0)
			{
				intrPtc = intrPtcs.get(i);
			}
			else
			{
				intrPtc = intrPtc.concat(", " + intrPtcs.get(i));
			}
		}
		
		emfMap.put("intrPtc", intrPtc);
		
		//선호내역 setting
		List<String> pfrnPtcs = emfMap.getList("pfrnPtc");
		
		String pfrnPtc = "";
		
		for(int i = 0; i < pfrnPtcs.size(); i++)
		{
			if(i == 0)
			{
				pfrnPtc = pfrnPtcs.get(i);
			}
			else
			{
				pfrnPtc = pfrnPtc.concat(", " + pfrnPtcs.get(i));
			}
		}
		
		emfMap.put("pfrnPtc", pfrnPtc);
		
		//기타 정보 수정
		mLHPrsnDataChngDAO.updateEtcInf(emfMap);
		
		EmfMap tmpMap = lGBMemJoinService.selectMemInf(emfMap);
		
		if(tmpMap.get("info") != null)
    	{
			EmfMap memInfo = (EmfMap) tmpMap.get("info");
			
			lgnMap.put("email", memInfo.getString("email"));
			lgnMap.put("hp", memInfo.getString("hp"));
			lgnMap.put("tel", memInfo.getString("tel"));
			lgnMap.put("zipcd", memInfo.getString("zipcd"));
			lgnMap.put("adr", memInfo.getString("adr"));
			lgnMap.put("adrDtl", memInfo.getString("adrDtl"));
			
			RequestContextHolder.getRequestAttributes().setAttribute("userLgnMap", lgnMap, RequestAttributes.SCOPE_SESSION);
    	}
		
		/*
		 홈페이지 개인정보 로그 - 보안관련 로직 신규 구현
		 2017.12.26
		 */
		EmfMap logMap = new EmfMap();
		logMap.put("ip", RequestContextHolder.getRequestAttributes().getAttribute("logIp", RequestAttributes.SCOPE_SESSION));
		logMap.put("gubun", "나의 라이프웨이 - 회원정보 관리 - 회원정보 변경");
		logMap.put("flag", "M");
		logMap.put("pageGubun", "H");
		logMap.put("name", lgnMap.getString("name"));
		logMap.put("hp", lgnMap.getString("hp"));
		logMap.put("id", lgnMap.getString("id"));
		cmmUseService.actionViewAuthLog(logMap);
	}

	/**
	 * 회원 정보를 변경한다. - SSO
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateMemInfSso(EmfMap emfMap, HttpServletRequest request) throws Exception
	{
		String clientIp = EgovNetworkState.getMyIPaddress(request);
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("chngSeq", memChngIdgen.getNextIntegerId());
		emfMap.put("id", lgnMap.getString("id"));
		
		emfMap.put("regId", lgnMap.getString("id"));
		emfMap.put("regIp", lgnMap.getString("loginIp"));
		emfMap.put("modId", lgnMap.getString("id"));
		emfMap.put("modIp", lgnMap.getString("loginIp"));
		
		if("".equals(emfMap.getString("telRcvYn"))){
			emfMap.put("telRcvYn", "N");
		}
		if("".equals(emfMap.getString("smsRcvYn"))){
			emfMap.put("smsRcvYn", "N");
		}
		if("".equals(emfMap.getString("emailRcvYn"))){
			emfMap.put("emailRcvYn", "N");
		}
		if("".equals(emfMap.getString("ctlgRcvYn"))){
			emfMap.put("ctlgRcvYn", "N");
		}
		
		//회원 정보 수정 로그등록
		mLHPrsnDataChngDAO.insertMemInfModLog(emfMap);
		
		//고객서비스 수신동의 변경 로그를 등록한다.
		for(int i = 0; i < srvcRcvGb.length; i++)
		{
			emfMap.put("rcvGb", srvcRcvGb[i]);
			mLHPrsnDataChngDAO.insertSrvcRcvModLog(emfMap);
		}

//		log.debug(emfMap);
		//회원 정보 수정
		mLHPrsnDataChngDAO.updateMemInf(emfMap);
		
		//관심내역 setting
		List<String> intrPtcs = emfMap.getList("intrPtc");
		
		String intrPtc = "";
		
		for(int i = 0; i < intrPtcs.size(); i++)
		{
			if(i == 0)
			{
				intrPtc = intrPtcs.get(i);
			}
			else
			{
				intrPtc = intrPtc.concat(", " + intrPtcs.get(i));
			}
		}
		
		emfMap.put("intrPtc", intrPtc);
		
		//선호내역 setting
		List<String> pfrnPtcs = emfMap.getList("pfrnPtc");
		
		String pfrnPtc = "";
		
		for(int i = 0; i < pfrnPtcs.size(); i++)
		{
			if(i == 0)
			{
				pfrnPtc = pfrnPtcs.get(i);
			}
			else
			{
				pfrnPtc = pfrnPtc.concat(", " + pfrnPtcs.get(i));
			}
		}
		
		emfMap.put("pfrnPtc", pfrnPtc);
		
		//기타 정보 수정
		mLHPrsnDataChngDAO.updateEtcInf(emfMap);
		
		EmfMap tmpMap = lGBMemJoinService.selectMemInf(emfMap);
		
		if(tmpMap.get("info") != null)
    	{
			EmfMap memInfo = (EmfMap) tmpMap.get("info");
			
			lgnMap.put("email", memInfo.getString("email"));
			lgnMap.put("hp", memInfo.getString("hp"));
			lgnMap.put("tel", memInfo.getString("tel"));
			lgnMap.put("zipcd", memInfo.getString("zipcd"));
			lgnMap.put("adr", memInfo.getString("adr"));
			lgnMap.put("adrDtl", memInfo.getString("adrDtl"));
			
			RequestContextHolder.getRequestAttributes().setAttribute("userLgnMap", lgnMap, RequestAttributes.SCOPE_SESSION);
    	}
		
		/*
		 홈페이지 개인정보 로그 - 보안관련 로직 신규 구현
		 2017.12.26
		 */
		EmfMap logMap = new EmfMap();
		logMap.put("ip", EgovNetworkState.getMyIPaddress(request));
		logMap.put("gubun", "나의 라이프웨이 - 회원정보 관리 - 회원정보 변경");
		logMap.put("flag", "M");
		logMap.put("pageGubun", "H");
		logMap.put("name", lgnMap.getString("name"));
		logMap.put("hp", lgnMap.getString("hp"));
		logMap.put("id", lgnMap.getString("id"));
		cmmUseService.actionViewAuthLog(logMap);

		try
		{
			String marketingYn = "";
			if (emfMap.getString("marketingYn") == null || emfMap.getString("marketingYn") == "")
				marketingYn = "N";
			else
				marketingYn = emfMap.getString("marketingYn");

			ssoService.update(lgnMap.getString("integrationId")
								, lgnMap.getString("ci")
								, clientIp
								, lgnMap.getString("name")
								, emfMap.getString("email")
								, emfMap.getString("tel")
								, emfMap.getString("hp")
								, emfMap.getString("zipcd")
								, emfMap.getString("adr")
								, emfMap.getString("adrDtl")
								, marketingYn);
		}
		catch (SsoException ex)
		{
    		throw new Exception("통합회원 정보 업데이트에 실패했습니다.");
		}
	}

	/**
	 * 개명된 이름을 변경한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateMemRenameInf(EmfMap emfMap) throws Exception
	{
		emfMap.put("chngSeq", memChngIdgen.getNextIntegerId());
		
		//개명된 이름 변경 로그등록
		mLHPrsnDataChngDAO.insertMemRenameModLog(emfMap);
		
		//개명된 이름 변경
		mLHPrsnDataChngDAO.updateMemRenameInf(emfMap);				
	}

	/**
	 * 개명된 이름을 변경한다. - SSO
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateMemRenameInfSso(EmfMap emfMap, HttpServletRequest request) throws Exception
	{
		String clientIp = EgovNetworkState.getMyIPaddress(request);
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();

		emfMap.put("chngSeq", memChngIdgen.getNextIntegerId());
		
		//개명된 이름 변경 로그등록
		mLHPrsnDataChngDAO.insertMemRenameModLog(emfMap);
		
		//개명된 이름 변경
		mLHPrsnDataChngDAO.updateMemRenameInf(emfMap);				

		try
		{
			String marketingYn = "";
			if (lgnMap.getString("marketingYn") == null || lgnMap.getString("marketingYn") == "")
				marketingYn = "N";
			else
				marketingYn = lgnMap.getString("marketingYn");

			ssoService.update(lgnMap.getString("integrationId")
								, lgnMap.getString("ci")
								, clientIp
								, emfMap.getString("name")
								, lgnMap.getString("email")
								, lgnMap.getString("tel")
								, lgnMap.getString("hp")
								, lgnMap.getString("zipcd")
								, lgnMap.getString("adr")
								, lgnMap.getString("adrDtl")
								, marketingYn);
		}
		catch (SsoException ex)
		{
    		throw new Exception("통합회원 정보 업데이트에 실패했습니다.");
		}
	}

}
