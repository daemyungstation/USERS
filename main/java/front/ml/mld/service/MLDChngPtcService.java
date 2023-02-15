package front.ml.mld.service;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 전환서비스 신청내역 조회를 위한 Service
 * </pre>
 * 
 * @ClassName		: MLDChngPtcService.java
 * @Description		: 전환서비스 신청내역 조회를 위한 Service
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
public interface MLDChngPtcService {	
	
	/**
	 * 전환서비스 신청내역 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectChngPtcList(EmfMap emfMap) throws Exception;
	
	/**
	 * 전환서비스 신청내역 상세를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectChngPtcDtl(EmfMap emfMap) throws Exception;
	
	/**
	 * 전환서비스 신청을 취소한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateChngRqstCncl(EmfMap emfMap) throws Exception;
}
