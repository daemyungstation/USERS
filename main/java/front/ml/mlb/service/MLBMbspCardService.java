package front.ml.mlb.service;

import java.util.List;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 멤버십카드 신청을 위한 Service
 * </pre>
 * 
 * @ClassName		: MLBMbspCardService.java
 * @Description		: 멤버십카드 신청을 위한 Service
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
public interface MLBMbspCardService {	
	
	/**
	 * 가입상품 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectJoinPrdctList(EmfMap emfMap) throws Exception;
	
	/**
	 * 멤버십카드 정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectMbspCardInf(EmfMap emfMap) throws Exception;
	
	/**
	 * 멤버십카드 신청을 등록한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertMbspCardRqst(EmfMap emfMap) throws Exception;
}
