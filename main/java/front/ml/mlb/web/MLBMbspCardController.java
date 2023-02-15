package front.ml.mlb.web;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.net.util.Base64;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.ml.mlb.service.MLBMbspCardService;
import front.lg.lgb.service.LGBMemJoinService;
/**
 * <pre> 
 * 멤버십카드 신청을 위한 Controller
 * </pre>
 * 
 * @ClassName		: MLBMbspCardController.java
 * @Description		: 멤버십카드 신청을 위한 Service
 * @author 허진영
 * @since 2016.03.23
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.23		   허진영				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/my-lifeway/membership-card")
public class MLBMbspCardController extends EmfController {		
	
	/** 서비스 **/
	@Resource(name="mLBMbspCardService")
    private MLBMbspCardService mLBMbspCardService;

	@Resource(name="lGBMemJoinService")
    private LGBMemJoinService lGBMemJoinService;

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
			EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
			emfMap.put("mbspCardYn", "Y");
			
			emfMap.put("id", lgnMap.get("id"));
			emfMap = lGBMemJoinService.selectMemInf(emfMap);
			EmfMap infoMap = (EmfMap) emfMap.get("info");
			
			//emfMap.put("agreementForThirdParty", infoMap.get("agreementForThirdParty"));

			log.debug("===============================================================================");
			log.debug(infoMap.get("agreementForThirdParty"));
			log.debug("===============================================================================");
			emfMap.put("qMembership" , true);
			List<EmfMap> joinPrdctList = mLBMbspCardService.selectJoinPrdctList(emfMap);
			emfMap.remove("qMembership");
			
			modelMap.addAttribute("joinPrdctList", joinPrdctList);

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
		
		return "front/ml/mlb/MLBJoinPrdctList.front";
	}
	
	/**
	 * 멤버십 카드정보를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/search.ajax", method=RequestMethod.POST)
	public String selectMbspCardInf(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		try
		{
			

			Device device = DeviceUtils.getCurrentDevice(request);
			
			EmfMap rtnMap = mLBMbspCardService.selectMbspCardInf(emfMap);
			
			EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
			// rtnMap.put("agreementForThirdParty", lgnMap.get("agreementForThirdParty"));

			emfMap.put("id", lgnMap.get("id"));
			emfMap = lGBMemJoinService.selectMemInf(emfMap);
			EmfMap infoMap = (EmfMap) emfMap.get("info");
			
			emfMap.put("agreementForThirdParty", infoMap.get("agreementForThirdParty"));

			modelMap.addAttribute("rtnMap", rtnMap);
			modelMap.addAttribute("device", device.getDevicePlatform().toString());
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/ml/mlb/MLBMbspCardWrite";
	}
	
	/**
	 * 멤버십카드 이미지를 생성한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/canvas.ajax", method=RequestMethod.POST)
	public ModelAndView getCanvasToImageFile(EmfMap emfMap, ModelMap modelMap, HttpServletRequest request) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		    
		try
		{
			String data = emfMap.getString("data");
			
			if(!"".equals(data))
			{
				data = data.replaceAll("data:image/png;base64,", "");

				byte[] file = Base64.decodeBase64(data);  
				
				//폴더 생성
				String pyhPath = EgovProperties.getProperty("Globals.mobileFileStorePath");
				
				Calendar oCalendar = Calendar.getInstance();
				
				pyhPath = pyhPath + "/" + oCalendar.get(Calendar.YEAR);
				pyhPath = pyhPath + "/" + (oCalendar.get(Calendar.MONTH) + 1);
				
				File saveFolder = new File(EgovWebUtil.filePathBlackList(pyhPath));
				
				if (!saveFolder.exists() || saveFolder.isFile())
				{
				    saveFolder.mkdirs();
				}
				
				//파일명 생성
				SimpleDateFormat sdfCurrent = new SimpleDateFormat("yyyyMMddhhmmssSSS", Locale.KOREA);
				
				Timestamp ts = new Timestamp(System.currentTimeMillis());
				
				String saveFileNm = sdfCurrent.format(ts.getTime());
				
				//파일경로
				String filePath = pyhPath + File.separator + saveFileNm + ".jpg";
				
				FileOutputStream fos = new FileOutputStream(filePath);
			
				fos.write(file);
				fos.close();
				
				mav.addObject("filename", saveFileNm);
				mav.addObject("csrfPreventionSalt", request.getAttribute("csrfPreventionSalt"));
			}
			
			mav.setViewName("jsonView");
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		}
		
		return mav;
	}
}
