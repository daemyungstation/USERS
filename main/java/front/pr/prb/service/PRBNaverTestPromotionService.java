package front.pr.prb.service;
import java.util.List;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 네이버 실시간 검색 테스트 프로모션 Service
 * </pre>
 * 
 * @ClassName		: PRBNaverTestPromotionService.java
 * @Description		: 네이버 실시간 검색 테스트 프로모션 Service
 * @author 이너스커뮤니티
 * @since 2019.07.15
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2019.07.15	   이너스커뮤니티			  최초 생성
 * </pre>
 */ 

public interface PRBNaverTestPromotionService {	
	
	
	/**
	 * CONFIG SET
	 * 
	 * @param EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectConfig(int iDivision) throws Exception;
	
	/**
	 * PV INSERT
	 * 
	 * @param EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertPv(EmfMap emfMap) throws Exception;
	
	/**
	 * 프로모션 INSERT
	 * 
	 * @param EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertNaverTestPromotion(EmfMap emfMap) throws Exception;
	
}
