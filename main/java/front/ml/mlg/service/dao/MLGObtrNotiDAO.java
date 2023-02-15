package front.ml.mlg.service.dao;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 부고알리미를 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLGObtrNotiDAO.java
 * @Description		: 부고알리미를 위한 DAO
 * @author 허진영
 * @since 2016.03.02
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.02		   허진영				  최초 생성
 * </pre>
 */ 
@Repository("mLGObtrNotiDAO")
public class MLGObtrNotiDAO extends EmfAbstractDAO {
	
	/**
	 * 부고알리미 정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectObtrNotiInf(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("MLGObtrNotiDAO.selectObtrNotiInf", emfMap);
	}
	
	/**
	 * 부고알리미 정보를 저장한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateObtrNotiInf(EmfMap emfMap) throws Exception
	{
		update("MLGObtrNotiDAO.updateObtrNotiInf", emfMap);
	}
}
