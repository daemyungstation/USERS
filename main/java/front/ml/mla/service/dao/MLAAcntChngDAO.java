package front.ml.mla.service.dao;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
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
@Repository("mLAAcntChngDAO")
public class MLAAcntChngDAO extends EmfAbstractDAO {
	
	/**
	 * 결제 납부일 예외 정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPayDayExceInf(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("MLAAcntChngDAO.selectPayDayExceInf", emfMap);
	}
	
	/**
	 * 결제계좌 변경신청 등록을 위한 유효성 체크.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public Integer selectChngRqstCnt(EmfMap emfMap) throws Exception
	{
		return (Integer) selectByPk("MLAAcntChngDAO.selectChngRqstCnt", emfMap);
	}
	
	/**
	 * 결제계좌 변경신청을 등록한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertAcntChngRqst(EmfMap emfMap) throws Exception
	{
		insert("MLAAcntChngDAO.insertAcntChngRqst", emfMap);
	}
}
