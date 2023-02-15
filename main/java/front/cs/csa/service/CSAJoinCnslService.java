package front.cs.csa.service;

import javax.servlet.http.HttpServletRequest;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 가임상담 신청을 위한 Service
 * </pre>
 * 
 * @ClassName		: CSAJoinCnslService.java
 * @Description		: 가임상담 신청을 위한 Service
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
public interface CSAJoinCnslService {	
	
	/**
	 * 가임상담 신청을 등록한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertJoinCnsl(EmfMap emfMap, HttpServletRequest request) throws Exception;
	public void insertJoinEventCnsl(EmfMap emfMap, HttpServletRequest request) throws Exception;
	
}
