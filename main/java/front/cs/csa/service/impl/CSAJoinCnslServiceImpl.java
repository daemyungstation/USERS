package front.cs.csa.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.hamcrest.core.Is;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.MailService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.com.utl.sim.service.EgovNetworkState;
import egovframework.com.utl.sim.service.SeedCipher;
import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.cs.csa.service.CSAJoinCnslService;
import front.cs.csa.service.dao.CSAJoinCnslDAO;

/**
 * <pre> 
 * 가임상담 신청을 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: CSAJoinCnslServiceImpl.java
 * @Description		: 가임상담 신청을 위한 ServiceImpl
 * @author 허진영
 * @since 2016.03.03
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.03		   허진영				  최초 생성
 * </pre>
 */ 
@Service("cSAJoinCnslService")
public class CSAJoinCnslServiceImpl extends EmfAbstractService implements CSAJoinCnslService {	
	
	@Resource(name="cSAJoinCnslDAO")
	private CSAJoinCnslDAO cSAJoinCnslDAO;
	
	@Resource(name="mailService")
	private MailService mailService;
	
	@Resource(name="joinCnslIdgen")
	private EgovTableIdGnrService joinCnslIdgen;
	
	private String ENCODE = EgovProperties.getProperty("Global.CHARCODE");
	
	/**
	 * 가임상담 신청을 등록한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertJoinCnsl(EmfMap emfMap, HttpServletRequest request) throws Exception
	{
		//보안문자 체크
		String captcha = EMFStringUtil.nullConvert(request.getSession().getAttribute("CurrentAnswer"));
		
		if(!captcha.equals(EMFStringUtil.nullConvert(emfMap.get("captchaText")))) 
		{
			throw new Exception("보안문자오류");
		}
		
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("joinCnslSeq", joinCnslIdgen.getNextIntegerId());
		
		if(lgnMap != null)
		{
			emfMap.put("lgnYn", "Y");
			emfMap.put("regId", lgnMap.getString("id"));
			emfMap.put("regIp", lgnMap.getString("loginIp"));
			emfMap.put("modId", lgnMap.getString("id"));
			emfMap.put("modIp", lgnMap.getString("loginIp"));
		}
		else
		{
			emfMap.put("lgnYn", "N");
			emfMap.put("regIp", EgovNetworkState.getMyIPaddress(request));
			emfMap.put("modIp", EgovNetworkState.getMyIPaddress(request));
			
			if(null == emfMap.get("email")){
				emfMap.put("email", emfMap.getString("address"));
			}
			//2017.04.25 박주석 디아모 적용
//			if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("ctel"))))
//			{
//				emfMap.put("ctel", SeedCipher.encrypt(emfMap.getString("ctel"), ENCODE));
//			}
//			
//			if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("email"))))
//			{
//				emfMap.put("email", SeedCipher.encrypt(emfMap.getString("email"), ENCODE));
//			}
		}
		
		//통화가능일 setting
		emfMap.put("telAbleDt", emfMap.getString("telAbleDt").replaceAll("-", ""));
		
		cSAJoinCnslDAO.insertJoinCnsl(emfMap);
		
		//메일발송을 위해 사용자정보를 가져온다.
		EmfMap prsnCnslInfo = cSAJoinCnslDAO.selectJoinCnsl(emfMap);
		
		if(!"".equals(EMFStringUtil.nullConvert(prsnCnslInfo.get("email"))))
		{
			EmfMap mailMap = new EmfMap();
			
			mailMap.put("subject", "[대명라이프웨이 가입 상담 신청 완료] 메일입니다.");
			//2017.04.25 박주석 디아모 적용
			mailMap.put("toUser", prsnCnslInfo.getString("email") );
//			mailMap.put("toUser", SeedCipher.decrypt(prsnCnslInfo.getString("email"), ENCODE));
			mailMap.put("inqryNm", prsnCnslInfo.getString("inqryNm"));
			mailMap.put("name", prsnCnslInfo.getString("name"));
			mailMap.put("telAbleDt", EgovDateUtil.convertDate(prsnCnslInfo.getString("telAbleDt"), "yyyyMMdd", "yyyy.MM.dd", ""));
			mailMap.put("telAbleStrtTime", EgovDateUtil.convertDate(prsnCnslInfo.getString("telAbleStrtTime"), "HHmm", "HH:mm", ""));
			mailMap.put("telAbleEndTime", EgovDateUtil.convertDate(prsnCnslInfo.getString("telAbleEndTime"), "HHmm", "HH:mm", ""));
			mailMap.put("titl", prsnCnslInfo.getString("titl"));
			mailMap.put("cntn", prsnCnslInfo.getString("cntn").replace(System.getProperty("line.separator"), "<br />"));
			
			mailService.sendTempleteMail(mailMap, "cs/csa/CSAJoinCnslComp.html");
		}
		
		//메일발송을 위해 관리자정보를 가져온다.
		List<EmfMap> admList = cSAJoinCnslDAO.selectJoinCnslAdmList(emfMap);
		
		if(admList.size() > 0)
		{
			EmfMap admMailMap = new EmfMap();
			
			admMailMap.put("subject", "[대명아임레디 관리자 가입 상담 신청 안내] 메일입니다.");
			admMailMap.put("inqryNm", prsnCnslInfo.getString("inqryNm"));
			admMailMap.put("telAbleDt", EgovDateUtil.convertDate(prsnCnslInfo.getString("telAbleDt"), "yyyyMMdd", "yyyy.MM.dd", ""));
			admMailMap.put("telAbleStrtTime", EgovDateUtil.convertDate(prsnCnslInfo.getString("telAbleStrtTime"), "HHmm", "HH:mm", ""));
			admMailMap.put("telAbleEndTime", EgovDateUtil.convertDate(prsnCnslInfo.getString("telAbleEndTime"), "HHmm", "HH:mm", ""));
			admMailMap.put("titl", prsnCnslInfo.getString("titl"));
			admMailMap.put("cntn", prsnCnslInfo.getString("cntn").replace(System.getProperty("line.separator"), "<br />"));
			
			for(int i = 0; i < admList.size(); i++)
			{
				//2017.04.25 박주석 디아모 적용
				admMailMap.put("toUser", admList.get(i).getString("email") );
//				admMailMap.put("toUser", SeedCipher.decrypt(admList.get(i).getString("email"), ENCODE));
				admMailMap.put("name", admList.get(i).getString("name"));
				
				mailService.sendTempleteMail(admMailMap, "cs/csa/CSAJoinCnslAdmin.html");
			}
		}
	}
	
	public void insertJoinEventCnsl(EmfMap emfMap, HttpServletRequest request) throws Exception
	{
		//보안문자 체크
		String captcha = EMFStringUtil.nullConvert(request.getSession().getAttribute("CurrentAnswer"));
		
		if(!captcha.equals(EMFStringUtil.nullConvert(emfMap.get("captchaText")))) 
		{
			throw new Exception("보안문자오류");
		}
		
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("joinCnslSeq", joinCnslIdgen.getNextIntegerId());
		
		if(lgnMap != null)
		{
			emfMap.put("lgnYn", "Y");
			emfMap.put("regId", lgnMap.getString("id"));
			emfMap.put("regIp", lgnMap.getString("loginIp"));
			emfMap.put("modId", lgnMap.getString("id"));
			emfMap.put("modIp", lgnMap.getString("loginIp"));
		}
		else
		{
			emfMap.put("lgnYn", "N");
			emfMap.put("regIp", EgovNetworkState.getMyIPaddress(request));
			emfMap.put("modIp", EgovNetworkState.getMyIPaddress(request));
			
			//2017.04.25 박주석 디아모 적용
//			if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("ctel"))))
//			{
//				emfMap.put("ctel", SeedCipher.encrypt(emfMap.getString("ctel"), ENCODE));
//			}
//			
//			if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("email"))))
//			{
//				emfMap.put("email", SeedCipher.encrypt(emfMap.getString("email"), ENCODE));
//			}
		}
		
		//통화가능일 setting
		emfMap.put("telAbleDt", emfMap.getString("telAbleDt").replaceAll("-", ""));

		if(!("".equals(emfMap.getString("address")))){
			emfMap.put("email", emfMap.getString("address"));
		}
		
		cSAJoinCnslDAO.insertJoinCnsl(emfMap);

	}
}
