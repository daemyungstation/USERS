package front.oc.oca.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import emf.core.vo.EmfMap;
import front.oc.oca.service.DoznBankingService;
import front.oc.oca.service.dao.OCAOutsourcingDAO;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Security;
import java.util.HashMap;
import java.util.Map;

@Service("doznBankingService")
public class DoznBankingServiceImpl implements DoznBankingService {

	@Resource(name="oCAOutsourcingDAO")
	private OCAOutsourcingDAO oCAOutsourcingDAO;


    /**
     * <pre>
     * 1. MethodName : inquireDepositor
     * 2. ClassName  : CommonAccountServiceImpl.java
     * 3. Comment    : 예금주 조회
     * 4. 작성자       : upleat    
     * 5. 작성일       : 2020. 4. 29.
     * </pre>
     */
    @Override
    public Map<String, Object> inquireDepositor(EmfMap emfMap) {
    	Security.addProvider(new BouncyCastleProvider());
    	HttpPost post = new HttpPost("https://gw-firm.dozn.co.kr/api/rt/v1/inquireDepositor");
		int telegramNo = oCAOutsourcingDAO.selectTelegramNum(emfMap);
    	String accountNum = emfMap.getString("accountNum");
        String bankCode = emfMap.getString("bankCode");
    	
    	JSONObject requestBody = new JSONObject();
        requestBody.put("api_key", "bf8fa95e-62c9-4597-81fb-b2ac6822434a");
        requestBody.put("org_code", "10000073");
		requestBody.put("telegram_no", telegramNo);
        requestBody.put("bank_code", bankCode);
        requestBody.put("account", accountNum);
        
        post.addHeader("content-type", "application/json");
    	try {
			post.setEntity(new StringEntity(requestBody.toString()));
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
    	String res = "";
		try {
			
			CloseableHttpClient httpClient = HttpClients.createDefault();
			CloseableHttpResponse response = httpClient.execute(post);

			res = EntityUtils.toString(response.getEntity());
			response.close();
			httpClient.close();
		} catch (Exception e){
			e.printStackTrace();
		}
		System.out.println(res);
    	
		Map<String, Object> resultMap = new HashMap<String, Object>();
        try {
            DoznBankingResponse response = new ObjectMapper().readValue(res, DoznBankingResponse.class);
            if (response.getStatus() == 200) {
                resultMap.put("result", true);
                resultMap.put("depositor", response.getDepositor());
            } else if (response.getStatus() == 520) {
                resultMap.put("result", false);
                resultMap.put("message", response.getError_message());
            } else {
                resultMap.put("result", false);
                resultMap.put("message", "처리 중 오류 [ " + response.getStatus() + "-" + response.getError_code() + " ]");
            }
        } catch (IOException e) {
            resultMap.put("result", false);
            resultMap.put("message", "처리 중 오류");
        }

        return resultMap;
    	
    }

    private static class DoznBankingResponse {
        private int status; // 응답 상태 코드
        private String error_code; // 은행 오류코드
        private String error_message; // 은행 오류 메세지
        private String natv_tr_no; // 더즌 거래번호
        private String request_at; // 요청일시
        private String depositor; // 예금주명
		public int getStatus() {
			return status;
		}
		public void setStatus(int status) {
			this.status = status;
		}
		public String getError_code() {
			return error_code;
		}
		public void setError_code(String error_code) {
			this.error_code = error_code;
		}
		public String getError_message() {
			return error_message;
		}
		public void setError_message(String error_message) {
			this.error_message = error_message;
		}
		public String getNatv_tr_no() {
			return natv_tr_no;
		}
		public void setNatv_tr_no(String natv_tr_no) {
			this.natv_tr_no = natv_tr_no;
		}
		public String getRequest_at() {
			return request_at;
		}
		public void setRequest_at(String request_at) {
			this.request_at = request_at;
		}
		public String getDepositor() {
			return depositor;
		}
		public void setDepositor(String depositor) {
			this.depositor = depositor;
		}
        
    }

}
