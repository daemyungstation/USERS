package front.lg.lgb.service.dao;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractOutDAO;
import emf.core.vo.EmfMap;

import java.util.List;

/**
 * <pre> 
 * 전산DB 회원정보 DAO
 * </pre>
 * 
 * @ClassName		: DMLifeMemDAO.java
 * @Description		: 전산DB 회원정보 DAO
 * @author 김필기
 * @since 2016.03.03
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.03		   김필기				  최초 생성
 * </pre>
 */ 
@Repository("dMLifeMemDAO")
public class DMLifeMemDAO extends EmfAbstractOutDAO {

	/**
	 * 회원 정보를 가져온다
	 *
	 * @param emfMap
	 * @return
	 * @throws Exception
	 */
	public List<EmfMap> selectDMLifeMemInf(EmfMap emfMap) throws Exception {
		return (List) list("DMLifeMemDAO.selectDMLifeMemInf", emfMap);
	}
}
