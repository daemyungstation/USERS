package front.ms.msa.web;

import java.io.FileNotFoundException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.co.coc.service.COCBoardMngService;
import front.ml.mlc.service.MLCPfmcInfService;

/**
 * <pre> 
 * 멤버십서비스를 위한 Controller
 * </pre>
 * 
 * @ClassName		: PRALifeMgznController.java
 * @Description		: 멤버십서비스를 위한 Controller
 * @author 허진영
 * @since 2016.04.11
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.04.11		   허진영				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/membership-service")
public class MSAMbspSrvcController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="cOCBoardMngService")
	private COCBoardMngService cOCBoardMngService;
	
	@Resource(name="mLCPfmcInfService")
    private MLCPfmcInfService mLCPfmcInfService;

	/**
     * 멤버십 서비스 > 모바일 멤버십 카드 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/mobile-card/index.do")
	public String getMobileCardPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ms/msa/MSAMobileCardView.front";
	}
	
	/**
     * 멤버십 서비스 > OK캐쉬백 안내 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/okcashbag/guide.do")
	public String getOkcashbagGuidePage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ms/msa/MSAOcbCardGuidePop.pop";
	}
	
	/**
     * 멤버십 서비스 > 대명리조트 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/resort/index.do")
	public String getResortPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ms/msa/MSAResortView.front";
	}
	
	/**
     * 멤버십 서비스 > 대명문화공장 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/culture-factory/index.do")
	public String getMbspSrvcCulturePage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			emfMap.put("mbspSrvcYn", "Y");
			
			EmfMap rtnMap = mLCPfmcInfService.selectPfmcInfList(emfMap);
			
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
		
		return "front/ms/msa/MSACultureView.front";
	}
	
	/**
     * 멤버십 서비스 > 대명투어몰 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/tour-mall/index.do")
	public String getTourMallPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ms/msa/MSATourMallView.front";
	}
	
	/**
     * 멤버십 서비스 > 대명본웨딩 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/born-wedding/index.do")
	public String getWeddingPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ms/msa/MSAWeddingView.front";
	}
	
	/**
     * 멤버십 서비스 > 대명윈드원 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/withone/index.do")
	public String getWithonePage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ms/msa/MSAWithoneView.front";
	}
	
	/**
     * 멤버십 서비스 > 대명컨벤션 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/convention/index.do")
	public String getConventionPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ms/msa/MSAConventionView.front";
	}
	
	/**
     * 멤버십 서비스 > 대명 아이스하키 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/icehockey/index.do")
	public String getIceHockeyPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ms/msa/MSAIcehockeyView.front";
	}
	
	/**
     * 멤버십 서비스 > 해외 리조트 페이지
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/foreign-resort/index.do")
	public String getForeignResortPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ms/msa/MSAForeignResortView.front";
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
				emfMap.put("mbspSrvcCntsYn", "Y");

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
		
		return "front/ms/msa/MSAComFaqList";
	}
}
