package front.ml.mla.service;

import java.util.List;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 환급금 조회를 위한 Service
 * </pre>
 * 
 * @ClassName		: MLARefndPtcService.java
 * @Description		: 환급금 조회를 위한 Service
 * @author 허진영
 * @since 2016.03.16
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.16		   허진영				  최초 생성
 * </pre>
 */ 
public interface MLARefndPtcService {	
	
	/**
	 * 환급금 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectRefndPtcList(EmfMap emfMap) throws Exception;
	
	/**
	 * 환급금상세 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectRefndPtcDtlList(EmfMap emfMap) throws Exception;

	EmfMap getRefndPtcHistoryList(EmfMap emfMap) throws Exception;
}
