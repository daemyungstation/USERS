package front.ml.mlg.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.ml.mlg.service.MLGObtrNotiService;

/**
 * <pre> 
 * 부고알리미를 위한 Controller
 * </pre>
 * 
 * @ClassName		: MLFObtrNotiController.java
 * @Description		: 부고알리미를 위한 Controller
 * @author 허진영
 * @since 2016.03.04
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.04		   허진영				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/my-lifeway/obituary-notification")
public class MLGObtrNotiController extends EmfController {	
	
	/** 서비스 **/
	@Resource(name="mLGObtrNotiService")
    private MLGObtrNotiService mLGObtrNotiService;
	
	/**
	 * 가입상품 목록을 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/index.do")
	public String selectJoinPrdctList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			List<EmfMap> joinPrdctList = mLGObtrNotiService.selectJoinPrdctList(emfMap);
			
			modelMap.addAttribute("joinPrdctList", joinPrdctList);
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
		
		return "front/ml/mlg/MLGJoinPrdctList.front";
	}
	
	/**
	 * 부고알리미 정보를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/search.ajax", method=RequestMethod.POST)
	public String selectObtrNotiInf(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
        try 
        {
			EmfMap rtnMap = mLGObtrNotiService.selectObtrNotiInf(emfMap);
			
			HttpSession session = request.getSession(false);
			
			if(session.getAttribute("prdctInfo") != null)
			{
				session.removeAttribute("prdctInfo");
			}
			     
			session.setAttribute("prdctInfo", rtnMap.get("prdctInfo"));
			
			modelMap.addAttribute("rtnMap", rtnMap);
        }
		catch(Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
        }
        
        return "front/ml/mlg/MLGObtrNotiWrite";
	}
	
	/**
	 * 부고알리미 정보를 저장한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/cntn-update.ajax", method=RequestMethod.POST)
	public ModelAndView updateObtrNotiInf(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
        try 
        {
			mLGObtrNotiService.updateObtrNotiInf(emfMap);
			
			mav.addObject("status", "Y");
    		
    		mav.setViewName("jsonView");
        }
		catch(Exception he)
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
	 * 양식등록을 위한 팝업페이지
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/form-upload.do")
	public String getExcelUploadPopup(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
        return "front/ml/mlg/MLGExcelUploadPop.pop";
	}
	
	/**
	 * 양식으로 업로드된 데이터를 가져온다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/form-insert.ajax", method=RequestMethod.POST)
	public ModelAndView getFormExcelData(EmfMap emfMap, ModelMap modelMap, MultipartHttpServletRequest multiRequest) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
        try 
        {
        	List<String> hpList = mLGObtrNotiService.getFormExcelData(emfMap, multiRequest);
			
			mav.addObject("hpList", hpList);
    		
    		mav.setViewName("jsonView");
        }
		catch(Exception he)
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
	 * 부고알리미를 발송한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/send.do", method=RequestMethod.POST)
	public String insertObtrNotiSend(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		String url = "error/blank.error";
		
        try 
        {
        	HttpSession session = request.getSession(false);
			
			if(session.getAttribute("prdctInfo") != null)
			{
				emfMap.put("prdctInfo", session.getAttribute("prdctInfo"));
				
				mLGObtrNotiService.insertObtrNotiSend(emfMap);
				
				modelMap.addAttribute("msg", "발송되었습니다.");
				modelMap.addAttribute("url", "./index.do?accntNo=" + ((EmfMap) emfMap.get("prdctInfo")).getString("accntNo"));
			}
        }
		catch(Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
        }
        
        return url;
	}
}
