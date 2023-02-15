package front.ml.mld.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.com.utl.fcc.service.EgovStringUtil;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.ml.mld.service.MLDChngPtcService;

/**
 * <pre> 
 * 전환서비스 신청내역 조회를 위한 Controller
 * </pre>
 * 
 * @ClassName		: MLDChngRqstController.java
 * @Description		: 전환서비스 신청내역 조회를 위한 Controller
 * @author 허진영
 * @since 2016.03.18
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.18		   허진영				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/my-lifeway/chage-service/particular")
public class MLDChngPtcController extends EmfController {	
	
	/** 서비스 **/
	@Resource(name="mLDChngPtcService")
    private MLDChngPtcService mLDChngPtcService;
	
	/**
	 * 전환서비스 신청내역 목록을 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/list.do")
	public String selectChngPtcList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			EmfMap rtnMap = mLDChngPtcService.selectChngPtcList(emfMap);
			
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
		
		return "front/ml/mld/MLDChngPtcList.front";
	}
	
	/**
	 * 전환서비스 신청내역 상세를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/view.do", method=RequestMethod.POST)
	public String selectChngPtcDtl(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			EmfMap rtnMap = mLDChngPtcService.selectChngPtcDtl(emfMap);
			
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
		
		return "front/ml/mld/MLDChngPtcView.front";
	}
	
	/**
	 * 전환서비스 신청내역 목록을 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/cancel.do", method=RequestMethod.POST)
	public String updateChngPtc(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		String url = "error/blank.error";
		
		try
		{
			mLDChngPtcService.updateChngRqstCncl(emfMap);
			
			modelMap.addAttribute("msg", "전환서비스 신청이 취소되었습니다.");
			modelMap.addAttribute("url", "/my-lifeway/chage-service/particular/list.do");
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			
			if("신청취소오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "전환서비스 신청 취소는 상담진행전까지만 가능합니다.");
				modelMap.addAttribute("url", "/my-lifeway/chage-service/particular/list.do");
			}
			else
			{
				throw new EmfException(he.getMessage());
			}
		} 
		
		return url;
	}
}
