package front.ml.mld.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 전환서비스 신청을 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLDChngRqstDAO.java
 * @Description		: 전환서비스 신청을 위한 DAO
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
@Repository("mLDChngRqstDAO")
public class MLDChngRqstDAO extends EmfAbstractDAO {	
	
	/**
	 * 전환서비스 체계를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectChngSys(EmfMap emfMap) throws Exception
	{
		return list("MLDChngRqstDAO.selectChngSys", emfMap);
	}
	
	/**
	 * 전환서비스상품 상세 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectPrdctDtlList(EmfMap emfMap) throws Exception
	{
		return list("MLDChngRqstDAO.selectPrdctDtlList", emfMap);
	}
	
	/**
	 * 전환서비스상품 상세 정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPrdctDtlInf(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("MLDChngRqstDAO.selectPrdctDtlInf", emfMap);
	}
	
	/**
	 * 전환서비스상품 상세 정보 내역을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectPrdctDtlInfPtc(EmfMap emfMap) throws Exception
	{
		return list("MLDChngRqstDAO.selectPrdctDtlInfPtc", emfMap);
	}
	
	/**
	 * 상품정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPrdctInf(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("MLDChngRqstDAO.selectPrdctInf", emfMap);
	}
	
	/**
	 * 전환서비스 신청을 위한 유효성 체크.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public Integer selectChngRqstCnt(EmfMap emfMap) throws Exception
	{
		return (Integer) selectByPk("MLDChngRqstDAO.selectChngRqstCnt", emfMap);
	}
	
	/**
	 * 전환서비스 신청을 한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertChngSrvcRqst(EmfMap emfMap) throws Exception
	{
		insert("MLDChngRqstDAO.insertChngSrvcRqst", emfMap);
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
		insert("MLDChngRqstDAO.insertRqstPrcsLog", emfMap);
	}
	
	/**
     * 메일 발송을 위한 관리자 정보를 조회한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public List<EmfMap> selectChngSrvcAdmList(EmfMap emfMap) throws Exception
	{
		return list("MLDChngRqstDAO.selectChngSrvcAdmList", emfMap);
	}
}
