package front.foward.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 포워드 되는 사이트의 이동을 위한 Controller
 * </pre>
 * 
 * @ClassName		: FowardController.java
 * @Description		: 포워드 되는 사이트의 이동을 위한 Controller
 * @author 김필기
 * @since 2016.05.31
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.05.31		   김필기				  최초 생성
 * </pre>
 */ 
@Controller
public class FowardController extends EmfController {

	@RequestMapping(value="/foward/bpointlife.do")
	public String getBpointlife(HttpServletRequest request, EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/foward/bpointlife";
	}
	@RequestMapping(value="/foward/dmpointlife.do")
	public String getDmpointlife(HttpServletRequest request, EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		return "front/foward/dmpointlife";
	}	
}
