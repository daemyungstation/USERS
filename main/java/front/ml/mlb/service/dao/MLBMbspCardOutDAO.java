package front.ml.mlb.service.dao;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractOutDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 멤버십카드 신청을 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLBMbspCardOutDAO.java
 * @Description		: 멤버십카드 신청을 위한 DAO
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
@Repository("mLBMbspCardOutDAO")
public class MLBMbspCardOutDAO extends EmfAbstractOutDAO {	
	
	/**
	 * 멤버십카드 정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectMbspCardInf(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("MLBMbspCardOutDAO.selectMbspCardInf", emfMap);
	}
	
	/**
	 * OCB카드 정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectOcbCardInf(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("MLBMbspCardOutDAO.selectOcbCardInf", emfMap);
	}
}
