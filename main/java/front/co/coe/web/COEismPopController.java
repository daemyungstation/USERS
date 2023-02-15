package front.co.coe.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <pre> 
 * Nice Safe-Key(인터넷 방식)발급 위한 Controller
 * </pre>
 * 
 * @ClassName		: CODNiceSafeKeyController.java
 * @Description		: Nice Safe-Key(인터넷 방식)발급 위한 Controller
 * @author 허진영
 * @since 2016.10.25
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.10.25		   허진영				  최초 생성
 * </pre>
 */  
@Controller
@RequestMapping("/ism-popup")
public class COEismPopController {

	@RequestMapping("/index.do")
	public String viewIsmPopup() {
		
		return "front/co/coe/COEismPop";
	}

	@RequestMapping("/ismsp.do")
	public String viewIsmspPopup() {

		return "front/co/coe/COEismspPop";
	}
}
