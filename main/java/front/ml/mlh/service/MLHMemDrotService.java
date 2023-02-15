package front.ml.mlh.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 회원탈퇴를 위한 Service
 * </pre>
 * 
 * @ClassName		: MLHMemDrotService.java
 * @Description		: 회원탈퇴를 위한 Service
 * @author 허진영
 * @since 2016.03.08
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.08		   허진영				  최초 생성
 * </pre>
 */ 
public interface MLHMemDrotService {

	void selectIntegrationDeleteMemberInfo(String ci) throws Exception;

	/**
	 * 회원탈퇴를 한다.
	 *
	 * @param emfMap
	 * @throws Exception
	 */
	void updateMemDrot(EmfMap emfMap) throws Exception;
	public void updateMemDrotSso(EmfMap emfMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
