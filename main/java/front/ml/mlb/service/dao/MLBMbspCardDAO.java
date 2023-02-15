package front.ml.mlb.service.dao;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 멤버십카드 신청을 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLBMbspCardDAO.java
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
@Repository("mLBMbspCardDAO")
public class MLBMbspCardDAO extends EmfAbstractDAO {	
	
	/**
	 * 멤버십카드 신청 내역을 조회한다.
	 * 
	 * @param EmfMap
	 * @return int
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public int selectMbspCardRqstCnt(EmfMap emfMap) throws Exception
	{
		return (Integer) selectByPk("MLBMbspCardDAO.selectMbspCardRqstCnt", emfMap);
	}
	
	/**
	 * 멤버십카드 신청을 등록한다.
	 * 
	 * @param EmfMap
	 * @return
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertMbspCardRqst(EmfMap emfMap) throws Exception
	{
		insert("MLBMbspCardDAO.insertMbspCardRqst", emfMap);
	}
}
