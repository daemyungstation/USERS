package front.ml.mlg.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractOutDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 부고알리미를 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLGObtrNotiOutDAO.java
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
@Repository("mLGObtrNotiOutDAO")
public class MLGObtrNotiOutDAO extends EmfAbstractOutDAO {
	
	/**
	 * 가입상품 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectJoinPrdctList(EmfMap emfMap) throws Exception
	{
		return list("MLGObtrNotiOutDAO.selectJoinPrdctList", emfMap);
	}
	
	/**
	 * 가입상품 정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectJoinPrdctInf(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("MLGObtrNotiOutDAO.selectJoinPrdctInf", emfMap);
	}
}
