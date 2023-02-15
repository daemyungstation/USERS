package front.ml.mla.web;

import java.security.Key;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;
import front.lp.service.dao.DmLifeDAO;

/**
 * <pre> 
 * 회원증서  팝업 Controller
 * </pre>
 * 
 * @ClassName		: MLAJoinPtcBucketController.java
 * @Description		: 회원증서  팝업 Controller
 * @author 장준일
 * @since 2021.03.08
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2021.03.08		   장준일				  최초 생성
 * </pre>
 */ 
@Controller
@RequestMapping("/bucketmarket")
public class MLAJoinPtcBucketController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="dMLifeDAO")
	private DmLifeDAO dMLifeDAO;
		
	/**
	 * 가입증서를 출력한다.
	 * 
     * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/printCert.do")
	public String selectJoinCert(EmfMap emfMap, ModelMap modelMap) throws Exception
	{
		try
		{
			//복호화 시작
			String encAccntNo = emfMap.getString("no");
			String _ivKey = "imready___bucket";
			Key keySpecDec;
			byte[] keyBytes = new byte[16];
			byte[] b = _ivKey.getBytes("UTF-8");
			int len = b.length;

			if (len > keyBytes.length) {
				len = keyBytes.length;
			}
			System.arraycopy(b, 0, keyBytes, 0, len);
			keySpecDec = new SecretKeySpec(keyBytes, "AES");
			
			Cipher cipherDec = Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipherDec.init(Cipher.DECRYPT_MODE, keySpecDec, new IvParameterSpec(_ivKey.getBytes("UTF-8")));
			
			byte[] decBuf = null;
			if (encAccntNo != null && encAccntNo.length() != 0) {
				decBuf = new byte[encAccntNo.length() / 2];
				for (int i = 0; i < decBuf.length; i++) {
					decBuf[i] = (byte) Integer.parseInt(encAccntNo.substring(2 * i, 2 * i + 2), 16);
				}
			}
			String decAccntNo = null;
			decAccntNo = new String(cipherDec.doFinal(decBuf));
			
			
			emfMap.put("accntNo", decAccntNo);
			EmfMap joinCertMap = dMLifeDAO.selectJoinCertAccntNo(emfMap);
			
			emfMap.put("prdctCd", joinCertMap.getString("prodCd"));
			emfMap.put("joinDt", joinCertMap.getString("joinDt"));
			EmfMap prdctDescMap = dMLifeDAO.selectPrdctDesc(emfMap);
			
			// 상품 해약환급금 및 환금율
			emfMap.put("recordCountPerPage", 32);
			
			emfMap.put("firstIndex", 0);
			List<EmfMap> resnstdInfoMap1 = dMLifeDAO.selectResnstdInfo(emfMap);	// 1~32
			
			emfMap.put("firstIndex", 32);
			List<EmfMap> resnstdInfoMap2 = dMLifeDAO.selectResnstdInfo(emfMap);	// 33~64
			
			emfMap.put("firstIndex", 64);
			List<EmfMap> resnstdInfoMap3 = dMLifeDAO.selectResnstdInfo(emfMap);	// 65~96
			
			emfMap.put("firstIndex", 96);
			List<EmfMap> resnstdInfoMap4 = dMLifeDAO.selectResnstdInfo(emfMap);	// 97~128
			
			emfMap.put("firstIndex", 128);
			List<EmfMap> resnstdInfoMap5 = dMLifeDAO.selectResnstdInfo(emfMap);	// 129~160
			
			emfMap.put("firstIndex", 160);
			List<EmfMap> resnstdInfoMap6 = dMLifeDAO.selectResnstdInfo(emfMap);	// 161~192
			
			emfMap.put("firstIndex", 192);
			List<EmfMap> resnstdInfoMap7 = dMLifeDAO.selectResnstdInfo(emfMap);	// 193~224
			
			emfMap.put("firstIndex", 224);
			List<EmfMap> resnstdInfoMap8 = dMLifeDAO.selectResnstdInfo(emfMap);	// 225~257		
			
			EmfMap rtnMap = new EmfMap();
			rtnMap.put("joinCert", joinCertMap);
			rtnMap.put("prdctDesc", prdctDescMap);
			rtnMap.put("resnstdInfoMap1", resnstdInfoMap1);
			rtnMap.put("resnstdInfoMap2", resnstdInfoMap2);
			rtnMap.put("resnstdInfoMap3", resnstdInfoMap3);
			rtnMap.put("resnstdInfoMap4", resnstdInfoMap4);
			rtnMap.put("resnstdInfoMap5", resnstdInfoMap5);
			rtnMap.put("resnstdInfoMap6", resnstdInfoMap6);
			rtnMap.put("resnstdInfoMap7", resnstdInfoMap7);
			rtnMap.put("resnstdInfoMap8", resnstdInfoMap8);
			
			Calendar cal = Calendar.getInstance();

			rtnMap.put("year", cal.get(cal.YEAR));
			rtnMap.put("month", cal.get(cal.MONTH));
			rtnMap.put("day", cal.get(cal.DATE));
			
			modelMap.addAttribute("rtnMap", rtnMap);
		}
		catch (Exception he) 
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		} 
		
		return "front/ml/mla/printCert.pop";
	}		
}
