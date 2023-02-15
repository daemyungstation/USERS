package front.ml.mld.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.MailService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovNumberUtil;
import egovframework.com.utl.sim.service.SeedCipher;
import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.co.util.COPaginationUtil;
import front.ml.mla.service.MLAAcntChngService;
import front.ml.mld.service.MLDChngPtcService;
import front.ml.mld.service.MLDChngRqstService;
import front.ml.mld.service.dao.MLDChngRqstDAO;
import front.ml.mld.service.dao.MLDChngRqstOutDAO;

/**
 * <pre> 
 * 전환서비스 신청을 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: MLDChngRqstServiceImpl.java
 * @Description		: 전환서비스 신청을 위한 ServiceImpl
 * @author 허진영
 * @since 2016.03.18
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.18		   허진영				  최초 생성
 * </pre>
 */ 
@Service("mLDChngRqstService")
public class MLDChngRqstServiceImpl extends EmfAbstractService implements MLDChngRqstService {	
	
	@Resource(name="mLDChngRqstDAO")
	private MLDChngRqstDAO mLDChngRqstDAO;
	
	@Resource(name="mLDChngRqstOutDAO")
	private MLDChngRqstOutDAO mLDChngRqstOutDAO;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;
	
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;
	
	@Resource(name="mLAAcntChngService")
	private MLAAcntChngService mLAAcntChngService;
	
	@Resource(name="mLDChngPtcService")
	private MLDChngPtcService mLDChngPtcService;
	
	@Resource(name="mailService")
	private MailService mailService;
	
	@Resource(name="chngSrvcRqstIdgen")
	private EgovTableIdGnrService chngSrvcRqstIdgen;
	
	private String ENCODE = EgovProperties.getProperty("Global.CHARCODE");
	
	/**
	 * 가입상품 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectJoinPrdctList(EmfMap emfMap) throws Exception
	{
		return mLAAcntChngService.selectJoinPrdctList(emfMap);
	}
	
	/**
	 * 가입상품 상세를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectJoinPrdct(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("memNo", lgnMap.getString("unqNo"));
		
		emfMap.put("prdctInfo", mLDChngRqstOutDAO.selectJoinPrdct(emfMap));
		
		if(emfMap.get("prdctInfo") != null){
			emfMap.put("chngSys", mLDChngRqstDAO.selectChngSys(emfMap));	
		}
		
		return emfMap;
	}
	
	/**
	 * 전환서비스상품 상세 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPrdctDtlList(EmfMap emfMap) throws Exception
	{
		emfMap.put("cntPage", "12");
		
		PaginationInfo paginationInfo = new COPaginationUtil().getPage(emfMap);
		
		//페이징 처리
		emfMap.put("paginationInfo", paginationInfo);
		
		//리스트 가져오기
		List<EmfMap> list = mLDChngRqstDAO.selectPrdctDtlList(emfMap);
		
		emfMap.put("list", list);
		
		if(list.size() > 0)
		{
			paginationInfo.setTotalRecordCount(Integer.parseInt(list.get(0).getString("totCnt")));
		}
		else
		{
			paginationInfo.setTotalRecordCount(0);
		}
		
		return emfMap;
	}
	
	/**
	 * 전환서비스상품 상세 정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPrdctDtlInf(EmfMap emfMap) throws Exception
	{
		EmfMap dtlInfo = mLDChngRqstDAO.selectPrdctDtlInf(emfMap);
		
		emfMap.put("dtlInfo", dtlInfo);
		
		if(!"".equals(EMFStringUtil.nullConvert(dtlInfo.get("atchFileId"))))
		{
			emfMap.put("fileList", fileMngService.selectFileInfs(dtlInfo));
		}
		
		List<EmfMap> dtlInfoPtc = mLDChngRqstDAO.selectPrdctDtlInfPtc(emfMap);
		
		emfMap.put("dtlInfoPtc", dtlInfoPtc);
		
		return emfMap;
	}
	
	/**
	 * 회원정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectMemInf(EmfMap emfMap) throws Exception
	{
		try
		{
			//로그인 정보 가져오기
			EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
			
			emfMap.put("id", lgnMap.getString("id"));
			
			int chngRqstCnt = mLDChngRqstDAO.selectChngRqstCnt(emfMap);
			
			if(chngRqstCnt < 1)
			{
				emfMap.put("memNo", lgnMap.getString("unqNo"));
				
				emfMap.put("memInfo", mLDChngRqstOutDAO.selectJoinPrdct(emfMap));
				
				//공통코드 배열 셋팅
				ArrayList<String> cdDtlList = new ArrayList<String>();
				
				//전환서비스 - 회원관계구분
				cdDtlList.add("MEM_REL_GB");
				
				//정의된 코드id값들의 상세 코드 맵 반환		
				emfMap.put("cdDtlList", cmmUseService.selectCmmCodeBindAll(cdDtlList));
			}
			else
			{
				throw new Exception("재신청오류");
			}
		}
		catch(Exception e)
		{
			throw (Exception)e;
		}
		
		return emfMap;
	}
	
	/**
	 * 상품정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPrdctInf(EmfMap emfMap) throws Exception
	{
		return mLDChngRqstDAO.selectPrdctInf(emfMap);
	}
	
	/**
	 * 전환서비스 신청을 한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertChngSrvcRqst(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("rqstSeq", chngSrvcRqstIdgen.getNextIntegerId());
		emfMap.put("id", lgnMap.getString("id"));
		
		EmfMap rqstInfo = (EmfMap) emfMap.get("rqstInfo");
		//2017.04.25 박주석 디아모 적용
//		if(!"".equals(EMFStringUtil.nullConvert(rqstInfo.get("memEmail"))))
//		{
//			rqstInfo.put("memEmail", SeedCipher.encrypt(rqstInfo.getString("memEmail"), ENCODE));	
//		}	
//		
//		if(!"".equals(EMFStringUtil.nullConvert(rqstInfo.get("userCtel"))))
//		{
//			rqstInfo.put("userCtel", SeedCipher.encrypt(rqstInfo.getString("userCtel"), ENCODE));	
//		}
//		
//		if(!"".equals(EMFStringUtil.nullConvert(rqstInfo.get("userEmail"))))
//		{
//			rqstInfo.put("userEmail", SeedCipher.encrypt(rqstInfo.getString("userEmail"), ENCODE));	
//		}	
		
		emfMap.put("regId", lgnMap.getString("id"));
		emfMap.put("regIp", lgnMap.getString("loginIp"));
		emfMap.put("modId", lgnMap.getString("id"));
		emfMap.put("modIp", lgnMap.getString("loginIp"));
		
		//전환서비스 신청을 한다.	
		mLDChngRqstDAO.insertChngSrvcRqst(emfMap);
		
		//전환서비스 신청 처리현황 로그를 등록한다.
		mLDChngRqstDAO.insertRqstPrcsLog(emfMap);
		
		//메일발송을 위해 사용자정보를 가져온다.
		EmfMap tmpMap = mLDChngPtcService.selectChngPtcDtl(emfMap);
		
		EmfMap userInfo = (EmfMap) tmpMap.get("userInfo");
		EmfMap memInfo = (EmfMap) tmpMap.get("memInfo");
		EmfMap prdctInfo = (EmfMap) tmpMap.get("prdctInfo");

		if(!"".equals(EMFStringUtil.nullConvert(userInfo.get("memEmail"))))
		{
			EmfMap mailMap = new EmfMap();
			
			mailMap.put("subject", "[대명아임레디 전환서비스 신청 완료] 메일입니다.");
			mailMap.put("toUser", userInfo.getString("memEmail"));
			mailMap.put("name", userInfo.getString("name"));
			mailMap.put("accntNo", userInfo.getString("accntNo"));
			
			int prodAmt = Integer.parseInt(EMFStringUtil.nvl(memInfo.getString("prodAmt"), "0"));
			//int trueAmt = Integer.parseInt(EMFStringUtil.nvl(memInfo.getString("trueAmt"), "0"));
			//int relatAmt = Integer.parseInt(EMFStringUtil.nvl(memInfo.getString("relatAmt"), "0"));
			//int addAmt = Integer.parseInt(EMFStringUtil.nvl(memInfo.getString("addAmt"), "0"));
			//int itmdtPay = Integer.parseInt(EMFStringUtil.nvl(userInfo.getString("itmdtPay"), "0"));
			
			mailMap.put("pay", EgovNumberUtil.amtConvert(prodAmt));
			mailMap.put("prodNm", memInfo.getString("prodNm"));
			mailMap.put("prdctGb", prdctInfo.getString("prdctGb"));
			
			mailService.sendTempleteMail(mailMap, "ml/mld/MLDChngRqstComp.html");
		}

		//메일발송을 위해 관리자정보를 가져온다.
		List<EmfMap> admList = mLDChngRqstDAO.selectChngSrvcAdmList(emfMap);
		
		if(admList.size() > 0)
		{
			EmfMap admMailMap = new EmfMap();
			
			admMailMap.put("subject", "[대명아임레디 관리자 전환서비스 신청 안내] 메일입니다.");
			admMailMap.put("accntNo", userInfo.getString("accntNo"));
			
			int prodAmt = Integer.parseInt(EMFStringUtil.nvl(memInfo.getString("prodAmt"), "0"));
			//int trueAmt = Integer.parseInt(EMFStringUtil.nvl(memInfo.getString("trueAmt"), "0"));
			//int relatAmt = Integer.parseInt(EMFStringUtil.nvl(memInfo.getString("relatAmt"), "0"));
			//int addAmt = Integer.parseInt(EMFStringUtil.nvl(memInfo.getString("addAmt"), "0"));
			//int itmdtPay = Integer.parseInt(EMFStringUtil.nvl(userInfo.getString("itmdtPay"), "0"));
			
			admMailMap.put("pay", EgovNumberUtil.amtConvert(prodAmt));
			admMailMap.put("prodNm", memInfo.getString("prodNm"));
			admMailMap.put("prdctNm", prdctInfo.getString("prdctNm"));
			
			for(int i = 0; i < admList.size(); i++)
			{
				
//				admMailMap.put("toUser", SeedCipher.decrypt(admList.get(i).getString("email"), ENCODE));
				admMailMap.put("toUser", admList.get(i).getString("email") );
				admMailMap.put("name", admList.get(i).getString("name"));
				
				mailService.sendTempleteMail(admMailMap, "ml/mld/MLDChngRqstAdmin.html");
			}
		}
	}
}
