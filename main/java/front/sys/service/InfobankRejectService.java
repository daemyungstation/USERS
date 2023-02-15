package front.sys.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface InfobankRejectService {

    public Map<String, String> getInfobankRejectCall(Map<String, ?> pmParam) throws Exception;

    public Map<String, Object> getInfobankRejcnt(Map<String, ?> pmParam) throws Exception;

}