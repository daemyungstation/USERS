package front.ml.mlc.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.ml.mlc.service.MLCPfmcRsvtnService;

/**
 * <pre> 
 * 공연 예약을 위한 위한 Controller
 * </pre>
 * 
 * @ClassName		: MLCPfmcRsvtnController.java
 * @Description		: 공연 예약을 위한 위한 Controller
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
@RequestMapping("/my-lifeway/performance/particular")
public class MLCPfmcRsvtnController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="mLCPfmcRsvtnService")
    private MLCPfmcRsvtnService mLCPfmcRsvtnService;
	
	/**
     * 공연 예약 목록을 조회한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/list.do")
	public String selectPfmcRsvtnList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			EmfMap rtnMap = mLCPfmcRsvtnService.selectPfmcRsvtnList(emfMap);
			
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
		
		return "front/ml/mlc/MLCPfmcRsvtnList.front";
	}
	
	/**
     * 공연 예약 상세를 조회한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/view.do")
	public String selectPfmcRsvtn(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			EmfMap rtnMap = mLCPfmcRsvtnService.selectPfmcRsvtn(emfMap);
			
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
		
		return "front/ml/mlc/MLCPfmcRsvtnView.front";
	}
	
	/**
     * 공연 예약을 취소한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/cancel.do", method=RequestMethod.POST)
	public String updatePfmcRsvtnCancel(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		String url = "error/blank.error";
		
		try
		{
			mLCPfmcRsvtnService.updatePfmcRsvtnCancel(emfMap);
			
			modelMap.addAttribute("msg", "예약이 취소되었습니다..");
			modelMap.addAttribute("url", "./list.do");
		}
		catch (Exception he) 
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
