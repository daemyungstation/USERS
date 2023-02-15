package front.fm.fma.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import egovframework.com.cmm.service.EgovProperties;
import front.fm.fma.service.FMAMainPopupService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.co.coc.service.COCBoardMngService;
import front.sm.sma.service.SMABanrMngService;
import front.sm.sma.service.SMAPopMngService;
import front.fm.fma.service.FMAMainMngService;

import org.springframework.web.servlet.ModelAndView;

/**
 * <pre> 
 * 메인화면 위한 Controller
 * </pre>
 * 
 * @ClassName		: FMAMainController.java
 * @Description		: 메인화면 위한 Controller
 * @author 김필기
 * @since 2016.03.03
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.03		   김필기				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/main")
public class FMAMainController extends EmfController {
	
	/** 게시판 **/
	@Resource(name="cOCBoardMngService")
	private COCBoardMngService cOCBoardMngService;
	
	/** 배너 **/
	@Resource(name="sMABanrMngService")
	private SMABanrMngService sMABanrMngService;
	
	/** 팝업 **/
	@Resource(name="sMAPopMngService")
	private SMAPopMngService sMAPopMngService;
	
	/** 컨텐츠 **/
	@Resource(name="fMAMainMngService")
	private FMAMainMngService fMAMainMngService;

	@Autowired
	private FMAMainPopupService fmaMainPopupService;

	/**
	 * 메인 화면
	 *
 	 * @param emfMap
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/index.do")
	public String getLoginView(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{		
			int pageRowCnt = 5;
			
			EmfMap mstInfo = new EmfMap();
			
			// 공지사항 start
			EmfMap notice = new EmfMap();
			notice.put("communityId", "7");
			mstInfo = cOCBoardMngService.selectMaster(notice);
			
			notice.put("tablenm", mstInfo.getString("tablenm"));
			notice.put("cntPage", pageRowCnt);
			EmfMap noticeMap = cOCBoardMngService.selectBoardList(notice);
			// 공지사항 end
					
			// 컨텐츠 목록 start
			List<EmfMap> visualList = fMAMainMngService.selectVisualMainList();
			for(EmfMap vl : visualList)
			{
				String webTitleTxt = vl.getString("webTitleTxt");
				webTitleTxt = webTitleTxt.replaceAll("\r\n", "<br>");
				webTitleTxt = webTitleTxt.replaceAll("\r", "<br>");
				webTitleTxt = webTitleTxt.replaceAll("\n", "<br>");
				webTitleTxt = webTitleTxt.replaceAll("(##.*##)", "<small>$1</small>").replaceAll("##", "");
				vl.put("webTitleTxt", webTitleTxt); 
				
				vl.put("titleImgXyAry", vl.getString("titleImgXy").split(",")); 
				vl.put("titleTxtXyAry", vl.getString("titleTxtXy").split(","));
				vl.put("btnXyAry", vl.getString("btnXy").split(","));
				String[] bgXy = vl.getString("bgXy").split(",");
				for(int i = 0; i < bgXy.length; i++)
				{
					if(!"auto".equals(bgXy[i])) bgXy[i] = bgXy[i] +"px"; 
				}
				vl.put("bgXyAry", bgXy);
			}
			
			List<EmfMap> cList = fMAMainMngService.selectContentMainList();
			
//			System.out.println("cList.size() : " + cList.size());
			
			String contentMstSeq = "";
			List<EmfMap> contentList = new ArrayList<EmfMap>();
			List<EmfMap> contentDtlList = new ArrayList<EmfMap>();

			EmfMap cMst = new EmfMap();
			
			for(EmfMap cl : cList) {
				if(!contentMstSeq.equals(cl.getString("cntnsMstSeq")))
				{
					if(!"".equals(contentMstSeq))
					{
						contentList.add(cMst);
					}
					contentMstSeq = cl.getString("cntnsMstSeq");

					cMst = new EmfMap();
					cMst.put("CNTNS_MST_SEQ", contentMstSeq);
					cMst.put("GRP_ID", cl.getString("grpId"));
					cMst.put("TITLE_TXT", cl.getString("titleTxt").replaceAll("(##.*##)", "<span>$1</span>").replaceAll("##", ""));
					cMst.put("TITLE_COLOR", cl.getString("titleColor"));
					cMst.put("CORDERBY", cl.getString("corderby"));
				}
				
				if(!"".equals(cl.getString("cntnsDtlSeq")))
				{
					String dsc = cl.getString("dsc");
					dsc = dsc.replaceAll("\r\n", "<br>");
					dsc = dsc.replaceAll("\r", "<br>");
					dsc = dsc.replaceAll("\n", "<br>");
					
					EmfMap dMst = new EmfMap();
					dMst.put("CNTNS_MST_SEQ", cl.getString("cntnsMstSeq"));
					dMst.put("CNTNS_DTL_SEQ", cl.getString("cntnsDtlSeq"));
					dMst.put("IMG_PATH", cl.getString("imgPath"));
					dMst.put("IMG_SAVE_FILE_NM", cl.getString("imgSaveFileNm"));
					dMst.put("IMG_REAL_FILE_NM", cl.getString("imgRealFileNm"));
					dMst.put("TITLE", cl.getString("title"));
					dMst.put("DSC", dsc);
					dMst.put("LINK", cl.getString("link"));
					dMst.put("LINK_TYPE", cl.getString("linkType"));
					dMst.put("DORDERBY", cl.getString("dorderby"));
		
					contentDtlList.add(dMst);
				}
			}
			contentList.add(cMst);		
			
			modelMap.addAttribute("visualList", visualList);		
			modelMap.addAttribute("contentList", contentList);		
			modelMap.addAttribute("contentDtlList", contentDtlList);		
			// 컨텐츠 목록 end

			modelMap.addAttribute("noticeMap", noticeMap);									
			
//			System.out.println("test: 태스트 성공");
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 		
		
		return "front/fm/fma/FMAMain";
	}
	private String bucketMarketUrl = EgovProperties.getProperty("Globals.bucketMarketUrl");
	@RequestMapping(value="/gate/index.do")
	public String getGateView(EmfMap emfMap, ModelMap modelMap) throws Exception {
		modelMap.addAttribute("bucketMarketUrl", bucketMarketUrl);
		return "front/fm/fmb/FMBMain";
	}

	@RequestMapping(value="/popup.ajax", method = RequestMethod.GET)
	public ModelAndView getMainPopup(EmfMap emfMap) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(fmaMainPopupService.getMainPopupInfo(emfMap));
		mav.setViewName("jsonView");
		return mav;
	}

    @RequestMapping(value="/popup.do", method = RequestMethod.GET)
    public String getMainPopupHtml() throws Exception {
        return "front/fm/fma/MainPopup";
    }
}
