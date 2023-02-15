package front.oc.cuckoo.impl;

import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.oc.cuckoo.dao.CuckooDAO;
import front.oc.cuckoo.model.ReqUserParamModel;
import front.oc.oca.service.dao.OCAOutsourcingDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CuckooService extends EmfAbstractService {

    @Autowired
    private CuckooDAO cuckooDAO;

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
            emfMap.put("ci", ci);
            emfMap.put("startDate", reqUserParam.getStartDate());
            emfMap.put("endDate", reqUserParam.getEndDate());

            List<EmfMap> list = cuckooDAO.getUserRecord(emfMap);
            emfMap.put("record", list);
            emfMap.put("totalCount", list.size());
        }
        return emfMap;
    }
}
