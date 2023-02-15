package front.oc.smartLife.web;

import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.oc.smartLife.model.ReqUserParamModel;
import front.oc.smartLife.service.impl.SmartLifeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SmartLifeController extends EmfController {

    @Autowired
    private SmartLifeService smartLifeService;

    @RequestMapping(method = RequestMethod.GET, value = "/smart-life/index.do")
    public String getSmartLifeUserRecord() throws Exception {
        return "front/oc/smartLife/smartLifeUserRecord.front2";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/smart-life/userRecord.ajax")
    public ModelAndView getUserRecord(ReqUserParamModel reqUserParam) throws Exception {
        log.info(reqUserParam);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("front/oc/smartLife/ajax/recordListAjax");
        EmfMap emfMap = smartLifeService.getUserRecord(reqUserParam);
        mav.addObject(emfMap);
//        log.info(mav);
        return mav;
    }

}
