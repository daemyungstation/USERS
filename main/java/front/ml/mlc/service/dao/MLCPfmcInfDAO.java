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
 * @ClassName		: MLCPfmcInfDAO.java
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
@Repository("mLCPfmcInfDAO")
public class MLCPfmcInfDAO extends EmfAbstractDAO {
	
	/**
	 * 공연 정보 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public List<EmfMap> selectPfmcInfList(EmfMap emfMap) throws Exception
    {
    	return list("MLCPfmcInfDAO.selectPfmcInfList", emfMap);
    }
    
    /**
	 * 공연 정보 상세를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public EmfMap selectPfmcInf(EmfMap emfMap) throws Exception
    {
    	return (EmfMap) selectByPk("MLCPfmcInfDAO.selectPfmcInf", emfMap);
    }
    
    /**
	 * 공연 예약일시를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public List<EmfMap> selectRsvtnDtmList(EmfMap emfMap) throws Exception
    {
    	return list("MLCPfmcInfDAO.selectRsvtnDtmList", emfMap);
    }
    
    /**
  	 * 공연 예약 등록을 위한 유효성 조회
  	 * 
  	 * @param EmfMap
  	 * @return List<EmfMap>
  	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
  	 */
    public EmfMap getPfmcRsvtnInf(EmfMap emfMap) throws Exception
    {
    	return (EmfMap) selectByPk("MLCPfmcInfDAO.getPfmcRsvtnInf", emfMap);
    }
    
    /**
	 * 공연 예약을 등록한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public void insertPfmcRsvtn(EmfMap emfMap) throws Exception
    {
    	insert("MLCPfmcInfDAO.insertPfmcRsvtn", emfMap);
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
		insert("MLCPfmcInfDAO.insertRsvtnPrcsLog", emfMap);
	}
	
	/**
     * 메일 발송을 위한 관리자 정보를 조회한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public List<EmfMap> selectPfmcRsvtnAdmList(EmfMap emfMap) throws Exception
	{
		return list("MLCPfmcInfDAO.selectPfmcRsvtnAdmList", emfMap);
	}
	
	/**
  	 * 공연 예약 등록을 위한 월 1회 유효성 조회
  	 * 
  	 * @param EmfMap
  	 * @return List<EmfMap>
  	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
  	 */
	public EmfMap getCheckMonth(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("MLCPfmcInfDAO.getCheckMonth", emfMap);
	}
}