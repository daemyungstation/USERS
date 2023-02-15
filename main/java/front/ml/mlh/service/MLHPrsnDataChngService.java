package front.ml.mlh.service;

import javax.servlet.http.HttpServletRequest;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 개인정보 변경을 위한 Service
 * </pre>
 * 
 * @ClassName		: MLHPsrnDataChngService.java
 * @Description		: 개인정보 변경을 위한 Service
 * @author 허진영
 * @since 2016.03.07
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.07		   허진영				  최초 생성
 * </pre>
 */ 
public interface MLHPrsnDataChngService {	

	/**
	 * 회원정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectMemInf(EmfMap emfMap) throws Exception;
	public EmfMap selectMemInfSso(EmfMap emfMap, HttpServletRequest request) throws Exception;
	
	/**
	 * 회원정보를 변경한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateMemInf(EmfMap emfMap) throws Exception;
	public void updateMemInfSso(EmfMap emfMap, HttpServletRequest request) throws Exception;
	
	/**
	 * 개명된 이름을 변경한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateMemRenameInf(EmfMap emfMap) throws Exception;	
	public void updateMemRenameInfSso(EmfMap emfMap, HttpServletRequest request) throws Exception;
}
