package front.lg.lga.service.dao;

import emf.core.extend.dao.EmfAbstractMallDAO;
import emf.core.vo.EmfMap;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("mallMemDAO")
public class MallMemDAO extends EmfAbstractMallDAO {
    private final String DECRIPT_KEY = "2ad265d024a06e3039c3649213a834390412aa7097ea05eea4e0b44c88ecf7972ad265d024a06e3039c3649213a834390412aa7097ea05eea4e0b44c88ecf797";

    /**
     * 회원몰 정보 조회
     *
     * @param unqNo
     * @return
     */
    public List<EmfMap> getMallMemInfo(String unqNo) {
        EmfMap emfMap = new EmfMap();
        emfMap.put("key", DECRIPT_KEY);
        emfMap.put("unqNo", unqNo);
        return list("getMallMemInfo", emfMap);
    }

}
