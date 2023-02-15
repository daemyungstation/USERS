package front.sys.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import front.sys.service.InfobankRejectService;


/**
 * infobank 수신거부 리스트 수신
 *
 */

@Controller
@RequestMapping(value = "/sys/InfobankReject")
public class InfobankRejectController {

    private final Logger log = LoggerFactory.getLogger(InfobankRejectController.class);

    @Resource
    private InfobankRejectService infobankRejectService;

    /**
     * Infobank 에 접수된 수신거부 리스트를 받아와서 처리한다
     *
     * @param request HttpServletRequest
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/RejectCallnum.do")
    public void RejectCallnumIns(HttpServletRequest request, HttpServletResponse response) throws Exception {
        boolean isSuccess = true;
//        System.out.println("------------1");
        Map<String, String> request_data = new HashMap<String, String>();

        String sCid = request.getParameter("cid");
        String sRejectnumber = request.getParameter("rejectnumber");
        String sRegdate = request.getParameter("regdate");
        String result = "";
        
//        System.out.println("------------2");

        if (null == sCid) sCid = "";
        if (null == sRejectnumber) sRejectnumber = "";
        if (null == sRegdate) sRegdate = "";

        request_data.put("sCid", sCid);
        request_data.put("sRejectnumber", sRejectnumber);
        request_data.put("sRegdate", sRegdate);
//        System.out.println("------------3");
        Map<String, String> rtnmsg = infobankRejectService.getInfobankRejectCall(request_data) ;
//        System.out.println("------------4");
        result = rtnmsg.get("rtn_result");

        // 결과값 출력
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter outs = response.getWriter();

        outs.println("{cid:'" + sCid + "', result: '" + result + "'}");

        outs.flush();
//        System.out.println("------------5");

    }


    /**
     * 기등록 된 수신거부 리스트 조회
     *
     * @param pmParam Map<String, Object>
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/rcallno_list")
    public ModelAndView sendSafeKeyIssueSms(HttpServletRequest request, Model model) throws Exception {
        ModelAndView mav = new ModelAndView();

//        Map<String, Object> mRslt = niceCreditService.sendSafeKeyIssueSms(request);

  //      mav.addObject("sPlainData"			, mRslt.get("sPlainData")		);
  //      mav.addObject("sReqDatetime"		, mRslt.get("sReqDatetime")		);

        mav.setViewName("checkplus/checkplus_send_main");
        return mav;
    }


}