package front.ml.mlh.service.dao;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 비밀번호 변경을 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLHPwdChngDAO.java
 * @Description		: 비밀번호 변경을 위한 DAO
 * @author 허진영
 * @since 2016.03.04
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.04		   허진영				  최초 생성
 * </pre>
 */ 
@Repository("mLHPwdChngDAO")
public class MLHPwdChngDAO extends EmfAbstractDAO {

	/**
	 * 비밀번호를 변경을 위한 유효성 체크
	 *
	 * @param emfMap
	 * @return
	 * @throws Exception
	 */
	public int selectMemInfChk(EmfMap emfMap) throws Exception {
		return (Integer) selectByPk("MLHPwdChngDAO.selectMemInfChk", emfMap);
	}

	/**
	 * 비밀번호 변경
	 *
	 * @param emfMap
	 * @throws Exception
	 */
	public void updatePwdChng(EmfMap emfMap) throws Exception {
		update("MLHPwdChngDAO.updatePwdChng", emfMap);
	}

	/**
	 * 통합회원 비밀번호 변경
	 *
	 * @param emfMap
	 * @throws Exception
	 */
	public void updatePwdIntegrationUser(EmfMap emfMap) throws Exception {
		update("MLHPwdChngDAO.updatePwdIntegrationUser", emfMap);
	}
}
