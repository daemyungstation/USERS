package front.lp.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractOutDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 전산db 조회를 위한 DAO
 * </pre>
 * 
 * @ClassName		: DmLifeDAO.java
 * @Description		: 전산db 조회를 위한 DAO
 * @author 김필기
 * @since 2016.02.18
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		 since			author					description
 *   ===========    ==============    =============================
 *    2016.02.18		김필기					 최초생성
 * </pre>
 */
@Repository("dMLifeDAO")
public class DmLifeDAO extends EmfAbstractOutDAO 
{
	/**
	 * 납입방식 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	public List<EmfMap> getPaymentMethod(EmfMap emfMap) throws Exception
	{
		return list("DmLifeDAO.getPaymentMethod", emfMap);
	}

	/**
	 * 담당자 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	public List<EmfMap> getEmployeeList(EmfMap emfMap) throws Exception
	{
		return list("DmLifeDAO.getEmployeeList", emfMap);
	}	
	
	/**
	 * 공통 코드 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	public List<EmfMap> selectComCd(EmfMap emfMap) throws Exception
	{
		return list("DmLifeDAO.selectComCd", emfMap);
	}		

	/**
	 * 회사 코드 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	public EmfMap selectB2BComCd(EmfMap emfMap) throws Exception
	{
		return (EmfMap)selectByPk("DmLifeDAO.selectB2BComCd", emfMap);
	}		
	
	/**
	 * 세부 상품을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	public List<EmfMap> getSubProduct(EmfMap emfMap) throws Exception
	{
		return list("DmLifeDAO.getSubProduct", emfMap);
	}		
	
	/**
	 * 가입증서를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	public EmfMap selectJoinCert(EmfMap emfMap) throws Exception
	{
		return (EmfMap)selectByPk("DmLifeDAO.selectJoinCert", emfMap);
	}
	
	/**
	 * 가입증서를 조회한다. (MemNo 없이)
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	public EmfMap selectJoinCertAccntNo(EmfMap emfMap) throws Exception
	{
		return (EmfMap)selectByPk("DmLifeDAO.selectJoinCertAccntNo", emfMap);
	}

	/**
	 * 상품 설명서 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	public EmfMap selectPrdctDesc(EmfMap emfMap) throws Exception
	{
		return (EmfMap)selectByPk("DmLifeDAO.selectPrdctDesc", emfMap);
	}
	
	/**
	 * 상품 해약환급금 및 환금율
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	public List<EmfMap> selectResnstdInfo(EmfMap emfMap) throws Exception
	{
		return list("DmLifeDAO.selectResnstdInfo", emfMap);
	}	
}