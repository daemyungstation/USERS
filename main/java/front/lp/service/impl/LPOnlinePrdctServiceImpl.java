package front.lp.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.MailService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovNetworkState;
import egovframework.com.utl.sim.service.SeedCipher;
import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.co.util.COPaginationUtil;
import front.lg.lgb.service.LGBMemJoinService;
import front.lp.service.DmLifeService;
import front.lp.service.LPOnlinePrdctService;
import front.lp.service.dao.LPAOnlinePrdctDAO;

/**
 * <pre> 
 * 온라인 상품가입을 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: LPAOnlinePrdctServiceImpl.java
 * @Description		: 온라인 상품가입을 위한 ServiceImpl
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
@Service("lPOnlinePrdctService")
public class LPOnlinePrdctServiceImpl extends EmfAbstractService implements LPOnlinePrdctService {
	
	@Resource(name="lPAOnlinePrdctDAO")
	private LPAOnlinePrdctDAO lPAOnlinePrdctDAO;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;	
	
	@Resource(name="lGBMemJoinService")
    private LGBMemJoinService lGBMemJoinService;
	
	@Resource(name="dMLifeService")
    private DmLifeService dMLifeService;
	
	/*메일 service*/
    @Resource(name="mailService")
	private MailService mailService;

	@Resource(name="onlinePrdctCsMstIdgen")
	private EgovTableIdGnrService onlinePrdctCsMstIdgen;
	
	private String ENCODE = EgovProperties.getProperty("Global.CHARCODE");
	
	/**
	 * 최근에 적용된 약관을 조회한다.
	 */
	public EmfMap selectTopTerms(EmfMap emfMap) throws Exception
	{
		emfMap.put("cd", "ITDPD");
		emfMap.put("itdpd", lPAOnlinePrdctDAO.selectTopTerms(emfMap));		// 상조 약관
		
		emfMap.put("cd", "RST");
		emfMap.put("rst", lPAOnlinePrdctDAO.selectTopTerms(emfMap));		// 대명리조트 약관

		emfMap.put("cd", "OCB");
		emfMap.put("ocb", lPAOnlinePrdctDAO.selectTopTerms(emfMap));		// 캐쉬백 약관
		
		return emfMap;
	}

    /**
     * 온라인 상담신청 상세를 조회한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public EmfMap selectOnlinePrdctInf(EmfMap emfMap) throws Exception
    {    	
		List<EmfMap> onlinePrdctList = lPAOnlinePrdctDAO.selectOnlinePrdctList(emfMap);	// 상품그룹 조회    		
		emfMap.put("prdctGrpList", onlinePrdctList);

		ArrayList<String> cdDtlList = new ArrayList<String>();		//공통코드 배열 셋팅
		cdDtlList.add("PROCESS_TYPE");								// 처리현황 구분
		cdDtlList.add("B2B_PRDCT_CD");								// 온라인 B2B 상품 코드
		//cdDtlList.add("BANK_GB");									// 은행코드
		//cdDtlList.add("CARD_GB");									// 카드사코드
		//cdDtlList.add("PMT_DAY_GB");								// 납부일
		cdDtlList.add("HAPPY_CALL");								// 해피콜 가능시간
		
		emfMap.put("cdDtlList", cmmUseService.selectCmmCodeBindAll(cdDtlList));
		
		EmfMap codeMap = new EmfMap();
		
		codeMap.put("grpCd", "0120");								// 카드 코드
		emfMap.put("cardGb", dMLifeService.selectComCd(codeMap));

		codeMap.put("grpCd", "63");									// 은행 코드		
		emfMap.put("bankGb", dMLifeService.selectComCd(codeMap));
		
		return emfMap;
    }
    
	/**
     * 온라인 상담신청을 등록한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public void insertOnlinePrdctJoin(EmfMap emfMap) throws Exception
	{		
		EmfMap admEmailMap = new EmfMap();
		
		String email = "", gubun = "";
		
		// 일반회원 일 때
		if(EgovProperties.getProperty("Globals.gnrlPrdctCd").equals(emfMap.getString("prdctCsGb")))
		{
			EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();	// 로그인 사용자 정보
			
			EmfMap memInfMap = new EmfMap();
			
			memInfMap.put("id", lgnMap.getString("id"));
			memInfMap = lGBMemJoinService.selectMemInf(memInfMap);	// 회원정보 조회
			memInfMap = (EmfMap) memInfMap.get("info");
					
			emfMap.put("regId", lgnMap.getString("id"));
			emfMap.put("regNm", lgnMap.getString("name"));
			emfMap.put("regIp", lgnMap.getString("loginIp"));
			emfMap.put("name", memInfMap.getString("name"));
			emfMap.put("birth", memInfMap.getString("birth"));
			emfMap.put("email", memInfMap.getString("email"));
			emfMap.put("hp", memInfMap.getString("hp"));
			emfMap.put("tel", memInfMap.getString("tel"));
			
			if("0".equals(memInfMap.getString("sex")))
			{
				emfMap.put("sex", "f");
			}
			else if("1".equals(memInfMap.getString("sex")))
			{
				emfMap.put("sex", "m");
			}

			emfMap.put("zipcd1", memInfMap.getString("zipcd"));
			emfMap.put("adr", memInfMap.getString("adr"));
			emfMap.put("adrDtl", memInfMap.getString("adrDtl"));
			
			email = memInfMap.getString("email");
			gubun = "일반 상품 가입";
			admEmailMap.put("menuSeq", 126);
		}
		else if(EgovProperties.getProperty("Globals.b2bPrdctCd").equals(emfMap.getString("prdctCsGb")))
		{
			// B2B회원 일 때
			emfMap.put("regIp", EgovNetworkState.getMyIPaddress());
			emfMap.put("regNm", emfMap.getString("name"));
			
			email = emfMap.getString("email");
			gubun = "B2B 상품 가입";
			admEmailMap.put("menuSeq", 127);
		}
		
		emfMap.put("onlinePrdctCsMstSeq", onlinePrdctCsMstIdgen.getNextIntegerId());
		//2017.04.25 박주석 디아모 적용
//		if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("email"))))
//		{
//			emfMap.put("email", SeedCipher.encrypt(emfMap.getString("email"), ENCODE));		// 이메일 암호화	
//		}
//		
//		if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("hp"))))
//		{
//			emfMap.put("hp", SeedCipher.encrypt(emfMap.getString("hp"), ENCODE));			// 핸드폰 암호화	
//		}
//		
//		if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("tel"))))
//		{
//			emfMap.put("tel", SeedCipher.encrypt(emfMap.getString("tel"), ENCODE));			// 전화번호 암호화	
//		}
//		
//		if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("adrDtl"))))
//		{
//			emfMap.put("adrDtl", SeedCipher.encrypt(emfMap.getString("adrDtl"), ENCODE));	// 상세주소 암호화	
//		}
//		
//		if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("adrDtl2"))))
//		{
//			emfMap.put("adrDtl2", SeedCipher.encrypt(emfMap.getString("adrDtl2"), ENCODE));	// 상세주소 암호화	
//		}		

		lPAOnlinePrdctDAO.insertOnlinePrdctCsMng(emfMap);				// 상담신청 고객정보 저장
		
		List<String> prdctGrpCdList = emfMap.getList("prdctGrpCd");		// 상품그룹코드 리스트		
		List<String> prdctCdList = emfMap.getList("prdctCd");			// 상품코드 리스트
		List<String> prdctNmList = emfMap.getList("prdctNm");			// 상품명 리스트
		List<String> prdctDtlCdList = emfMap.getList("prdctDtlCd");		// 상세상품코드 리스트
		List<String> prdctDtlNmList = emfMap.getList("prdctDtlNm");		// 상세상품명 리스트		
		List<String> prdctAcntList = emfMap.getList("prdctAcnt");		// 구좌수 리스트
		
		List<String> payMtdList = emfMap.getList("payMtd");				// 납입방식 리스트
		List<String> asgnYnList = emfMap.getList("asgnYn");				// 담당자여부 리스트
		List<String> asgnCdList = emfMap.getList("asgnCd");				// 담당자코드 리스트
		List<String> asgnNmList = emfMap.getList("asgnNm");				// 담당자이름 리스트
		
		List<String> coNmList = emfMap.getList("coNm");					// 회사명 리스트
		List<String> coCdList = emfMap.getList("coCd");					// 회사코드 리스트
		List<String> deptList = emfMap.getList("dept");					// 부서명 리스트
		List<String> stfList = emfMap.getList("stf");					// 사원명 리스트

		for(int i = 0; i < prdctGrpCdList.size(); i++)
		{
			emfMap.put("prdctGrpCd", prdctGrpCdList.get(i));
			emfMap.put("prdctCd", prdctCdList.get(i));
			emfMap.put("prdctNm", prdctNmList.get(i));			
			emfMap.put("payMtd", payMtdList.get(i));
			
			if(EgovProperties.getProperty("Globals.gnrlPrdctCd").equals(emfMap.getString("prdctCsGb")))
			{
				emfMap.put("prdctAcnt", prdctAcntList.get(i));
				emfMap.put("asgnYn", asgnYnList.get(i));
				emfMap.put("asgnCd", asgnCdList.get(i));
				emfMap.put("asgnNm", asgnNmList.get(i));
			}
			else
			{
				emfMap.put("prdctDtlNm", prdctDtlNmList.get(i));
				emfMap.put("prdctDtlCd", prdctDtlCdList.get(i));			
				
				// 임직원
				if(EgovProperties.getProperty("Globals.b2bCode1").equals(emfMap.getString("b2bCode")))
				{
					emfMap.put("asgnYn", asgnYnList.get(i));
					emfMap.put("asgnCd", asgnCdList.get(i));
					emfMap.put("asgnNm", asgnNmList.get(i));
				}
				// b2b회원
				else
				{	
					emfMap.put("coNm", coNmList.get(i));
					emfMap.put("coCd", coCdList.get(i));
					emfMap.put("dept", deptList.get(i));
					emfMap.put("stf", stfList.get(i));
					emfMap.put("alt", "");	
				}
			}
			
			lPAOnlinePrdctDAO.insertOnlinePrdctInf(emfMap);	// 신청상품 정보 저장	
		}
		//2017.04.25 박주석 디아모 적용
//		if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("acntHp"))))
//		{
//			emfMap.put("acntHp", SeedCipher.encrypt(emfMap.getString("acntHp"), ENCODE));	// 연락처 암호화	
//		}
//		
//		if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("pmtNo"))))
//		{
//			emfMap.put("pmtNo", SeedCipher.encrypt(emfMap.getString("pmtNo"), ENCODE));		// 계좌 or 카드번호 암호화	
//		}						
		
		lPAOnlinePrdctDAO.insertOnlinePrdctAcntInf(emfMap);	// 계좌정보 저장
		
		// 사용자 메일 발송
		if(!"".equals(email))
		{
			EmfMap mailMap = new EmfMap();
			
			mailMap.put("subject", "[대명아임레디 "+ gubun +" 안내] 메일입니다.");
			mailMap.put("toUser", email);
			mailMap.put("gubun", gubun);
			mailMap.put("name", emfMap.getString("name"));
			
			mailService.sendTempleteMail(mailMap, "lp/LPOnlinePrdctComp.html");
		}
		
		// 관리자 메일 발송
		List<EmfMap> admList = lPAOnlinePrdctDAO.selectAdminEmail(admEmailMap);
		
		if(admList.size() > 0)
		{
			EmfMap admMailMap = new EmfMap();
			
			admMailMap.put("subject", "[대명아임레디 관리자 "+ gubun +" 안내] 메일입니다.");
			admMailMap.put("gubun", gubun);
			
			for(int i = 0; i < admList.size(); i++)
			{
				//2017.04.25 박주석 디아모 적용
				admMailMap.put("toUser", admList.get(i).getString("email") );
//				admMailMap.put("toUser", SeedCipher.decrypt(admList.get(i).getString("email"), ENCODE));
				admMailMap.put("name", admList.get(i).getString("name"));

				mailService.sendTempleteMail(admMailMap, "lp/LPOnlinePrdctAdmin.html");				
			}
		}
	}
	
	/**
     * 회사 목록을 조회한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */	
	public EmfMap selectCompanyList(EmfMap emfMap) throws Exception
	{
    	PaginationInfo paginationInfo = new COPaginationUtil().getPage(emfMap);
		
    	//페이징 처리
    	emfMap.put("paginationInfo", paginationInfo); 
				
    	//리스트 가져오기
		List<EmfMap> productList = lPAOnlinePrdctDAO.selectCompanyList(emfMap);
		
		emfMap.put("list", productList);
		
		if(productList.size() > 0)
		{
			paginationInfo.setTotalRecordCount(Integer.parseInt(productList.get(0).getString("totCnt")));
		}
		else
		{
			paginationInfo.setTotalRecordCount(0);
		}    	
    	
		return emfMap;		
	}	

	/**
	 * 최근에 적용된 약관을 조회한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap getTerms(EmfMap emfMap) throws Exception
	{	
		List<EmfMap> termsGrpCdList = lPAOnlinePrdctDAO.selectTermsGrpCd(emfMap);				
		List<EmfMap> termsMapList = new ArrayList<EmfMap>();
		
		String cd = "";		
		
		for(int i = 0; i < termsGrpCdList.size(); i++)
		{
			EmfMap termsGrpCdMap = termsGrpCdList.get(i);
			
			cd = termsGrpCdMap.getString("cdId");
			
			emfMap.put("cd", cd.toUpperCase());
			
			// 최신 약관 조회
			EmfMap topTermsMap = lPAOnlinePrdctDAO.selectTopTerms(emfMap);
			
			termsMapList.add(topTermsMap);
		}
		
		emfMap.put("termsList", termsMapList);
		
		return emfMap;
	}
	
	/**
     * 약관을 조회한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public EmfMap selectTermsDtl(EmfMap emfMap) throws Exception
    {
    	emfMap.put("lev", 1);    	
		List<EmfMap> termLevel1Dtl = lPAOnlinePrdctDAO.selectTermsDtl(emfMap);
		
    	emfMap.put("lev", 2);
		List<EmfMap> termLevel2Dtl = lPAOnlinePrdctDAO.selectTermsDtl(emfMap);
		
    	emfMap.put("lev", 3);
		List<EmfMap> termLevel3Dtl = lPAOnlinePrdctDAO.selectTermsDtl(emfMap);
		
		for(int i = 0; i < termLevel2Dtl.size(); i++)
		{
			List<EmfMap> tempListMap = new ArrayList<EmfMap>();
			
			EmfMap tempMap2 = termLevel2Dtl.get(i);			
			
			for(int j = 0; j < termLevel3Dtl.size(); j++)
			{
				EmfMap tempMap3 = termLevel3Dtl.get(j);
				
				if(tempMap2.getString("trsDtlSeq").equals(tempMap3.getString("parentSeq")))
				{					
					tempListMap.add(tempMap3);				
				}
			}

			tempMap2.put("level3List", tempListMap);
			
			termLevel2Dtl.set(i, tempMap2);
		}
		
		for(int i = 0 ; i < termLevel1Dtl.size() ; i++)
		{
			List<EmfMap> tempListMap = new ArrayList<EmfMap>();
			
			EmfMap tempMap1 = termLevel1Dtl.get(i);
			
			for(int j = 0 ; j < termLevel2Dtl.size() ; j++)
			{
				EmfMap tempMap2 = termLevel2Dtl.get(j);				
				
				if(tempMap1.getString("trsDtlSeq").equals(tempMap2.getString("parentSeq")))
				{					
					tempListMap.add(tempMap2);				
				}
			}

			tempMap1.put("level2List", tempListMap);
			
			termLevel1Dtl.set(i, tempMap1);
		}		
		
		emfMap.put("list", termLevel1Dtl);
				
		return emfMap;
    }
    
	/**
	 * 약관 및 계약안내 설정 확인
	 *
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap checkTermGrp(EmfMap emfMap) throws Exception
	{
		List<EmfMap> listMap = lPAOnlinePrdctDAO.selectCheckTermGrp(emfMap);
		
		if(listMap.size() > 0)
		{
			emfMap.put("result", true);
		}
		else
		{
			emfMap.put("result", false);
		}
		
		return emfMap;
	}
	
	/**
     * 가입신청일자를 기준으로 적용된 약관 및 계약안내를 조회한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public List<EmfMap> selectMemTerm(EmfMap emfMap) throws Exception
	{
		List<EmfMap> resultMap = new ArrayList<EmfMap>();
		List<EmfMap> listMap = lPAOnlinePrdctDAO.selectCheckTermGrp(emfMap);
		
		for(int i = 0; i < listMap.size(); i++)
		{
			EmfMap tempMap = listMap.get(i);

			tempMap.put("joinDt", emfMap.getString("joinDt"));
			
			EmfMap termMsgKeyMap = lPAOnlinePrdctDAO.selectMemTermMst(tempMap);

			if(termMsgKeyMap != null)
			{
				selectTermsDtl(termMsgKeyMap);	
			}
				
			resultMap.add(termMsgKeyMap);
		}
		
		return resultMap;
	}
}
