package front.cs.csa.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 제휴 문의를 위한 Service
 * </pre>
 * 
 * @ClassName		: CSAAlncCnslService.java
 * @Description		: 제휴 문의를 위한 Service
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
public interface CSAAlncCnslService {	
	
	/**
	 * 제휴 문의를 등록한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertAlncCnsl(EmfMap emfMap, MultipartHttpServletRequest multiRequest) throws Exception;
}
