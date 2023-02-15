package front.ml.mla.service;

import java.util.List;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 납입현황 조회를 위한 Service
 * </pre>
 * 
 * @ClassName		: MLAPmtPtcService.java
 * @Description		: 납입현황 조회를 위한 Service
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
public interface MLAPmtPtcService {	
	
	/**
	 * 납입현황 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectPmtPtcList(EmfMap emfMap) throws Exception;
	
	/**
	 * 납입현황상세 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectPmtPtcDtlList(EmfMap emfMap) throws Exception;
	
	
	/**
	 * 납입현황 내용을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPmtPtcInfo(EmfMap emfMap) throws Exception;	
	
}
