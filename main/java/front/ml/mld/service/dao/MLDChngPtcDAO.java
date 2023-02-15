package front.ml.mld.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 전환서비스 신청내역 조회를 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLDChngPtcDAO.java
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
@Repository("mLDChngPtcDAO")
public class MLDChngPtcDAO extends EmfAbstractDAO {	
	
	/**
	 * 전환서비스 신청내역 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectChngPtcList(EmfMap emfMap) throws Exception
	{
		return list("MLDChngPtcDAO.selectChngPtcList", emfMap);
	}
	
	/**
	 * 전환서비스 신청내역 로그를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectChngPtcLog(EmfMap emfMap) throws Exception
	{
		return list("MLDChngPtcDAO.selectChngPtcLog", emfMap);
	}
	
	/**
	 * 전환서비스 신청내역 상세를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectChngPtcDtl(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("MLDChngPtcDAO.selectChngPtcDtl", emfMap);
	}
	
	/**
	 * 전환서비스 상품정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectChngPrdctInf(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("MLDChngPtcDAO.selectChngPrdctInf", emfMap);
	}
	
	/**
	 * 전환서비스 신청을 취소한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateChngRqstCncl(EmfMap emfMap) throws Exception
	{
		update("MLDChngPtcDAO.updateChngRqstCncl", emfMap);
	}
	
	/**
     * 전환서비스 신청 처리현황 로그를 등록한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public void insertRqstPrcsLog(EmfMap emfMap) throws Exception
	{
		insert("MLDChngPtcDAO.insertRqstPrcsLog", emfMap);
	}
}
