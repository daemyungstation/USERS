package front.sm.sma.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.co.util.COPaginationUtil;
import front.sm.sma.service.SMABanrMngService;
import front.sm.sma.service.dao.SMABanrMngDAO;

/**
 * <pre> 
 * 배너 관리를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: SMABanrMngServiceImpl.java
 * @Description		: 배너 관리를 위한 ServiceImpl
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
@Service("sMABanrMngService")
public class SMABanrMngServiceImpl extends EmfAbstractService implements SMABanrMngService {
	
	@Resource(name="sMABanrMngDAO")
    private SMABanrMngDAO sMABanrMngDAO;
	
	/**
	 * 배너 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */    
	public EmfMap selectBanrList(EmfMap emfMap) throws Exception
    {
		PaginationInfo paginationInfo = new COPaginationUtil().getPage(emfMap);
		
		//페이징 처리
		emfMap.put("paginationInfo", paginationInfo);
		
		//리스트 가져오기
		List<EmfMap> list = sMABanrMngDAO.selectBanrList(emfMap);
	
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
