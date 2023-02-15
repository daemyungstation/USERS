package front.lg.web;

import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import java.util.ArrayList;
import java.util.List;

/**
 * <pre> 
 * 주소검색을 위한 Controller
 * </pre>
 * 
 * @ClassName		: LGAddressController.java
 * @Description		: 주소검색을 위한 Controller
 * @author 황순용
 * @since 2022.11.03
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2022.11.03		   황순용				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/address")
public class LGAddressController extends EmfController {

	/**
	 * 주소 팝업(go.kr)
	 *
	 * @param pmParam Map<String, Object>
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/jusoPopup.do")
	public String addressJusoPopup(EmfMap emfMap) throws Exception {
		return "front/address/jusoPopup.pop";
	}

	/**
	 * 주소 팝업(go.kr)
	 *
	 * @param pmParam Map<String, Object>
	 * @return ModelAndView
	 * @throws Exception
	 */
	@RequestMapping(value = "/jusoTest.do")
	public String addressJusoTest(EmfMap emfMap) throws Exception {
		return "front/address/jusoTest";
	}

}
