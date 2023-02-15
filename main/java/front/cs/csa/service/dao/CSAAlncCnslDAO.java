package front.cs.csa.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 제휴 문의를 위한 DAO
 * </pre>
 * 
 * @ClassName		: CSAAlncCnslDAO.java
 * @Description		: 제휴 문의를 위한 DAO
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
@Repository("cSAAlncCnslDAO")
public class CSAAlncCnslDAO extends EmfAbstractDAO {
	
	/**
	 * 제휴 문의를 등록한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertAlncCnsl(EmfMap emfMap) throws Exception
	{
		insert("CSAAlncCnslDAO.insertAlncCnsl", emfMap);
	}
	
	/**
     * 제휴 문의 상세를 조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public EmfMap selectAlncCnsl(EmfMap emfMap) throws Exception 
    {
    	return (EmfMap) selectByPk("CSAAlncCnslDAO.selectAlncCnsl", emfMap);
    }
    
    /**
     * 제휴 문의 관련 관리자 목록을 조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public List<EmfMap> selectAlncCnslAdmList(EmfMap emfMap) throws Exception 
    {
    	return list("CSAAlncCnslDAO.selectAlncCnslAdmList", emfMap);
    }
}
