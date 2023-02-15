package front.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.service.MailService;
import emf.core.vo.EmfMap;

@Controller
public class MailController {

	@Autowired
	MailService mailService;
	
	@RequestMapping(value="/mail.do")
	public String getMobileCardPage(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		System.out.println("~~~~");
		
		emfMap.put("subject", "subject");
		emfMap.put("toUser", "this0555@nate.com");
		emfMap.put("fromUser", "lifeway@daemyung.com");
		emfMap.put("contents", "contents");
		
		mailService.sendMail(emfMap);
		
		return "front/ms/msa/MSAMobileCardView.front";
	}
}
