package front.sys.service.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractSmsDAO;

/**
 * * Infobank 수신거부 리스트 조회 클래스
 *
 * @author 최석규
 * @version 1.0
 * @date 2016/10/10
 * @프로그램ID Infobank
 */
@Repository
public class InfobankDAO extends EmfAbstractSmsDAO {

     /**
     * Infobank 에서 수신된 수신거부 번호를 삽입한다
     *
     * @param Infobank 수신 정보
     * @throws Exception
     */
    public int insertInfobankRejectCallnum(Map<String, ?> pmParam) throws Exception {
        return insert("InfobankRejectMap.insertInfobankRejectCallnum", pmParam);
    }


    /**
     * 기 등록된 수신거부 이력을 조회한다.
     *
     * @param pmParam 조회 전화번호
     * @throws Exception
     */
    public int getRjectCallCount(Map<String, ?> pmParam) throws Exception {
        return (Integer) selectByPk("InfobankRejectMap.selectInfobankRejectCallnum", pmParam);
    }

    }
