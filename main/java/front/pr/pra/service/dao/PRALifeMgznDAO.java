package front.pr.pra.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 라이프웨이 매거진 조회를 위한 DAO
 * </pre>
 * 
 * @ClassName		: PRALifeMgznDAO.java
 * @Description		: 라이프웨이 매거진 조회를 위한 DAO
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
@Repository("pRALifeMgznDAO")
public class PRALifeMgznDAO extends EmfAbstractDAO {
	
	/**
	 * 라이프웨이 매거진 발간년도을 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectMgznPbtnYrList() throws Exception
	{
		return list("PRALifeMgznDAO.selectMgznPbtnYrList", null);
	}
	
	/**
	 * 라이프웨이 매거진을 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectLifeMgzn(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("PRALifeMgznDAO.selectLifeMgzn", emfMap);
	}
}
