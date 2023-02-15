package front.ml.mla.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.com.utl.fcc.service.EgovStringUtil;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.ml.mla.service.MLAAcntChngService;

/**
 * <pre> 
 * 결제계좌 조회/변경을 위한 Controller
 * </pre>
 * 
 * @ClassName		: MLAAcntChngController.java
 * @Description		: 결제계좌 조회/변경을 위한 Controller
 * @author 허진영
 * @since 2016.03.02
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.02		   허진영				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/my-lifeway/join-product-information/payment-account")
public class MLAAcntChngController extends EmfController {	
	
	/** 서비스 **/
	@Resource(name="mLAAcntChngService")
    private MLAAcntChngService mLAAcntChngService;
	
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
			List<EmfMap> joinPrdctList = mLAAcntChngService.selectJoinPrdctListPaymentAccount(emfMap);
			
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
		
		return "front/ml/mla/MLAJoinPrdctList.front";
	}
	
	/**
	 * 결제계좌 정보를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/search.ajax")
	public String selectPayAcntInf(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
        try 
        {
			EmfMap rtnMap = mLAAcntChngService.selectPayAcntInf(emfMap);
			
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
        
        return "front/ml/mla/MLAAcntChngWrite";
	}
	
	/**
	 * 결제계좌변경 신청을 등록한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insertAcntChngRqst(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		String url = "error/blank.error";
		
        try 
        {
			mLAAcntChngService.insertAcntChngRqst(emfMap);
			
			modelMap.addAttribute("msg", "결제계좌변경 신청이 완료되었습니다.");
			modelMap.addAttribute("url", "./index.do");
        }
		catch(Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			
			if("재신청오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "이미 접수되어 재신청을 할 수 없습니다.");
				modelMap.addAttribute("url", "./index.do");
			}
			else if("이중출금오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "이중출금이 될 수 있어 기존 납부일 및 신청 납부일 3일 이전에는\\n신청을 할 수 없습니다.");
				modelMap.addAttribute("url", "./index.do");
			}
			else
			{
				throw new EmfException(he.getMessage());
			}
        }
        
        return url;
	}
}
