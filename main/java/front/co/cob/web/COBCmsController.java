package front.co.cob.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * CMS 위한 Controller
 * </pre>
 * 
 * @ClassName		: COGCmsController.java
 * @Description		: CMS 위한 Controller
 * @author 김필기
 * @since 2016.03.16
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.16		   김필기				  최초 생성
 * </pre>
 */ 
@Controller
public class COBCmsController extends EmfController {
	

	/**
     * CMS 화면
     * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    	
	@RequestMapping(value={"/contentsid/{contentsid}/index.do", "/**/contentsid/{contentsid}/index.do"})
	public String getLoginView(HttpServletRequest request, EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		String url = request.getServletPath();
		
		url = url.replace("/contentsid",  "").replace("index.do", "index.front");

		return "contents" + url;
	}
}
