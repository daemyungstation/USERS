package front.co.coa.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.co.coa.service.COAMenuService;
import front.co.coa.service.dao.COAMenuDAO;

/**
 * <pre> 
 * 메뉴 조회를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: COAMenuServiceImpl.java
 * @Description		: 메뉴 조회를 위한 ServiceImpl
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
@Service("cOAMenuService")
public class COAMenuServiceImpl extends EmfAbstractService implements COAMenuService {
	
	@Resource(name="cOAMenuDAO")
	private COAMenuDAO cOAMenuDAO;
	
	/**
	 * 메뉴 목록을 가져온다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> getMenuList() throws Exception
	{    	
    	return cOAMenuDAO.getMenuList();
    }
	
	/**
	 * 부모 메뉴 목록을 가져온다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> getParntMenuList(int menuSeq) throws Exception
	{    	
    	return cOAMenuDAO.getParntMenuList(menuSeq);
    }
}
