package front.ml.mlc.service.dao;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractOutDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 공연 예약을 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLCOutMemInfDAO.java
 * @Description		: 공연 예약을 위한 DAO
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
@Repository("mLCOutMemInfDAO")
public class MLCOutMemInfDAO extends EmfAbstractOutDAO {
	
    /**
	 * 외부(엔컴) 회원정보 상세를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public EmfMap selectOutMemInf(EmfMap emfMap) throws Exception
    {
    	return (EmfMap) selectByPk("MLCOutMemInfDAO.selectOutMemInf", emfMap);
    }
}
