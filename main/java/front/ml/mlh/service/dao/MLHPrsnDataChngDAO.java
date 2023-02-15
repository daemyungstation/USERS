package front.ml.mlh.service.dao;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 개인정보 변경을 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLHPrsnDataChngDAO.java
 * @Description		: 개인정보 변경을 위한 DAO
 * @author 허진영
 * @since 2016.03.04
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.04		   허진영				  최초 생성
 * </pre>
 */ 
@Repository("mLHPrsnDataChngDAO")
public class MLHPrsnDataChngDAO extends EmfAbstractDAO {	
	
	/**
	 * 회원 정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectMemInf(EmfMap emfMap) throws Exception
	{
		emfMap.put("id", emfMap.getString("integrationId"));
		
		return (EmfMap) selectByPk("MLHPrsnDataChngDAO.selectMemInf", emfMap);
	}
	
	/**
     * 회원 정보를 수정한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public void updateMemInf(EmfMap emfMap) throws Exception
	{
		update("MLHPrsnDataChngDAO.updateMemInf", emfMap);
	}
	
	/**
     * 회원 기타 정보를 수정한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public void updateEtcInf(EmfMap emfMap) throws Exception
	{
		update("MLHPrsnDataChngDAO.updateEtcInf", emfMap);
	}
	
	/**
     * 회원 정보 변경 로그를 등록한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public void insertMemInfModLog(EmfMap emfMap) throws Exception
	{
		insert("MLHPrsnDataChngDAO.insertMemInfModLog", emfMap);
	}
	
	/**
     * 고객서비스 수신동의 변경 로그를 등록한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public void insertSrvcRcvModLog(EmfMap emfMap) throws Exception
	{
		insert("MLHPrsnDataChngDAO.insertSrvcRcvModLog", emfMap);
	}
	
	public void insertInitialSrvcRcvModLog(EmfMap emfMap) throws Exception
	{
		insert("MLHPrsnDataChngDAO.insertInitialSrvcRcvModLog", emfMap);
	}
	
	/**
     * 개명된 이름을 수정한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public void updateMemRenameInf(EmfMap emfMap) throws Exception
	{
		update("MLHPrsnDataChngDAO.updateMemRenameInf", emfMap);
	}
	
	/**
     * 개명된 이름 수정 로그를 등록한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public void insertMemRenameModLog(EmfMap emfMap) throws Exception
	{
		insert("MLHPrsnDataChngDAO.insertMemRenameModLog", emfMap);
	}	
}
