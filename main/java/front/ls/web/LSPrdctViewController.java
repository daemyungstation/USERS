package front.ls.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 온라인 상품가입을 위한 Controller
 * </pre>
 * 
 * @ClassName		: LPOnlinePrdctController.java
 * @Description		: 온라인 상품가입을 위한 Controller
 * @author 김필기
 * @since 2016.03.10
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.10		   김필기				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/lifeway-service/{product}")
public class LSPrdctViewController extends EmfController {

	/**
	 * 상품 상세보기
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	@RequestMapping(value="/view.do")
	public String selectPaymentMethod(EmfMap emfMap, ModelMap modelMap, @PathVariable String product) throws Exception
	{
		return "front/ls/" + product + ".pop";		
	}	
}
