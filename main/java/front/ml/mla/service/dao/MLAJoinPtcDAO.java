package front.ml.mla.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractOutDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 가입내역 조회를 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLAJoinPtcDAO.java
 * @Description		: 가입내역 조회를 위한 DAO
 * @author 허진영
 * @since 2016.03.15
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.15		   허진영				  최초 생성
 * </pre>
 */ 
@Repository("mLAJoinPtcDAO")
public class MLAJoinPtcDAO extends EmfAbstractOutDAO {

	/**
	 * 가입내역 목록을 조회한다.
	 *
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectJoinPtcList(EmfMap emfMap) throws Exception
	{
		return list("MLAJoinPtcDAO.selectJoinPtcList", emfMap);
	}

	/**
	 * 부가서비스 목록을 조회한다.
	 *
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectSpplSrvcList(EmfMap emfMap) throws Exception
	{
		return list("MLAJoinPtcDAO.selectSpplSrvcList", emfMap);
	}
}
