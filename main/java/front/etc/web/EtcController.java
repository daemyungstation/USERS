package front.etc.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 이전 php 사이트의 이동을 위한 Controller
 * </pre>
 * 
 * @ClassName		: EtcController.java
 * @Description		: 이전 php 사이트의 이동을 위한 Controller
 * @author 김필기
 * @since 2016.05.09
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.05.09		   김필기				  최초 생성
 * </pre>
 */ 
@Controller
public class EtcController extends EmfController {

	@RequestMapping(value="/mobiledev/ceremonylist.php")
	public String getLoginView(HttpServletRequest request, EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		modelMap.put("empleNo", emfMap.getString("empleNo"));
		modelMap.put("branchkind", emfMap.getString("branchkind"));
		modelMap.put("empno", emfMap.getString("empno"));
		modelMap.put("stdate", emfMap.getString("stdate"));
		modelMap.put("chkvalue", emfMap.getString("chkCp"));
		modelMap.put("datepicker", emfMap.getString("datepicker"));
		modelMap.put("datepicker2", emfMap.getString("datepicker2"));
		
		return "front/etc/ceremonylist";
	}
	
	@RequestMapping("/homeplus/index.php")
	public String getHomeplusView(HttpServletRequest request, EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/etc/homepluslist";
	}
	
	@RequestMapping("/promotion")
	public String getPromotionView(HttpServletRequest request, EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/etc/promotion";
	}

	@RequestMapping("/kbcard/event")
	public String getKBStarEvent(HttpServletRequest request, EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/etc/KBStar";
	}
}
