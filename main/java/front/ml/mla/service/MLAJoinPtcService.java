package front.ml.mla.service;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 가입내역 조회를 위한 Service
 * </pre>
 * 
 * @ClassName		: MLAJoinPtcService.java
 * @Description		: 가입내역 조회를 위한 Service
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
public interface MLAJoinPtcService {	
	
	/**
	 * 가입내역 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectJoinPtcList(EmfMap emfMap) throws Exception;
	
}
