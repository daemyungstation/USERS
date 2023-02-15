package front.ml.mla.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.ml.mla.service.MLARefndPtcService;
import org.springframework.web.servlet.ModelAndView;

/**
 * <pre> 
 * 환급금 조회를 위한 Controller
 * </pre>
 * 
 * @ClassName		: MLARefndPtcController.java
 * @Description		: 환급금 조회를 위한 Controller
 * @author 허진영
 * @since 2016.03.15
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.15		   허진영				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/my-lifeway/join-product-information/refund")
public class MLARefndPtcController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="mLARefndPtcService")
    private MLARefndPtcService mLARefndPtcService;
	
	/**
	 * 환급금 목록을 조회한다.
	 * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/index.do")
	public String selectRefndPtcList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			List<EmfMap> refndPtcList = mLARefndPtcService.selectRefndPtcList(emfMap);
			
			modelMap.addAttribute("refndPtcList", refndPtcList);
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/ml/mla/MLARefndPtcList.front";
	}
	
	/**
	 * 환급금상세 목록을 조회한다.
	 * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/list.do", method=RequestMethod.POST)
	public String selectRefndPtcDtlList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			List<EmfMap> refndPtcDtlList = mLARefndPtcService.selectRefndPtcDtlList(emfMap);
			
			modelMap.addAttribute("refndPtcDtlList", refndPtcDtlList);
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
		
		return "front/ml/mla/MLARefndPtcDtlList.front";
	}

	@RequestMapping(value="/history.ajax", method = RequestMethod.GET)
	public ModelAndView getRefndPtcHistoryList(EmfMap emfMap, ModelMap modelMap) throws Exception {
		ModelAndView mav = new ModelAndView();
		try {
			mav.addAllObjects(mLARefndPtcService.getRefndPtcHistoryList(emfMap));
			mav.setViewName("front/ml/mla/ajax/MLARefndPtcHistoryList");
			mav.addAllObjects(emfMap);
		} catch (Exception e) {
			log.debug(e);
			throw new EmfException(e.getMessage());
		}
//		System.out.println(mav);
		return mav;
	}
}
