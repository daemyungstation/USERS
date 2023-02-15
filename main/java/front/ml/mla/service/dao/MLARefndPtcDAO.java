package front.ml.mla.service.dao;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractOutDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 환급금 조회를 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLARefndPtcDAO.java
 * @Description		: 환급금 조회를 위한 DAO
 * @author 허진영
 * @since 2016.03.16
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.16		   허진영				  최초 생성
 * </pre>
 */ 
@Repository("mLARefndPtcDAO")
public class MLARefndPtcDAO extends EmfAbstractOutDAO {

	/**
	 * 환급금 목록을 조회한다.
	 *
	 * @param emfMap
	 * @return
	 * @throws Exception
	 */
	public List<EmfMap> selectRefndPtcList(EmfMap emfMap) throws Exception {
		return list("MLARefndPtcDAO.selectRefndPtcList", emfMap);
	}

	/**
	 * 환급금상세 목록을 조회한다.
	 *
	 * @param emfMap
	 * @return
	 * @throws Exception
	 */
	public List<EmfMap> selectRefndPtcDtlList(EmfMap emfMap) throws Exception {
		return list("MLARefndPtcDAO.selectRefndPtcDtlList", emfMap);
	}

	public List<EmfMap> getCashShoppingHistory(EmfMap emfMap) {
		return list("MLARefndPtcDAO.getCashShoppingHistory", emfMap);
	}

	public BigDecimal getCashShoppingAmt(String accntNo, BigDecimal resnAmt) {
		EmfMap emfMap = new EmfMap();
		emfMap.put("accntNo", accntNo);
		emfMap.put("resnAmt", resnAmt);
		EmfMap resultMap = (EmfMap) selectByPk("MLARefndPtcDAO.getCashShoppingAmt", emfMap);
		return (BigDecimal) resultMap.get("sum");
	}
}
