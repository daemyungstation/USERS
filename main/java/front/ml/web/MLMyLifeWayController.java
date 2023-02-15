package front.ml.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.ml.service.MLMyLifewayService;

/**
 * <pre> 
 * MyLifeway를 위한 Controller
 * </pre>
 * 
 * @ClassName		: MLMyLifeWayController.java
 * @Description		: MyLifeway를 위한 Controller
 * @author 허진영
 * @since 2016.03.21
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.21		   허진영				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/my-lifeway")
public class MLMyLifeWayController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="mLMyLifewayService")
	private MLMyLifewayService mLMyLifewayService;
	
	/**
	 * MyLifeway 메뉴 접근 제한 페이지.
	 * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/access/index.do")
	public String getBlockAccessPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ml/MLBlockAccess.front";
	}

	/**
	 * MyLifeway 메뉴 접근 제한 페이지.
	 *
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/access/associate_index.do")
	public String getAssociateAccessPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/ml/MLAssociateBlockAccess.front";
	}
	
	/**
	 * 고유번호 확인요청을 등록한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/check-requestion/insert.ajax", method=RequestMethod.POST)
	public ModelAndView insertChkReqn(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		try
		{
			EmfMap rtnMap = mLMyLifewayService.insertChkReqn(emfMap);
			
			mav.addObject("status", rtnMap.getString("chkReqnYn"));
			
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
