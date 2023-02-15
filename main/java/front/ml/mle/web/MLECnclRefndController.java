package front.ml.mle.web;

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
import front.ml.mle.service.MLETrnsfAcquService;

/**
 * <pre> 
 * 해약환급금 안내를 위한 Controller
 * </pre>
 * 
 * @ClassName		: MLECnclRefndController.java
 * @Description		: 해약환급금 안내를 위한 Controller
 * @author 허진영
 * @since 2016.03.14
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.14		   허진영				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/my-lifeway/service-guide/cancel-refund")
public class MLECnclRefndController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="mLETrnsfAcquService")
	private MLETrnsfAcquService mLETrnsfAcquService;
	
	@Resource(name="mLARefndPtcService")
    private MLARefndPtcService mLARefndPtcService;
	
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
			emfMap.put("cnclRefndYn", "Y");
			
			List<EmfMap> joinPrdctList = mLETrnsfAcquService.selectJoinPrdctList(emfMap);
			
			modelMap.addAttribute("joinPrdctList", joinPrdctList);
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/ml/mle/MLECnclRefndGuideView.front";
	}
	
	/**
	 * 해약환급금 목록을 조회한다.
	 * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/list.do", method=RequestMethod.POST)
	public String selectCnclRefndList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			List<EmfMap> cnclRefndList = mLARefndPtcService.selectRefndPtcDtlList(emfMap);
			
			modelMap.addAttribute("cnclRefndList", cnclRefndList);
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
		
		return "front/ml/mle/MLECnclRefndList.front";
	}
}
