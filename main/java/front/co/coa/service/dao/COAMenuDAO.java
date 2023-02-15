package front.co.coa.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 메뉴 조회를 위한 DAO
 * </pre>
 * 
 * @ClassName		: COAMenuDAO.java
 * @Description		: 메뉴 조회를 위한 DAO
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
@Repository("cOAMenuDAO")
public class COAMenuDAO extends EmfAbstractDAO {
	
	/**
	 * 메뉴를 가져온다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public List<EmfMap> getMenuList() throws Exception
    {
    	return list("COAMenuDAO.getMenuList", null);
    }
    
    /**
	 * 부모 메뉴를 가져온다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public List<EmfMap> getParntMenuList(int menuSeq) throws Exception
    {
    	return list("COAMenuDAO.getParntMenuList", menuSeq);
    }
}
