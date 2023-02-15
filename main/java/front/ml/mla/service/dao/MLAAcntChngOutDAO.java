package front.ml.mla.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractOutDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 결제계좌 조회/변경을 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLAAcntChngDAO.java
 * @Description		: 결제계좌 조회/변경을 위한 DAO
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
@Repository("mLAAcntChngOutDAO")
public class MLAAcntChngOutDAO extends EmfAbstractOutDAO {
	
	/**
	 * 가입상품 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectJoinPrdctList(EmfMap emfMap) throws Exception
	{
		return list("MLAAcntChngOutDAO.selectJoinPrdctList", emfMap);
	}

	/**
	 * 가입상품 목록을 조회한다.(결제계좌 변경안내)
	 *
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectJoinPrdctListPaymentAccount(EmfMap emfMap) throws Exception
	{
		return list("MLAAcntChngOutDAO.selectJoinPrdctListPaymentAccount", emfMap);
	}

	/**
	 * 가입상품 목록을 조회한다.(로그인)
	 *
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectJoinPrdctListForLogin(EmfMap emfMap) throws Exception
	{
		return list("MLAAcntChngOutDAO.selectJoinPrdctListForLogin", emfMap);
	}
	/**
	 * 납입방법을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPayMthd(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("MLAAcntChngOutDAO.selectPayMthd", emfMap);
	}
	
	/**
	 * CMS 결제계좌 정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectCmsPmtAcntInf(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("MLAAcntChngOutDAO.selectCmsPmtAcntInf", emfMap);
	}
	
	/**
	 * 카드 결제계좌 정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectCardPmtAcntInf(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("MLAAcntChngOutDAO.selectCardPmtAcntInf", emfMap);
	}
}
