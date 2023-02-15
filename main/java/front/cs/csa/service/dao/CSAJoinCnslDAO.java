package front.cs.csa.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 가임상담 신청을 위한 DAO
 * </pre>
 * 
 * @ClassName		: CSAJoinCnslDAO.java
 * @Description		: 가임상담 신청을 위한 DAO
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
@Repository("cSAJoinCnslDAO")
public class CSAJoinCnslDAO extends EmfAbstractDAO {
	
	/**
	 * 가입 상담 신청을 등록한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertJoinCnsl(EmfMap emfMap) throws Exception
	{
		insert("CSAJoinCnslDAO.insertJoinCnsl", emfMap);
	}
	
	/**
     * 가입 상담 상세를 조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public EmfMap selectJoinCnsl(EmfMap emfMap) throws Exception 
    {
    	return (EmfMap) selectByPk("CSAJoinCnslDAO.selectJoinCnsl", emfMap);
    }
	
	/**
     * 가입 상담 관련 관리자 목록을 조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public List<EmfMap> selectJoinCnslAdmList(EmfMap emfMap) throws Exception 
    {
    	return list("CSAJoinCnslDAO.selectJoinCnslAdmList", emfMap);
    }
}
