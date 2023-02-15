package front.ml.mlh.service;

import javax.servlet.http.HttpServletRequest;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 비밀번호 변경을 위한 Service
 * </pre>
 * 
 * @ClassName		: MLHPwdChngService.java
 * @Description		: 비밀번호 변경을 위한 Service
 * @author 허진영
 * @since 2016.03.04
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.04		   허진영				  최초 생성
 * </pre>
 */ 
public interface MLHPwdChngService {	

	/**
	 * 비밀번호를 변경한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap updatePwdChng(EmfMap emfMap) throws Exception;
	public EmfMap updatePwdChngSso(EmfMap emfMap, HttpServletRequest request) throws Exception;
}
