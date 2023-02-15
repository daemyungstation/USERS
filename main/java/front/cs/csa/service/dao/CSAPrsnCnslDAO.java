package front.cs.csa.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 1:1 상담하기를 위한 DAO
 * </pre>
 * 
 * @ClassName		: CSAPrsnCnslDAO.java
 * @Description		: 1:1 상담하기를 위한 DAO
 * @author 허진영
 * @since 2016.03.03
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.03		   허진영				  최초 생성
 * </pre>
 */ 
@Repository("cSAPrsnCnslDAO")
public class CSAPrsnCnslDAO extends EmfAbstractDAO {
	
	/**
	 * 1:1 상담하기를 등록한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertPrsnCnsl(EmfMap emfMap) throws Exception
	{
		insert("CSAPrsnCnslDAO.insertPrsnCnsl", emfMap);
	}
	
	/**
     * 1:1 상담 상세를 조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public EmfMap selectPrsnCnsl(EmfMap emfMap) throws Exception 
    {
    	return (EmfMap) selectByPk("CSAPrsnCnslDAO.selectPrsnCnsl", emfMap);
    }
	
	/**
     * 1:1 상담 관련 관리자 목록을 조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public List<EmfMap> selectPrsnCnslAdmList(EmfMap emfMap) throws Exception 
    {
    	return list("CSAPrsnCnslDAO.selectPrsnCnslAdmList", emfMap);
    }
}
