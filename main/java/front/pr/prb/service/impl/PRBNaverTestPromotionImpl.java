package front.pr.prb.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.pr.prb.service.PRBNaverTestPromotionService;
import front.pr.prb.service.dao.PRBNaverTestPromotionDAO;

/**
 * <pre> 
 * 네이버 실시간 검색 테스트 프로모션 ServiceImpl
 * </pre>
 * 
 * @ClassName		: PRBNaverTestPromotionServiceImpl.java
 * @Description		: 네이버 실시간 검색 테스트 프로모션 ServiceImpl
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

@Service("pRBNaverTestPromotionService")
public class PRBNaverTestPromotionImpl extends EmfAbstractService implements PRBNaverTestPromotionService {
	
	@Resource(name="naverTestPromotionPvIdgen")
	private EgovTableIdGnrService naverTestPromotionPvIdgen;
	
	@Resource(name="naverTestPromotionDataIdgen")
	private EgovTableIdGnrService naverTestPromotionDataIdgen;
	
	@Resource(name="pRBNaverTestPromotionDAO")
	private PRBNaverTestPromotionDAO pRBNaverTestPromotionDAO;
	
	/**
	 * SELECT CONFIG
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectConfig(int iDivision) throws Exception
	{
		List<EmfMap> rstMap = pRBNaverTestPromotionDAO.selectConfig(iDivision);
		return rstMap;
	}
	
	
	/**
	 * INSERT PV
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertPv(EmfMap emfMap) throws Exception
	{
		emfMap.put("ntevtpvSeq", naverTestPromotionPvIdgen.getNextIntegerId());
		pRBNaverTestPromotionDAO.insertPv(emfMap);
	}
	
	/**
	 * INSERT 프로모션 데이터
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertNaverTestPromotion(EmfMap emfMap) throws Exception
	{
		emfMap.put("NTEVT_SEQ", naverTestPromotionDataIdgen.getNextIntegerId());
		pRBNaverTestPromotionDAO.insertNaverTestPromotion(emfMap);
	}
	
	
}
