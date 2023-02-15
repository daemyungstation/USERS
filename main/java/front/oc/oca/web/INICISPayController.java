package front.oc.oca.web;

/**
 * 
 */

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.codec.binary.Base64;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * @FileName INICISPay.java
 */
public class INICISPayController {
	private static byte[] merchantKey;
	private static SecretKeySpec keyspec;
	private static Cipher cipher;

	private static String inicisKey = "";
	private static String inicisiv = "";

	private SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss", Locale.KOREA);
	private ObjectMapper objMapper = new ObjectMapper();

	private static Map<String, String> inicisRequestData;
	private static Map<String, String> inicisResponseData;

	public INICISPayController() {
		inicisRequestData = new HashMap<String, String>();
		inicisResponseData = new HashMap<String, String>();
	}

	public void setData(String key, String value) {
		inicisRequestData.put(key, value);
	}

	public String getData(String key) {
		return inicisResponseData.get(key);
	}

	public static String getInicisKey() {
		return inicisKey;
	}

	public void setInicisKey(String inicisKey) {
		INICISPayController.inicisKey = inicisKey;
	}

	public static String getInicisiv() {
		return inicisiv;
	}

	public void setInicisiv(String inicisiv) {
		INICISPayController.inicisiv = inicisiv;
	}

	// 빌키발급
	// hash(key + type + paymethod + timestamp + clientIP + mid + moid + price +
	// cardNumber)
	@SuppressWarnings("unchecked")
	public void authBillkey() throws Exception {
		String url = "https://iniapi.inicis.com/api/v1/billing";

		inicisRequestData.put("type", "Auth");
		inicisRequestData.put("paymethod", "Card");
		inicisRequestData.put("price", "1004");
		inicisRequestData.put("timestamp", simpleDateFormat.format(new Date()));
		inicisRequestData.put("cardNumber", encrypt_AES(inicisRequestData.get("cardNumber")));
		inicisRequestData.put("cardExpire", encrypt_AES(inicisRequestData.get("cardExpire")));
		inicisRequestData.put("regNo", encrypt_AES(inicisRequestData.get("regNo")));

		String plainHashData = getInicisKey() + inicisRequestData.get("type") + inicisRequestData.get("paymethod")
				+ inicisRequestData.get("timestamp") + inicisRequestData.get("clientIp") + inicisRequestData.get("mid")
				+ inicisRequestData.get("moid") + inicisRequestData.get("price") + inicisRequestData.get("cardNumber");
		inicisRequestData.put("hashData", encryptSHA512(plainHashData));
		try {
			String res = requestHttp(url, inicisRequestData);
			inicisResponseData = objMapper.readValue(res, Map.class);
		} catch (Exception e) {
			inicisResponseData.put("resultCode", "01");
			inicisResponseData.put("resultMsg", "실패하였습니다. " + e);
		}
	}

	// 빌링승인
	// hash(key + type + paymethod + timestamp + clientIP + mid + moid + price +
	// billKey)
	@SuppressWarnings("unchecked")
	public void authBilling() throws Exception {
		String url = "https://iniapi.inicis.com/api/v1/billing";

		inicisRequestData.put("type", "Billing");
		inicisRequestData.put("paymethod", "Card");
		inicisRequestData.put("timestamp", simpleDateFormat.format(new Date()));
		inicisRequestData.put("authentification", "00");

		String plainHashData = getInicisKey() + inicisRequestData.get("type") + inicisRequestData.get("paymethod")
				+ inicisRequestData.get("timestamp") + inicisRequestData.get("clientIp") + inicisRequestData.get("mid")
				+ inicisRequestData.get("moid") + inicisRequestData.get("price") + inicisRequestData.get("billKey");
		inicisRequestData.put("hashData", encryptSHA512(plainHashData));

		try {
			String res = requestHttp(url, inicisRequestData);
			inicisResponseData = objMapper.readValue(res, Map.class);
		} catch (Exception e) {
			inicisResponseData.put("resultCode", "01");
			inicisResponseData.put("resultMsg", "실패하였습니다. " + e);
		}
	}

	// 가상계좌 채번
	@SuppressWarnings("unchecked")
	public void formVacct() throws Exception {
		String url = "https://iniapi.inicis.com/api/v1/formpay";

		inicisRequestData.put("type", "Pay");
		inicisRequestData.put("paymethod", "Vacct");
		inicisRequestData.put("timestamp", simpleDateFormat.format(new Date()));

		String plainHashData = getInicisKey() + inicisRequestData.get("type") + inicisRequestData.get("paymethod")
				+ inicisRequestData.get("timestamp") + inicisRequestData.get("clientIp") + inicisRequestData.get("mid")
				+ inicisRequestData.get("moid") + inicisRequestData.get("price");
		inicisRequestData.put("hashData", encryptSHA512(plainHashData));

		try {
			String res = requestHttp(url, inicisRequestData);
			inicisResponseData = objMapper.readValue(res, Map.class);
		} catch (Exception e) {
			inicisResponseData.put("resultCode", "01");
			inicisResponseData.put("resultMsg", "실패하였습니다. " + e);
		}
	}

	// 취소
	@SuppressWarnings("unchecked")
	public void cancel() throws Exception {
		String url = "https://iniapi.inicis.com/api/v1/refund";

		inicisRequestData.put("type", "Refund");
		inicisRequestData.put("paymethod", "Card");
		inicisRequestData.put("timestamp", simpleDateFormat.format(new Date()));

		String plainHashData = getInicisKey() + inicisRequestData.get("type") + inicisRequestData.get("paymethod")
				+ inicisRequestData.get("timestamp") + inicisRequestData.get("clientIp") + inicisRequestData.get("mid")
				+ inicisRequestData.get("tid");
		inicisRequestData.put("hashData", encryptSHA512(plainHashData));

		try {
			String res = requestHttp(url, inicisRequestData);
			inicisResponseData = objMapper.readValue(res, Map.class);
		} catch (Exception e) {
			inicisResponseData.put("resultCode", "01");
			inicisResponseData.put("resultMsg", "실패하였습니다. " + e);
		}
	}


	// 가상계좌 채번취소
	@SuppressWarnings("unchecked")
	public void vacctCancel() throws Exception {
		String url = "https://iniapi.inicis.com/api/v1/refund";

		inicisRequestData.put("type", "Refund");
		inicisRequestData.put("paymethod", "GVacct");
		inicisRequestData.put("timestamp", simpleDateFormat.format(new Date()));

		String plainHashData = getInicisKey() + inicisRequestData.get("type") + inicisRequestData.get("paymethod")
				+ inicisRequestData.get("timestamp") + inicisRequestData.get("clientIp") + inicisRequestData.get("mid")
				+ inicisRequestData.get("tid");
		inicisRequestData.put("hashData", encryptSHA512(plainHashData));

		try {
			String res = requestHttp(url, inicisRequestData);
			inicisResponseData = objMapper.readValue(res, Map.class);
		} catch (Exception e) {
			inicisResponseData.put("resultCode", "01");
			inicisResponseData.put("resultMsg", "실패하였습니다. " + e);
		}
	}

	// 가상계좌 환불
	// Key + type + paymethod + timestamp + clientIp + mid + tid + refundAcctNum
	@SuppressWarnings("unchecked")
	public void refundVacct() throws Exception {
		String url = "https://iniapi.inicis.com/api/v1/refund";

		inicisRequestData.put("type", "Refund");
		inicisRequestData.put("paymethod", "Vacct");
		inicisRequestData.put("timestamp", simpleDateFormat.format(new Date()));
		inicisRequestData.put("refundAcctNum", encrypt_AES(inicisRequestData.get("refundAcctNum")));

		String plainHashData = getInicisKey() + inicisRequestData.get("type") + inicisRequestData.get("paymethod")
				+ inicisRequestData.get("timestamp") + inicisRequestData.get("clientIp") + inicisRequestData.get("mid")
				+ inicisRequestData.get("tid") + inicisRequestData.get("refundAcctNum");
		inicisRequestData.put("hashData", encryptSHA512(plainHashData));

		try {
			String res = requestHttp(url, inicisRequestData);
			inicisResponseData = objMapper.readValue(res, Map.class);
		} catch (Exception e) {
			inicisResponseData.put("resultCode", "01");
			inicisResponseData.put("resultMsg", "실패하였습니다. " + e);
		}
	}

	// 통신
	public static String requestHttp(String url, Map<String, String> params) throws Exception {
		HttpPost post = new HttpPost(url);
		// add request parameter, form parameters
		List<NameValuePair> urlParameters = new ArrayList<NameValuePair>(params.size());
		for (Map.Entry<String, String> entry : params.entrySet()) {
			urlParameters.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		post.setEntity(new UrlEncodedFormEntity(urlParameters, "UTF-8"));
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
		return res;
	}

	public static String encrypt_AES(String plainText) throws Exception {
		merchantKey = getInicisKey().getBytes();
		keyspec = new SecretKeySpec(merchantKey, "AES");

		cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		cipher.init(Cipher.ENCRYPT_MODE, keyspec, new IvParameterSpec(getInicisiv().getBytes()));

		byte[] encrypted = cipher.doFinal(plainText.getBytes("UTF-8"));
		String enStr = new String(Base64.encodeBase64String(encrypted));

		return enStr;
	}

	public static String encryptSHA512(String input) throws Exception {
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		md.update(input.getBytes("UTF-8"));
		return byteArrayToHex(md.digest());
	}

	public static String byteArrayToHex(byte[] ba) {
		if (ba == null || ba.length == 0) {
			return null;
		}

		StringBuffer sb = new StringBuffer(ba.length * 2);
		String hexNumber;

		for (int x = 0; x < ba.length; x++) {
			hexNumber = "0" + Integer.toHexString(0xff & ba[x]);
			sb.append(hexNumber.substring(hexNumber.length() - 2));
		}

		return sb.toString();
	}
}