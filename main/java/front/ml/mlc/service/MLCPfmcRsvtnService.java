package front.ml.mlc.service;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 공연 예약을 위한 Service
 * </pre>
 * 
 * @ClassName		: MLCPfmcRsvtnService.java
 * @Description		: 공연 예약을 위한 Service
 * @author 허진영
 * @since 2016.02.26
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.02.26		   허진영				  최초 생성
 * </pre>
 */ 
public interface MLCPfmcRsvtnService {	
	
	/**
	 * 공연 예약 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPfmcRsvtnList(EmfMap emfMap) throws Exception;
	
	/**
	 * 공연 예약 상세를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPfmcRsvtn(EmfMap emfMap) throws Exception;
	
	/**
	 * 공연 예약을 취소한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updatePfmcRsvtnCancel(EmfMap emfMap) throws Exception;
}
