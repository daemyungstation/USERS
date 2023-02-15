package front.cs.csa.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.service.EgovCmmUseService;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.cs.csa.service.CSAVocService;

/**
 * <pre> 
 * VOC Controller
 * </pre>
 * 
 * @ClassName		: CSAVocController.java
 * @Description		: VOC Controller
 * @author 장준일
 * @since 2021.02.23
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2021.02.23	        장준일				  최초 생성
 * </pre>
 */  
@Controller
@RequestMapping("/customer-center/voc")
public class CSAVocController extends EmfController {	
	
	/** 서비스 **/
	@Resource(name="cSAVocService")
    private CSAVocService cSAVocService;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;
	
	/**
	 * VOC 등록 페이지
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/index.do")
	public String getVocWritePage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{			
			
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/cs/csa/CSAVocWrite.front";
	}

	/**
	 * VOC를 등록한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insertVoc(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
        try 
        {
        	cSAVocService.insertVoc(emfMap);
        }
		catch(Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
        }
        
        return "redirect:./complete.do";
	}
	
	/**
	 * 1:1 상담하기 완료페이지.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/complete.do")
	public String getVocCompPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
        return "front/cs/csa/CSAVocComp.front";
	}
	
}
