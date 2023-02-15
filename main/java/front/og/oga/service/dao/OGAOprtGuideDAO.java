package front.og.oga.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 이용안내 조회를 위한 DAO
 * </pre>
 * 
 * @ClassName		: OGAOprtGuideDAO.java
 * @Description		: 이용안내 조회를 위한 DAO
 * @author 허진영
 * @since 2016.03.11
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.11		   허진영				  최초 생성
 * </pre>
 */ 
@Repository("oGAOprtGuideDAO")
public class OGAOprtGuideDAO extends EmfAbstractDAO {	
	
	/**
	 * 이용안내 개정일을 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectRvsnDtList(EmfMap emfMap) throws Exception
	{
		return list("OGAOprtGuideDAO.selectRvsnDtList", emfMap);
	}
	
	/**
	 * 이용안내을 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectOprtGuide(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("OGAOprtGuideDAO.selectOprtGuide", emfMap);
	}
}
