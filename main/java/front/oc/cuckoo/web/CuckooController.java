package front.oc.cuckoo.web;

import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.oc.cuckoo.impl.CuckooService;
import front.oc.cuckoo.model.ReqUserParamModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CuckooController extends EmfController {

    @Autowired
    private CuckooService cuckooService;

    @RequestMapping(method = RequestMethod.GET, value = "/Cuckoo-home/index.do")
    public String getCuckooUserRecord() throws Exception {
        return "front/oc/cuckoo/CuckooUserRecord.front2";
    }
    @RequestMapping(method = RequestMethod.POST, value =  "/Cuckoo-home/userRecord.ajax" )
    public ModelAndView getCuckooUserRecord(ReqUserParamModel reqUserParam) throws Exception {
        log.info(reqUserParam);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("front/oc/cuckoo/ajax/recordListAjax");
        EmfMap emfMap = cuckooService.getUserRecord(reqUserParam);
        log.info(reqUserParam);
        mav.addObject(emfMap);
        log.info(emfMap);
        return mav;
    }


}
