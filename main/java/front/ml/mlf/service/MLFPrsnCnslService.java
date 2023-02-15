package front.ml.mlf.service;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 1:1 상담내역 조회를 위한 Service
 * </pre>
 * 
 * @ClassName		: MLFPrsnCnslService.java
 * @Description		: 1:1 상담내역 조회를 위한 Service
 * @author 허진영
 * @since 2016.03.03
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.03		   허진영				  최초 생성
 * </pre>
 */ 
public interface MLFPrsnCnslService {	
	
	/**
	 * 1:1 상담내역 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPrsnCnslList(EmfMap emfMap) throws Exception;
	
	/**
	 * 1:1 상담내역 상세를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPrsnCnsl(EmfMap emfMap) throws Exception;
}
