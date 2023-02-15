package front.co.coa.service;

import java.util.List;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 메뉴 조회를 위한 Service
 * </pre>
 * 
 * @ClassName		: COAMenuService.java
 * @Description		: 메뉴 조회를 위한 Service
 * @author 허진영
 * @since 2016.02.26
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.02.26		   허진영				  최초 생성
 * </pre>
 */ 
public interface COAMenuService {	
	
	/**
	 * 메뉴를 가져온다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> getMenuList() throws Exception;
	
	/**
	 * 부모 메뉴를 가져온다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> getParntMenuList(int menuSeq) throws Exception;
}
