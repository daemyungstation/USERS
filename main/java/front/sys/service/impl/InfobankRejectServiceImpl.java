package front.sys.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.util.SessionUtils;
import org.springframework.stereotype.Service;

import emf.core.extend.service.EmfAbstractService;
import front.sys.service.InfobankRejectService;
import front.sys.service.dao.InfobankDAO;

/**
 * infobank 수신거부 조회
 *
 */
@Service
public class InfobankRejectServiceImpl extends EmfAbstractService implements InfobankRejectService {

    private final Logger log = LoggerFactory.getLogger(InfobankRejectServiceImpl.class);

    @Resource
    public InfobankDAO infobankDAO;

    /**
     * Infobank 에서 들어온 수신거부 전화번호를 등록한다.
     *
     * @param pmParam 검색 조건
     * @return 고객 정보
     * @throws Exception
     */

    public Map<String, String> getInfobankRejectCall(Map<String, ?> pmParam) throws Exception {

        String sCid				= StringUtils.defaultString((String) pmParam.get("sCid"));           // 고유번호
        String sRejectnumber	= StringUtils.defaultString((String) pmParam.get("sRejectnumber"));  // 수신거부 번호
        String sRegdate			= StringUtils.defaultString((String) pmParam.get("sRegdate"));       // 수신거부일자

        String rtn_result ;
        log.debug("sRejectnumber : " + sRejectnumber);

        /*******************************************************************************/
        /* 응답결과 생성 */
        /*******************************************************************************/
        Map<String, String> mRtn = new HashMap<String, String>();


        int nResult = infobankDAO.getRjectCallCount(pmParam) ;

//        System.out.println(nResult);

        if (nResult > 0) {
            rtn_result = "duplication";
        } else {
            infobankDAO.insertInfobankRejectCallnum(pmParam);
            rtn_result="success";
        }

//        System.out.println("rtn_result : " + rtn_result);

        mRtn.put("rtn_result", rtn_result);
        mRtn.put("rbit", "Y");

        return mRtn;
    }

    public Map<String, Object> getInfobankRejcnt(Map<String, ?> pmParam) throws Exception {

        StringBuffer sbCreditRmk 	= new StringBuffer();

        String rcallnum				= StringUtils.defaultString((String) pmParam.get("callnum")); // 수신거부 번호

        log.debug("reject : " + rcallnum);

        /*******************************************************************************/
        /* 응답결과 생성 */
        /*******************************************************************************/
        Map<String, Object> mRtn = new HashMap<String, Object>();

        /* 업무 담당자 정보 */
        mRtn.put("callnum"	, rcallnum);
        mRtn.put("rbit"		, "S");


        return mRtn;
    }



    }
