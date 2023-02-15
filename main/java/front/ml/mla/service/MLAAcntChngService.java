package front.ml.mla.service;

import java.util.List;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 결제계좌 조회/변경을 위한 Service
 * </pre>
 * 
 * @ClassName		: MLAAcntChngService.java
 * @Description		: 결제계좌 조회/변경을 위한 Service
 * @author 허진영
 * @since 2016.03.02
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.02		   허진영				  최초 생성
 * </pre>
 */ 
public interface MLAAcntChngService {	
	
	/**
	 * 가입상품 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectJoinPrdctList(EmfMap emfMap) throws Exception;


	/**
	 * 가입상품 목록을 조회한다.(결제계좌 변경안내)
	 *
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	List<EmfMap> selectJoinPrdctListPaymentAccount(EmfMap emfMap) throws Exception;

	/**
	 * 가입상품 목록을 조회한다.(로그인)
	 *
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	List<EmfMap> selectJoinPrdctListForLogin(EmfMap emfMap) throws Exception;
	/**
	 * 결제계좌 정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPayAcntInf(EmfMap emfMap) throws Exception;
	
	/**
	 * 결제계좌 변경신청을 등록한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertAcntChngRqst(EmfMap emfMap) throws Exception;
}
