package front.co.coi.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.co.coi.service.COISnsMngService;
import front.co.util.COPaginationUtil;

import org.springframework.web.servlet.ModelAndView;

/**
 * <pre> 
 * 메인화면 위한 Controller
 * </pre>
 * 
 * @ClassName		: FMAMainController.java
 * @Description		: 메인화면 위한 Controller
 * @author 김필기
 * @since 2016.03.03
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.03		   김필기				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/sns")
public class COISnsController extends EmfController {
	
	/** 컨텐츠 **/
	@Resource(name="cOISnsMngService")
	private COISnsMngService cOISnsMngService;

	/**
	 * SNS 화면
	 *
 	 * @param emfMap
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/index.do")
	public String getLoginView(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			emfMap.put("cntPage", 4);
			PaginationInfo paginationInfo = new COPaginationUtil().getPage(emfMap);
			
			//페이징 처리
			emfMap.put("paginationInfo", paginationInfo);
			
			//리스트 가져오기
			List<EmfMap> snsList = cOISnsMngService.selectSnsList(emfMap);
		
			emfMap.put("snsList", snsList);
			
			if(snsList.size() > 0)
			{
				paginationInfo.setTotalRecordCount(Integer.parseInt(snsList.get(0).getString("totCnt")));
			}
			else
			{
				paginationInfo.setTotalRecordCount(0);
			}
			modelMap.addAttribute("rtnMap", emfMap);
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 		
		
		return "front/co/coi/COISns.front";
	}
}
