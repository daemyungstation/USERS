package front.lg.sso.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import egovframework.com.cmm.service.EgovProperties;
import emf.core.extend.service.EmfAbstractService;
import front.lg.sso.exception.SsoException;

@Service("ssoService")
public class SSOService extends EmfAbstractService {

    private final String SSO_API_URL = EgovProperties.getProperty("sso.api.url");
    private final String SSO_SERVICE_KEY= EgovProperties.getProperty("sso.api.servicekey");

    private HashMap requestSsoApi(String api, MultiValueMap<String, Object> body) throws Exception
    {
		System.out.println(" ################## api ==> " +api);
		body.add("serviceKey", SSO_SERVICE_KEY);
		System.out.println(" ################## body ==> " +body);

		String param = "?";
		int i = 0;
		for (String key : body.keySet())
        {
			if (i>0) param += "&";
			i++;
			List<Object> valList = body.get(key);
			String val = valList.size() > 0 ? valList.get(0).toString() : "";
			param = param + key + "=" + URLEncoder.encode(val, "UTF-8");
        }

		//전송				
		URL url = new URL(SSO_API_URL + api + param);

		TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {

			public X509Certificate[] getAcceptedIssuers() {
				return null;
			}

			public void checkClientTrusted(X509Certificate[] certs, String authType) {

			}

			public void checkServerTrusted(X509Certificate[] certs, String authType) {

			}

		} };

		SSLContext sc = SSLContext.getInstance("SSL");
		sc.init(null, trustAllCerts, new SecureRandom());
		HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

		System.out.println(" ################## url ==> " +url);
		
		byte[] postData = {};
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setConnectTimeout(30*1000);
		conn.setReadTimeout(30*1000);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "text/plain");
		conn.setDoOutput(true);
		
		
		conn.getOutputStream().write(postData);

		System.out.println(" ################## conn ==> " +conn);

		StringBuffer sb = new StringBuffer();
	    sb.setLength(0);
	    String inputLine = null;			
		BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        while((inputLine = in.readLine()) != null) { // response 출력
        	sb.append(inputLine);		        			            
        }
        in.close();

		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> responseBody = new HashMap<String, Object>();
		responseBody = mapper.readValue(sb.toString(), new TypeReference<Map<String, Object>>(){});
		System.out.println(" ################## responseBody ==> " +responseBody);

		return responseBody;
    }
    
    
    /**
     * SSO 회원정보중복체크
     *  : /api/member/exist
     * @param ci
     * @param id
     * @param ip
     * @return HashMap
     * @throws Exception
     * @throws SsoException
     */
    public HashMap exist(String ci, String id, String ip) throws Exception, SsoException
    {
        MultiValueMap<String, Object> body = new LinkedMultiValueMap<String, Object>();
        if (ci != null && !ci.equals("")) 
        	body.add("ci", ci);
        if (id != null && !id.equals(""))
        	body.add("id", id);
        if (ip != null && !ip.equals(""))
        	body.add("ip", ip);

        HashMap responseBody = this.requestSsoApi("/exist", body);

        if (!"R0000".equals(responseBody.get("code"))) {
        	throw new SsoException((String)responseBody.get("code"));
        }

        List<HashMap> datas = (List) responseBody.get("datas");

        return datas.size() == 0 ? null : datas.get(0);
    }

    /**
     * SSO 통합회원가입
     *  : /api/member/join
     * @param ci
     * @param id
     * @param name
     * @param pwd
     * @param gender
     * @param birth
     * @param email
     * @param phone
     * @param cellPhone
     * @param zipCode
     * @param address
     * @param addressDetail
     * @param marketingAgreementFlag
     * @param ip
     * @return
     * @throws Exception
     * @throws SsoException
     */
    public HashMap join(String ci, String id, String name, String pwd, String gender, String birth, String email, String phone, String cellPhone, String zipCode, String address, String addressDetail, String marketingAgreementFlag, String ip) throws Exception, SsoException
    {
        MultiValueMap<String, Object> body = new LinkedMultiValueMap<String, Object>();
        if (ci != null && !ci.equals("")) 
        	body.add("ci", ci);
        if (id != null && !id.equals(""))
        	body.add("id", id);
        if (name != null && !name.equals(""))
        	body.add("name", name);
        if (pwd != null && !pwd.equals(""))
        	body.add("pwd", pwd);
        if (gender != null && !gender.equals(""))
        	body.add("gender", gender);
        if (birth != null && !birth.equals(""))
        	body.add("birth", birth);
        if (email != null && !email.equals(""))
        	body.add("email", email);
        if (phone != null && !phone.equals(""))
        	body.add("phone", phone);
        if (cellPhone != null && !cellPhone.equals(""))
        	body.add("cellPhone", cellPhone);
        if (zipCode != null && !zipCode.equals(""))
        	body.add("zipCode", zipCode);
        if (address != null && !address.equals(""))
        	body.add("address", address);
        if (addressDetail != null && !addressDetail.equals(""))
        	body.add("addressDetail", addressDetail);
        if (marketingAgreementFlag != null && !marketingAgreementFlag.equals(""))
        	body.add("marketingAgreementFlag", marketingAgreementFlag);
        if (ip != null && !ip.equals(""))
        	body.add("ip", ip);

        HashMap responseBody = this.requestSsoApi("/join", body);

        if (!"R0000".equals(responseBody.get("code"))) {
        	throw new SsoException((String)responseBody.get("code"));
        }

        List<HashMap> datas = (List) responseBody.get("datas");

        return datas.size() == 0 ? null : datas.get(0);
    }

    /**
     * SSO 통합 로그인
     *  : /api/member/login
     * @param id
     * @param pwd
     * @param ip
     * @return
     * @throws Exception
     */
    public HashMap login(String id, String pwd, String ip) throws Exception, SsoException
    {
        MultiValueMap<String, Object> body = new LinkedMultiValueMap<String, Object>();
        if (id != null && !id.equals(""))
        	body.add("id", id);
        if (pwd != null && !pwd.equals(""))
        	body.add("pwd", pwd);
        if (ip != null && !ip.equals(""))
        	body.add("ip", ip);

        HashMap responseBody = this.requestSsoApi("/login", body);

        if (!"R0000".equals(responseBody.get("code"))) {
        	throw new SsoException((String)responseBody.get("code"));
        }

        List<HashMap> datas = (List) responseBody.get("datas");

        return datas.size() == 0 ? null : datas.get(0);
    }

    /**
     * SSO 회원정보 업데이트
     *  : /api/member/update
     * @param id
     * @param ci
     * @param ip
     * @param name
     * @param email
     * @param phone
     * @param cellPhone
     * @param zipCode
     * @param address
     * @param addressDetail
     * @param marketingAgreeementFlag
     * @return HashMap
     * @throws Exception, SsoException
     */
    public HashMap update(String id, String ci, String ip, String name, String email, String phone, String cellPhone, String zipCode, String address, String addressDetail, String marketingAgreementFlag) throws Exception, SsoException
    {
        MultiValueMap<String, Object> body = new LinkedMultiValueMap<String, Object>();
        if (id != null && !id.equals("")) 
        	body.add("id", id);
        if (ci != null && !ci.equals(""))
        	body.add("ci", ci);
        if (ip != null && !ip.equals(""))
        	body.add("ip", ip);
        if (name != null && !name.equals(""))
        	body.add("name", name);
        if (email != null && !email.equals(""))
        	body.add("email", email);
        if (phone != null && !phone.equals(""))
        	body.add("phone", phone);
        if (cellPhone != null && !cellPhone.equals(""))
        	body.add("cellPhone", cellPhone);
        if (zipCode != null && !zipCode.equals(""))
        	body.add("zipCode", zipCode);
        if (address != null && !address.equals(""))
        	body.add("address", address);
        if (addressDetail != null && !addressDetail.equals(""))
        	body.add("addressDetail", addressDetail);
        if (marketingAgreementFlag != null && !marketingAgreementFlag.equals(""))
        	body.add("marketingAgreementFlag", marketingAgreementFlag);

        HashMap responseBody = this.requestSsoApi("/update", body);

        if (!"R0000".equals(responseBody.get("code"))) {
        	throw new SsoException((String)responseBody.get("code"));
        }

        List<HashMap> datas = (List)responseBody.get("datas");
        return datas.size() == 0 ? null : datas.get(0);
    }

    /**
     * 회원 탈퇴
     *  : /api/member/drop
     * @param id
     * @param uid
     * @param ip
     * @return
     * @throws Exception
     */
    public List<HashMap> drop(String id, String uid, String ip) throws Exception, SsoException
    {
        MultiValueMap<String, Object> body = new LinkedMultiValueMap<String, Object>();
        if (id != null && !id.equals("")) 
        	body.add("id", id);
        if (uid != null && !uid.equals("")) 
        	body.add("uid", uid);
        if (ip != null && !ip.equals("")) 
        	body.add("ip", ip);

        HashMap responseBody = this.requestSsoApi("/drop", body);

        if (!"R0000".equals(responseBody.get("code"))) {
        	throw new SsoException((String)responseBody.get("code"));
        }

        List<HashMap> datas = (List) responseBody.get("datas");
        return datas.size() == 0 ? null : datas;
    }

    /**
     * SSO 통합 회원 정보 조회
     *  : /api/member/find
     * @param id
     * @param uid
     * @param ci
     * @param ip
     * @return
     * @throws Exception
     * @throws SsoException
     */
    public HashMap find(String id, String uid, String ci, String ip) throws Exception, SsoException
    {
        MultiValueMap<String, Object> body = new LinkedMultiValueMap<String, Object>();
        if (id != null && !id.equals(""))
        	body.add("id", id);
        if (uid != null && !uid.equals(""))
        	body.add("uid", uid);
        if (ci != null && !ci.equals("")) 
        	body.add("ci", ci);
        if (ip != null && !ip.equals(""))
        	body.add("ip", ip);

        HashMap responseBody = this.requestSsoApi("/find", body);

        if (!"R0000".equals(responseBody.get("code"))) {
        	throw new SsoException((String)responseBody.get("code"));
        }

        List<HashMap> datas = (List) responseBody.get("datas");

        return datas.size() == 0 ? null : datas.get(0);
    }

    /**
     * SSO 탈퇴 회원 조회
     *  : /api/member/find/drop
     * @param id
     * @param ci
     * @param uid
     * @param ip
     * @return
     * @throws Exception
     */
    public List<HashMap> findDrop(String id, String uid, String ci, String ip) throws Exception, SsoException
    {
        MultiValueMap<String, Object> body = new LinkedMultiValueMap<String, Object>();
        if (id != null && !id.equals(""))
        	body.add("id", id);
        if (uid != null && !uid.equals(""))
        	body.add("uid", uid);
        if (ci != null && !ci.equals("")) 
        	body.add("ci", ci);
        if (ip != null && !ip.equals(""))
        	body.add("ip", ip);

        HashMap responseBody = this.requestSsoApi("/find/drop", body);

        if (!"R0000".equals(responseBody.get("code"))) {
        	throw new SsoException((String)responseBody.get("code"));
        }

        List<HashMap> datas = (List) responseBody.get("datas");
        return datas.size() == 0 ? null : datas;
    }


    /**
     * SSO 비밀번호 업데이트
     *  : /api/member/update/password
     * @param id
     * @param ci
     * @param uid
     * @param oldPwd
     * @param newPwd
     * @param ip
     * @return
     * @throws Exception
     */
    public List<HashMap> updatePassword(String id, String ci, String uid, String oldPwd, String newPwd, String ip) throws Exception, SsoException
    {
        MultiValueMap<String, Object> body = new LinkedMultiValueMap<String, Object>();
        if (id != null && !id.equals(""))
        	body.add("id", id);
        if (ci != null && !ci.equals(""))
        	body.add("ci", ci);
        if (uid != null && !uid.equals(""))
        	body.add("uid", uid);
        if (oldPwd != null && !oldPwd.equals("")) 
        	body.add("oldPwd", oldPwd);
        if (newPwd != null && !newPwd.equals("")) 
        	body.add("newPwd", newPwd);
        if (ip != null && !ip.equals(""))
        	body.add("ip", ip);

        HashMap responseBody = this.requestSsoApi("/update/password", body);

        if (!"R0000".equals(responseBody.get("code"))) {
        	throw new SsoException((String)responseBody.get("code"));
        }

        List<HashMap> datas = (List) responseBody.get("datas");
        return datas.size() == 0 ? null : datas;
    }

    /**
     * SSO 토큰 유효성 검사
     *  : /api/member/validateToken
     * @param token
     * @param ip
     * @return
     * @throws Exception
     */
    public HashMap validateToken(String token, String ip) throws Exception, SsoException
    {
        MultiValueMap<String, Object> body = new LinkedMultiValueMap<String, Object>();
        if (token != null && !token.equals(""))
        	body.add("token", token);
        if (ip != null && !ip.equals(""))
        	body.add("ip", ip);

        HashMap responseBody = this.requestSsoApi("/validateToken", body);

        if (!"R0000".equals(responseBody.get("code"))) {
        	throw new SsoException((String)responseBody.get("code"));
        }

        List<HashMap> datas = (List) responseBody.get("datas");

        return datas.size() == 0 ? null : datas.get(0);
    }

}
