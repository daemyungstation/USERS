package front.lp.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.lp.service.DmLifeService;
import front.lp.service.LPOnlinePrdctService;

/**
 * <pre> 
 * 온라인 상품가입을 위한 Controller
 * </pre>
 * 
 * @ClassName		: LPOnlinePrdctController.java
 * @Description		: 온라인 상품가입을 위한 Controller
 * @author 김필기
 * @since 2016.03.10
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.10		   김필기				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/onlineproduct")
public class LPOnlinePrdctController extends EmfController {

	/** 서비스 **/
	@Resource(name="dMLifeService")
    private DmLifeService dMLifeService;

	@Resource(name="lPOnlinePrdctService")
    private LPOnlinePrdctService lPOnlinePrdctService;

	
	/**
	 * 납입방식 조회
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	@RequestMapping(value="/paymentMethod.ajax", method=RequestMethod.POST)
	public ModelAndView selectPaymentMethod(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		try
		{			
			mav.addObject("list", dMLifeService.getPaymentMethod(emfMap));
			
			mav.setViewName("jsonView");
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		}

		return mav;		
	}	
	

	/**
	 * 담당자를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return Json 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	
	@RequestMapping(value="/employeeList.do")
	public String selectEmployeeList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{	
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
		
		return "front/lp/employeeListPop.pop";		
	}
	
	/**
	 * 등록한 회사를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return Json 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	
	@RequestMapping(value="/companyList.do")
	public String selectCompanyList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{	
		try
		{
			EmfMap rtnMap = lPOnlinePrdctService.selectCompanyList(emfMap);
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
		
		return "front/lp/companyListPop.pop";		
	}
	
	/**
	 * 세부상품 조회
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	@RequestMapping(value="/getSubProduct.ajax", method=RequestMethod.POST)
	public ModelAndView getSubProduct(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		try
		{			
			mav.addObject("list", dMLifeService.getSubProduct(emfMap));
			
			mav.setViewName("jsonView");
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		}

		return mav;		
	}		
		
	
	
	/**
	 * 약관 조회
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	@RequestMapping(value="/getTerms.ajax", method=RequestMethod.POST)
	public ModelAndView getTerms(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		try
		{			
			mav.addObject("info", lPOnlinePrdctService.getTerms(emfMap));
			
			mav.setViewName("jsonView");
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		}

		return mav;		
	}		

	/**
	 * 담당자를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return Json 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	
	@RequestMapping(value="/getTermInfo.do")
	public String getTermInfo(EmfMap emfMap, ModelMap modelMap) throws Exception
	{	
		try
		{
			EmfMap rtnMap = lPOnlinePrdctService.selectTermsDtl(emfMap);			
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
		
		return "front/lp/termInfo.iframe";		
	}
	
}
