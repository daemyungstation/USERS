package front.ml.mla.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.ml.mla.service.MLAPmtPtcService;
import front.ml.mla.service.dao.MLAPmtPtcDAO;

/**
 * <pre> 
 * 납입현황 조회를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: MLAPmtPtcServiceImpl.java
 * @Description		: 납입현황 조회를 위한 ServiceImpl
 * @author 허진영
 * @since 2016.03.15
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.15		   허진영				  최초 생성
 * </pre>
 */ 
@Service("mLAPmtPtcService")
public class MLAPmtPtcServiceImpl extends EmfAbstractService implements MLAPmtPtcService {
	
	@Resource(name="mLAPmtPtcDAO")
	private MLAPmtPtcDAO mLAPmtPtcDAO;
	
	/**
	 * 납입현황 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectPmtPtcList(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("memNo", lgnMap.getString("unqNo"));
		
		return mLAPmtPtcDAO.selectPmtPtcList(emfMap);
	}
	
	/**
	 * 납입현황상세 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectPmtPtcDtlList(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("memNo", lgnMap.getString("unqNo"));
		
		return mLAPmtPtcDAO.selectPmtPtcDtlList(emfMap);
	}
	
	/**
	 * 납입현황 상세내용을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPmtPtcInfo(EmfMap emfMap) throws Exception
	{
		EmfMap rtnMap = new EmfMap();
		
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("memNo", lgnMap.getString("unqNo"));

		EmfMap infoMap = mLAPmtPtcDAO.selectPmtPtcInfo(emfMap);
		
		if(infoMap != null)
		{
			rtnMap.put("info", infoMap);
			
			EmfMap deptInfMap = mLAPmtPtcDAO.selectDeptInf(infoMap);
			EmfMap productDtlMap = mLAPmtPtcDAO.selectProductDtlInf(infoMap);
			
			rtnMap.put("deptInfo", deptInfMap);
			rtnMap.put("productDtl", productDtlMap);
		}

		return rtnMap;
	}	
	
}
