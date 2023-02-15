package front.pr.prb.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 네이버 실시간 검색 테스트 프로모션 DAO
 * </pre>
 * 
 * @ClassName		: PRBNaverTestPromotionDAO.java
 * @Description		: 네이버 실시간 검색 테스트 프로모션 DAO
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

@Repository("pRBNaverTestPromotionDAO")
public class PRBNaverTestPromotionDAO extends EmfAbstractDAO {
	
	/**
	 * 설정 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectConfig(int iDivision) throws Exception
	{
		EmfMap emfMap = new EmfMap();
		emfMap.put("PNTEC_DIVISION", iDivision);
		
		return list("NaverTestPromotionDAO.selectConfig", emfMap);
	}
	
	/**
     * PV 등록
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public void insertPv(EmfMap emfMap) throws Exception 
	{
		insert("NaverTestPromotionDAO.insertPv", emfMap);
    }
	
	/**
     * 데이터 등록
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public void insertNaverTestPromotion(EmfMap emfMap) throws Exception 
	{
		insert("NaverTestPromotionDAO.insertNaverTestPromotion", emfMap);
    }
	
}
