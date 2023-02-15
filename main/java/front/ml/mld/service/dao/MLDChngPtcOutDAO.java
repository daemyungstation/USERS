package front.ml.mld.service.dao;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractOutDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 전환서비스 신청내역 조회를 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLDChngPtcOutDAO.java
 * @Description		: 전환서비스 신청내역 조회를 위한 DAO
 * @author 허진영
 * @since 2016.03.18
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.18		   허진영				  최초 생성
 * </pre>
 */ 
@Repository("mLDChngPtcOutDAO")
public class MLDChngPtcOutDAO extends  EmfAbstractOutDAO {
	
	/**
	 * 가입상품 상세를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectJoinPrdct(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("MLDChngPtcOutDAO.selectJoinPrdct", emfMap);
	}
}
