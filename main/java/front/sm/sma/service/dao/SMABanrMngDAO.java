package front.sm.sma.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 배너 관리를 위한 DAO
 * </pre>
 * 
 * @ClassName		: SMABanrMngDAO.java
 * @Description		: 배너 관리를 위한 DAO
 * @author 허진영
 * @since 2016.02.11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since			author				   description
 *   ===========    ==============    =============================
 *   2016.02.11.		허진영			 		최초생성
 * </pre>
 */
@Repository("sMABanrMngDAO")
public class SMABanrMngDAO extends EmfAbstractDAO {

	/**
	 * 배너 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectBanrList(EmfMap emfMap) throws Exception 
    {
    	return list("SMABanrMngDAO.selectBanrList", emfMap);
    }
}
