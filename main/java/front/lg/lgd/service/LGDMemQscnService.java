package front.lg.lgd.service;

import front.lg.lgd.service.dao.LGDMemQscnDAO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("lGDMemQscnService")
public class LGDMemQscnService {

    @Resource()
    private LGDMemQscnDAO lgdMemQscnDAO;

    public void changeQscnUserToActiveUser(String id, String ci) throws Exception {
        lgdMemQscnDAO.changeQscnUserToActiveUser(id, ci);
        lgdMemQscnDAO.deleteQscnUser(id, ci);
    }
}
