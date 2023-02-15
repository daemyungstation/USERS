package front.ml.mla.web;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.ml.mla.service.MLAPmtPtcService;

/**
 * <pre> 
 * 납입현황 조회를 위한 Controller
 * </pre>
 * 
 * @ClassName		: MLAPmtSttsController.java
 * @Description		: 납입현황 조회를 위한 Controller
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
@RequestMapping("/my-lifeway/join-product-information/payment-status")
public class MLAPmtPtcController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="mLAPmtPtcService")
    private MLAPmtPtcService mLAPmtPtcService;
	
	/**
	 * 납입현황 목록을 조회한다.
	 * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/index.do")
	public String selectPmtPtcList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			List<EmfMap> pmtPtcList = mLAPmtPtcService.selectPmtPtcList(emfMap);
			
			modelMap.addAttribute("pmtPtcList", pmtPtcList);
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/ml/mla/MLAPmtPtcList.front";
	}
	
	/**
	 * 납입현황상세 목록을 조회한다.
	 * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/list.do", method=RequestMethod.POST)
	public String selectPmtPtcDtlList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			List<EmfMap> pmtPtcDtlList = mLAPmtPtcService.selectPmtPtcDtlList(emfMap);
			
			modelMap.addAttribute("emfMap", emfMap);
			modelMap.addAttribute("pmtPtcDtlList", pmtPtcDtlList);
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/ml/mla/MLAPmtPtcDtlList.front";
	}
	

	/**
	 * 납입현황을 출력한다.
	 * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/printPayment.do")
	public String selectJoinCert(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			EmfMap rtnMap = mLAPmtPtcService.selectPmtPtcInfo(emfMap);
			List<EmfMap> pmtPtcDtlList = mLAPmtPtcService.selectPmtPtcDtlList(emfMap);
			
			modelMap.addAttribute("rtnMap", rtnMap);
			modelMap.addAttribute("list", pmtPtcDtlList);
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/ml/mla/printPayment.pop";
	}		
}
