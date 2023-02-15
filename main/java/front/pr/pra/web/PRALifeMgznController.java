package front.pr.pra.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.pr.pra.service.PRALifeMgznService;

/**
 * <pre> 
 * 라이프웨이 매거진 조회를 위한 Controller
 * </pre>
 * 
 * @ClassName		: PRALifeMgznController.java
 * @Description		: 라이프웨이 매거진 조회를 위한 Controller
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
@Controller
@RequestMapping("/pr-center/lifeway-magazine")
public class PRALifeMgznController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="pRALifeMgznService")
    private PRALifeMgznService pRALifeMgznService;
	
	/**
     * 라이프웨이 매거진을 조회한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/index.do")
	public String selectLifeMgzn(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			EmfMap rtnMap = pRALifeMgznService.selectLifeMgzn(emfMap);
			
			modelMap.addAttribute("rtnMap", rtnMap);
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/pr/pra/PRALifeMgznView.front";
	}
}
