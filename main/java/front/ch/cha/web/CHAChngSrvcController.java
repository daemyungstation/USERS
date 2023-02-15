package front.ch.cha.web;

import java.io.FileNotFoundException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.co.coc.service.COCBoardMngService;
import front.ml.mld.service.MLDChngRqstService;
 
/**
 * <pre> 
 * 전환서비스를 위한 Controller
 * </pre>
 * 
 * @ClassName		: CHAChngSrvcController.java
 * @Description		: 전환서비스를 위한 Controller
 * @author 허진영
 * @since 2017.01.16
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2017.01.16		   허진영				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/change-service")
public class CHAChngSrvcController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="cOCBoardMngService")
	private COCBoardMngService cOCBoardMngService;
	
	@Resource(name="mLDChngRqstService")
    private MLDChngRqstService mLDChngRqstService;
	
	/**
     * 전환서비스 > 여행 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/tour/index.do")
	public String getTourPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ch/cha/CHATourView.front";
	}
	
	/**
     * 전환서비스 > 웨딩 > 서비스소개 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/wedding/introduction/index.do")
	public String getWeddingIntroPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ch/cha/CHAWeddingIntroView.front";
	}
	
	/**
     * 전환서비스 > 웨딩 > 297 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/wedding/297/index.do")
	public String getWedding297Page(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ch/cha/CHAWedding297View.front";
	}
	
	/**
     * 전환서비스 > 웨딩 > 399 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/wedding/399/index.do")
	public String getWedding399Page(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ch/cha/CHAWedding399View.front";
	}
	
	/**
     * 전환서비스 > 웨딩 > 429 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/wedding/429/index.do")
	public String getWedding429Page(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ch/cha/CHAWedding429View.front";
	}
	
	/**
     * 전환서비스 > 웨딩 > 499 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/wedding/499/index.do")
	public String getWedding499Page(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ch/cha/CHAWedding499View.front";
	}
	
	/**
     * 전환서비스 > 결혼정보 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/marriage-information/index.do")
	public String getMarriageInfoPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ch/cha/CHAMarriageInfoView.front";
	}
	
	/**
     * 전환서비스 > 컨벤션 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/convention/index.do")
	public String getConventionPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ch/cha/CHAConventionView.front";
	}
	
	/**
     * 전환서비스 > 어학연수 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/english-camp/index.do")
	public String getEnglishCampPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ch/cha/CHAEnglishCampView.front";
	}
	
	/**
     * 전환서비스 > 교육 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/education/index.do")
	public String getEducationPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ch/cha/CHAEducationView.front";
	}
	
	/**
     * 전환서비스 > 이사 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/move/index.do")
	public String getMovePage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ch/cha/CHAMoveView.front";
	}
	
	/**
     * 전환서비스 > 골프 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/golf/index.do")
	public String getGolfPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ch/cha/CHAGolfView.front";
	}
	
	/**
     * 전환서비스상품 상세를 조회한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/dtl-list.ajax", method=RequestMethod.POST)
	public String selectPrdctDtlList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			emfMap.put("chngSrvcCntsYn", "Y");
			
			EmfMap dtlMap = mLDChngRqstService.selectPrdctDtlList(emfMap);
			
			modelMap.addAttribute("dtlMap", dtlMap);	
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/ch/cha/CHAComDtlList";
	}
	
	/**
	 * 전환서비스상품 상세를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/dtl-info.do", method=RequestMethod.POST)
	public String selectPrdctDtlInf(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			emfMap.put("rqstYn", "N");
			
			if(EgovUserDetailsHelper.isAuthenticated())
			{
				emfMap.put("authYn", "Y");
			}
			else
			{
				emfMap.put("authYn", "N");
			}
			
			EmfMap rtnMap = mLDChngRqstService.selectPrdctDtlInf(emfMap);
			
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
		
		return "front/ch/cha/CHAComDtlPop.pop";
	}
	
	/**
     * FAQ 목록을 조회한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/faq-list.ajax", method=RequestMethod.POST)
	public String selectFaqList(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			emfMap.put("communityId", "8");
			
			EmfMap mstInfo = cOCBoardMngService.selectMaster(emfMap);  
			
			if(mstInfo != null && "Y".equals(mstInfo.get("useYn")))
			{
				//검색어 체크
				String f = emfMap.getString("f");
				String q = emfMap.getString("q");
				
				if(!"".equals(EMFStringUtil.nullConvert(q)) && q.length() <= 15)
				{
					emfMap.put("f", f);
					emfMap.put("q", q);
				}
				else
				{
					emfMap.put("f", "");
					emfMap.put("q", "");
				}				
	
				emfMap.put("tablenm", mstInfo.getString("tablenm"));
				emfMap.put("cntPage", mstInfo.getString("pageRowCnt"));
				emfMap.put("chngSrvcCntsYn", "Y");

				EmfMap rtnMap = cOCBoardMngService.selectBoardList(emfMap);
				
				modelMap.addAttribute("rtnMap", rtnMap);		
				modelMap.addAttribute("mstInfo", mstInfo);
			}
			else
			{
				throw new FileNotFoundException();
			}
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/ch/cha/CHAComFaqList";
	}
}
