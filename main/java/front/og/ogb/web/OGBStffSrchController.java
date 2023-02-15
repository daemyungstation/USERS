package front.og.ogb.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.lp.service.DmLifeService;

/**
 * <pre> 
 * 담당사원 검색을 위한 Controller
 * </pre>
 * 
 * @ClassName		: OGBStffSrchController.java
 * @Description		: 담당사원 검색을 위한 Controller
 * @author 허진영
 * @since 2016.03.11
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.11		   허진영				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/operation-guide/staff-search")
public class OGBStffSrchController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="dMLifeService")
    private DmLifeService dMLifeService;
	
	/**
     * 담당사원 검색 페이지.
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/index.do")
	public String getStffSrchPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/og/ogb/OGBStffSrchWrite.front";
	}
	
	/**
     * 담당사원을 검색한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/search.ajax", method=RequestMethod.POST)
	public String selectStffSrchList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		//검색어 체크
		String f = emfMap.getString("f");
		String q = emfMap.getString("q");	
		
		if(!"".equals(EMFStringUtil.nullConvert(q)) && q.length() <= 15)
		{
			emfMap.put("f", f);
			emfMap.put("q", q);
		}
		else
		{
			emfMap.put("f", "");
			emfMap.put("q", "");
		}
				
		try
		{
			EmfMap rtnMap = dMLifeService.getEmployeeList(emfMap);
			
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
		
		return "front/og/ogb/OGBStffSrchList";
	}
}
