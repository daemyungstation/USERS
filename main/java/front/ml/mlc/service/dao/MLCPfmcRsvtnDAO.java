package front.ml.mlc.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 공연 예약을 위한 DAO
 * </pre>
 * 
 * @ClassName		: COAMenuDAO.java
 * @Description		: 공연 예약을 위한 DAO
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
@Repository("mLCPfmcRsvtnDAO")
public class MLCPfmcRsvtnDAO extends EmfAbstractDAO {
	
	/**
	 * 공연 예약 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public List<EmfMap> selectPfmcRsvtnList(EmfMap emfMap) throws Exception
    {
    	return list("MLCPfmcRsvtnDAO.selectPfmcRsvtnList", emfMap);
    }
    
    /**
	 * 공연 예약 상세를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public EmfMap selectPfmcRsvtn(EmfMap emfMap) throws Exception
    {
    	return (EmfMap) selectByPk("MLCPfmcRsvtnDAO.selectPfmcRsvtn", emfMap);
    }
    
    /**
	 * 공연 예약을 취소한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public void updatePfmcRsvtnCancel(EmfMap emfMap) throws Exception
    {
    	update("MLCPfmcRsvtnDAO.updatePfmcRsvtnCancel", emfMap);
    }
    
    /**
     * 공연 예약 처리현황 로그를 등록한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public void insertRsvtnPrcsLog(EmfMap emfMap) throws Exception
	{
		insert("MLCPfmcRsvtnDAO.insertRsvtnPrcsLog", emfMap);
	}
}
