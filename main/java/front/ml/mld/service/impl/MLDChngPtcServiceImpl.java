package front.ml.mld.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.SeedCipher;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.ml.mld.service.MLDChngPtcService;
import front.ml.mld.service.dao.MLDChngPtcDAO;
import front.ml.mld.service.dao.MLDChngPtcOutDAO;

/**
 * <pre> 
 * 전환서비스 신청내역 조회를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: MLDChngPtcServiceImpl.java
 * @Description		: 전환서비스 신청내역 조회를 위한 ServiceImpl
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
@Service("mLDChngPtcService")
public class MLDChngPtcServiceImpl extends EmfAbstractService implements MLDChngPtcService {
	
	@Resource(name="mLDChngPtcDAO")
	private MLDChngPtcDAO mLDChngPtcDAO;
	
	@Resource(name="mLDChngPtcOutDAO")
	private MLDChngPtcOutDAO mLDChngPtcOutDAO;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;
	
	private String ENCODE = EgovProperties.getProperty("Global.CHARCODE");
	
	/**
	 * 전환서비스 신청내역 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectChngPtcList(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("memNo", lgnMap.getString("unqNo"));
		
		emfMap.put("id", lgnMap.getString("id"));
		
		EmfMap tmpMap = null;
		
		List<EmfMap> list = mLDChngPtcDAO.selectChngPtcList(emfMap);
		
		emfMap.put("list", list);
		
		for(int i = 0; i < list.size(); i++)
		{
			tmpMap = list.get(i);
			
			emfMap.put("accntNo", list.get(i).getString("accntNo"));
			
			tmpMap.put("prdctInfo", mLDChngPtcOutDAO.selectJoinPrdct(emfMap));
			
			emfMap.put("rqstSeq", list.get(i).getString("rqstSeq"));
			
			tmpMap.put("prcsLog", mLDChngPtcDAO.selectChngPtcLog(emfMap));
			
			list.set(i, tmpMap);
		}
		
		//공통코드 배열 셋팅
		ArrayList<String> cdDtlList = new ArrayList<String>();
		
		//전환서비스 - 처리현황
		cdDtlList.add("CHNG_PRCS_STTS");
		
		//정의된 코드id값들의 상세 코드 맵 반환		
		emfMap.put("cdDtlList", cmmUseService.selectCmmCodeBindAll(cdDtlList));
		
		return emfMap;
	}

	/**
	 * 전환서비스 신청내역 상세를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectChngPtcDtl(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("id", lgnMap.getString("id"));
		
		EmfMap userInfo = mLDChngPtcDAO.selectChngPtcDtl(emfMap);
		
		emfMap.put("userInfo", userInfo);
		//2017.04.25 박주석 디아모 적용
//		if(!"".equals(EMFStringUtil.nullConvert(userInfo.get("memEmail"))))
//		{
//			userInfo.put("memEmail", SeedCipher.decrypt(userInfo.getString("memEmail"), ENCODE));
//		}
//		
//		if(!"".equals(EMFStringUtil.nullConvert(userInfo.get("userCtel"))))
//		{
//			userInfo.put("userCtel", SeedCipher.decrypt(userInfo.getString("userCtel"), ENCODE));
//		}
//		
//		if(!"".equals(EMFStringUtil.nullConvert(userInfo.get("userEmail"))))
//		{
//			userInfo.put("userEmail", SeedCipher.decrypt(userInfo.getString("userEmail"), ENCODE));
//		}
		
		emfMap.put("memNo", lgnMap.getString("unqNo"));	
		
		emfMap.put("accntNo", userInfo.getString("accntNo"));	
		
		emfMap.put("memInfo", mLDChngPtcOutDAO.selectJoinPrdct(emfMap));
		
		emfMap.put("prdctInfo", mLDChngPtcDAO.selectChngPrdctInf(emfMap));
		
		return emfMap;
	}

	/**
	 * 전환서비스 신청을 취소한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateChngRqstCncl(EmfMap emfMap) throws Exception
	{
		try
		{
			//로그인 정보 가져오기
			EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
			
			emfMap.put("id", lgnMap.getString("id"));
			emfMap.put("modId", lgnMap.getString("id"));
			emfMap.put("modIp", lgnMap.getString("ip"));
			
			EmfMap userInfo = mLDChngPtcDAO.selectChngPtcDtl(emfMap);
			
			if("01".equals(userInfo.getString("prcsCd")))
			{
				//전환서비스 신청을 취소한다.
				mLDChngPtcDAO.updateChngRqstCncl(emfMap);
				
				//전환서비스 신청 처리현황 로그를 등록한다.
				mLDChngPtcDAO.insertRqstPrcsLog(emfMap);
			}
			else
			{
				throw new Exception("신청취소오류");
			}
		}
		catch(Exception e)
		{
			throw (Exception)e;
		}
	}
}
