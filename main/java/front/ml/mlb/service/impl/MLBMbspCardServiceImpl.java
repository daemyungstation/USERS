package front.ml.mlb.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.SeedCipher;
import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.ml.mla.service.MLAAcntChngService;
import front.ml.mlb.service.MLBMbspCardService;
import front.ml.mlb.service.dao.MLBMbspCardDAO;
import front.ml.mlb.service.dao.MLBMbspCardOutDAO;

/**
 * <pre> 
 * 멤버십카드 신청을 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: ServiceImpl.java
 * @Description		: 멤버십카드 신청을 위한 ServiceImpl
 * @author 허진영
 * @since 2016.03.23
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.23		   허진영				  최초 생성
 * </pre>
 */ 
@Service("mLBMbspCardService")
public class MLBMbspCardServiceImpl extends EmfAbstractService implements MLBMbspCardService {	
	
	@Resource(name="mLBMbspCardDAO")
	private MLBMbspCardDAO mLBMbspCardDAO;
	
	@Resource(name="mLBMbspCardOutDAO")
	private MLBMbspCardOutDAO mLBMbspCardOutDAO;
	
	@Resource(name="mLAAcntChngService")
	private MLAAcntChngService mLAAcntChngService;
	
	@Resource(name="mbspCardRqstIdgen")
	private EgovTableIdGnrService mbspCardRqstIdgen;
	
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
	 * 멤버십카드 정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectMbspCardInf(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("memNo", lgnMap.getString("unqNo"));
		
		log.debug("===================================================================================================================");
		log.debug(lgnMap);
		log.debug("===================================================================================================================");
		
		EmfMap mbspInfo = mLBMbspCardOutDAO.selectMbspCardInf(emfMap);
		
		if(mbspInfo != null)
		{
			emfMap.put("mbspInfo", mbspInfo);
			
			if(!"".equals(mbspInfo.getString("resortNo")) && !"B999".equals(mbspInfo.getString("mbspGb")))
			{
				emfMap.put("ocbInfo", mLBMbspCardOutDAO.selectOcbCardInf(emfMap));
			}
		}
		
		return emfMap;
	}
	
	/**
	 * 멤버십카드 신청을 등록한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertMbspCardRqst(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("id", lgnMap.getString("id"));
		
		int rqstCnt = mLBMbspCardDAO.selectMbspCardRqstCnt(emfMap);
		
		if(rqstCnt < 1)
		{
			emfMap.put("rqstSeq", mbspCardRqstIdgen.getNextIntegerId());
			emfMap.put("id", lgnMap.getString("id"));
			emfMap.put("zipcd", lgnMap.getString("zipcd"));
			emfMap.put("adr", lgnMap.getString("adr"));
			//2017.04.25 박주석 디아모 적용
//			if(!"".equals(lgnMap.getString("adrDtl")))
//			{
//				emfMap.put("adrDtl", SeedCipher.encrypt(lgnMap.getString("adrDtl"), ENCODE));
//			}
			
			emfMap.put("regId", lgnMap.getString("id"));
			emfMap.put("regIp", lgnMap.getString("loginIp"));
			emfMap.put("modId", lgnMap.getString("id"));
			emfMap.put("modIp", lgnMap.getString("loginIp"));
			
			mLBMbspCardDAO.insertMbspCardRqst(emfMap);
		}
		else
		{
			throw new Exception("재신청오류");
		}
	}
}
