package front.og.oga.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.og.oga.service.OGAOprtGuideService;

/**
 * <pre> 
 * 이용안내 조회를 위한 Controller
 * </pre>
 * 
 * @ClassName		: OGAOprtGuideController.java
 * @Description		: 이용안내 조회를 위한 Controller
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
@RequestMapping("/operation-guide")
public class OGAOprtGuideController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="oGAOprtGuideService")
    private OGAOprtGuideService oGAOprtGuideService;
	
	/**
	 * 이용안내(개인정보 취급방침)를 조회한다.
	 * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/privacy/index.do")
	public String selectOprtGuidePrivacy(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			emfMap.put("oprtGuideGb", "privacy");
			
			EmfMap rtnMap = oGAOprtGuideService.selectOprtGuide(emfMap);
			
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
		
		return "front/og/oga/OGAOprtGuideView.front";
	}
	
	/**
	 * 이용안내(이용약관)를 조회한다.
	 * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/terms/index.do")
	public String selectOprtGuideTerms(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			emfMap.put("oprtGuideGb", "terms");
			
			EmfMap rtnMap = oGAOprtGuideService.selectOprtGuide(emfMap);
			
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
		
		return "front/og/oga/OGAOprtGuideView.front";
	}
	
	/**
	 * 이용안내(법적고지)를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/legal/index.do")
	public String selectOprtGuideLegal(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			emfMap.put("oprtGuideGb", "legal");
			
			EmfMap rtnMap = oGAOprtGuideService.selectOprtGuide(emfMap);
			
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
		
		return "front/og/oga/OGAOprtGuideView.front";
	}
	
	/**
	 * 이용안내(중요정보 고시사항)를 조회한다.
	 * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/important/index.do")
	public String selectOprtGuideImportant(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			emfMap.put("oprtGuideGb", "important");
			
			EmfMap rtnMap = oGAOprtGuideService.selectOprtGuide(emfMap);
			
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
		
		return "front/og/oga/OGAOprtGuideView.front";
	}
	
	/**
	 * 이용안내(외주용역 안내)를 조회한다.
	 * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/outsourcing-guide/index.do")
	public String selectLifeMgzn(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			emfMap.put("oprtGuideGb", "outsourcing");

			EmfMap rtnMap = oGAOprtGuideService.selectOprtGuide(emfMap);
			
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
		
		return "front/og/oga/OGAOprtGuideView.front";
	}
}
