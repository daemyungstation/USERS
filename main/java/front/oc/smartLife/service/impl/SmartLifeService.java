package front.oc.smartLife.service.impl;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.co.util.COPaginationUtil;
import front.oc.oca.service.dao.OCAOutsourcingDAO;
import front.oc.smartLife.dao.SmartLifeDAO;
import front.oc.smartLife.model.ReqUserParamModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
public class SmartLifeService extends EmfAbstractService {

    @Autowired
    private SmartLifeDAO smartLifeDAO;

    @Autowired
    private OCAOutsourcingDAO ocaOutsourcingDAO;

    public EmfMap getUserRecord(ReqUserParamModel reqUserParam) throws Exception {
        EmfMap emfMap = new EmfMap();
        emfMap.put("agentEmpNm", reqUserParam.getName());
        emfMap.put("sllrCtel", reqUserParam.getPhone());
        emfMap.put("birthDay", reqUserParam.getBirth());
        EmfMap agentUserCiInfo = ocaOutsourcingDAO.agentAuthCheck(emfMap);
        log.info(agentUserCiInfo);

        emfMap.put("record", new ArrayList<EmfMap>());

        if (agentUserCiInfo != null) {
            String ci = (String) agentUserCiInfo.get("ci");

            // 테스트용 CI
//            ci = "VUMh0GE89bmSa15b2JBDP1tnLHbYh2d30FRamZVfVvqPNzz4N+9jy6w+7BMF+xFUREeOGgSMPyLOIuRNJGiInA==";

            emfMap.put("ci", ci);
            emfMap.put("startDate", reqUserParam.getStartDate());
            emfMap.put("endDate", reqUserParam.getEndDate());

            List<EmfMap> list = smartLifeDAO.getUserRecord(emfMap);
            emfMap.put("record", list);
            emfMap.put("totalCount", list.size());

            // 테스트용 수당
//            Random random = new Random();
//            for (int i = 0 ; i < list.size(); i++) {
//                list.get(i).put("sdpAlow", random.nextInt(100) * 1000);
//            }

        }

        return emfMap;
    }
}
