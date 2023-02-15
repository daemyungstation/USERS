package front.pr.prb.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import emf.core.extend.web.EmfController;

/**
 * <pre> 
 * 대명 이벤트 더미페이지 Controller
 * </pre>
 * 
 * @ClassName		: PRBReceiveOkRequestController.java
 * @Description		: 대명 이벤트 더미페이지 Controller
 * 
 */ 

@Controller
@RequestMapping("/")
public class PRBReceiveOkRequestController extends EmfController {
	@RequestMapping(value="okRequest.do")
	public String receiveOkRequest() {
		return "front/pr/prb/PRBReceiveOkRequest";
	}
}