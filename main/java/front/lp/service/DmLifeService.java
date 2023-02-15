package front.lp.service;

import java.util.List;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 전산db(엔컴) 정보 조회를 위한 Service
 * </pre>
 * 
 * @ClassName		: ProductMngService.java
 * @Description		: 전산db(엔컴) 정보 조회를 위한 Service
 * @author 김필기
 * @since 2016.02.19
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		 since			author					description
 *   ===========    ==============    =============================
 *    2016.02.19 	김필기					 최초생성
 * </pre>
 */
public interface  DmLifeService {
	
	/**
     * 상품 납입방식을  조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */	
	public List<EmfMap> getPaymentMethod(EmfMap emfMap) throws Exception;

	/**
     * 담당자 목록을 조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */	
	public EmfMap getEmployeeList(EmfMap emfMap) throws Exception;
	
	/**
	 * 공통 코드 목록을 조회한다.
	 */
	public List<EmfMap> selectComCd(EmfMap emfMap) throws Exception;
	
	/**
	 * 회사 코드 목록을 조회한다.
	 */
	public EmfMap selectB2BComCd(EmfMap emfMap) throws Exception;

	/**
	 * 세부 상품을 조회한다.
	 */
	public List<EmfMap> getSubProduct(EmfMap emfMap) throws Exception;

	/**
	 * 가입증서를 조회한다.
	 */
	public EmfMap selectJoinCert(EmfMap emfMap) throws Exception;
}