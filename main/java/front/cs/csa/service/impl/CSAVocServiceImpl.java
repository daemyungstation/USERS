package front.cs.csa.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.MailService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.cs.csa.service.CSAVocService;
import front.cs.csa.service.dao.CSAVocDAO;

/**
 * <pre> 
 * VOC ServiceImpl
 * </pre>
 * 
 * @ClassName		: CSAVocServiceImpl.java
 * @Description		: VOC ServiceImpl
 * @author 장준일
 * @since 2021.02.23
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2021.02.23		   장준일				  최초 생성
 * </pre>
 */ 
@Service("cSAVocService")
public class CSAVocServiceImpl extends EmfAbstractService implements CSAVocService {	
	
	@Resource(name="cSAVocDAO")
	private CSAVocDAO cSAVocDAO;
	
	/**
	 * VOC를 등록한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertVoc(EmfMap emfMap) throws Exception
	{
		//max PK 가져오기
		String vocNo = (String) cSAVocDAO.selectMaxVoc();
		Date nowDate = new Date();
        SimpleDateFormat nowfDate = new SimpleDateFormat("yyyyMMdd");
        String vocNoDate = nowfDate.format(nowDate);
        
		if(vocNo == null || "".equals(vocNo)) {
			vocNo = vocNoDate + "00001";
		}else {
			String vocNoPre = vocNo.substring(0, 8);
			String vocNoNum = vocNo.substring(8, 13);
			
			if(vocNoDate.equals(vocNoPre)) {
				int vocNoNumNew = Integer.parseInt(vocNoNum);
				vocNoNumNew++;
				String vocNoNumStr = Integer.toString(vocNoNumNew);
				int ii = 5 - vocNoNumStr.length();
				for(int i = 0; i < ii; i++) {
					vocNoNumStr = "0"+ vocNoNumStr;
				}
				vocNo = vocNoPre + vocNoNumStr;
			}else {
				vocNo = vocNoDate + "00001";
			}
		}
		emfMap.put("vocNo", vocNo);

		String moblType = emfMap.getString("moblType");
		if("mobile".equals(moblType)) {
			if(!"".equals(emfMap.getString("moblNo1")) && !"".equals(emfMap.getString("moblNo2")) && !"".equals(emfMap.getString("moblNo3"))) {
				emfMap.put("moblNo", emfMap.getString("moblNo1")+emfMap.getString("moblNo2")+emfMap.getString("moblNo3"));
			}
		}
		if("home".equals(moblType)) {
			if(!"".equals(emfMap.getString("homeNo1")) && !"".equals(emfMap.getString("moblNo2")) && !"".equals(emfMap.getString("moblNo3"))) {
				emfMap.put("moblNo", emfMap.getString("homeNo1") + emfMap.getString("moblNo2") + emfMap.getString("moblNo3"));
			}
		}
		if(!"".equals(emfMap.getString("emailAddr1")) && !"".equals(emfMap.getString("emailAddr2"))) {
			emfMap.put("emailAddr", emfMap.getString("emailAddr1") +"@"+ emfMap.getString("emailAddr2"));
		}
		
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		emfMap.put("id", lgnMap.getString("id"));
		emfMap.put("regId", lgnMap.getString("id"));
		emfMap.put("regIp", lgnMap.getString("loginIp"));
			
		cSAVocDAO.insertVoc(emfMap);
		
	}
	
}
