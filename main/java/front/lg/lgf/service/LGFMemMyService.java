package front.lg.lgf.service;

import javax.servlet.http.HttpServletRequest;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 모바일 민원 처리를 위한 Service
 * </pre>
 * 
 * @ClassName		: LGFMemMyService.java
 * @Description		: 모바일 민원 처리를 위한 Service
 * @author 이너스커뮤니티
 * @since 2022.02.07
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2022.02.07		   이너스커뮤니티				  최초 생성
 * </pre>
 */ 

public interface LGFMemMyService {
	
	/**
	 * CI 기반로그인 
	 *
	 * @param emfMap
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public EmfMap myAuth(EmfMap emfMap, HttpServletRequest request) throws Exception;
	
	/**
	 * 회원 정보를 조회한다. - SSO
	 *
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectMemInfSso(EmfMap emfMap, HttpServletRequest request) throws Exception;
	
	/**
	 * 회원 정보를 변경한다. - SSO
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateMemInfSso(EmfMap emfMap, HttpServletRequest request) throws Exception;
}
