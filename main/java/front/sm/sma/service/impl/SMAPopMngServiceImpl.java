package front.sm.sma.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.co.util.COPaginationUtil;
import front.sm.sma.service.SMAPopMngService;
import front.sm.sma.service.dao.SMAPopMngDAO;

/**
 * <pre> 
 * 팝업 관리를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: SMAPopMngServiceImpl.java
 * @Description		: 팝업 관리를 위한 ServiceImpl
 * @author 허진영
 * @since 2016.02.11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since			author				   description
 *   ===========    ==============    =============================
 *   2016.02.11.		허진영			 		최초생성
 * </pre>
 */
@Service("sMAPopMngService")
public class SMAPopMngServiceImpl extends EmfAbstractService implements SMAPopMngService {
	
	@Resource(name="sMAPopMngDAO")
    private SMAPopMngDAO sMAPopMngDAO;
		
	/**
	 * 팝업 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */    
	public EmfMap selectPopList(EmfMap emfMap) throws Exception
    {
		PaginationInfo paginationInfo = new COPaginationUtil().getPage(emfMap);
		
		//페이징 처리
		emfMap.put("paginationInfo", paginationInfo);
		
		//리스트 가져오기
		List<EmfMap> list = sMAPopMngDAO.selectPopList(emfMap);
	
		emfMap.put("list", list);	
		
		if(list.size() > 0)
		{
			paginationInfo.setTotalRecordCount(Integer.parseInt(list.get(0).getString("totCnt")));
		}
		else
		{
			paginationInfo.setTotalRecordCount(0);
		}
		
		return emfMap;		
    }
}
