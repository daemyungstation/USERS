package front.cs.csa.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.MailService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.SeedCipher;
import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.cs.csa.service.CSACustVoiceService;
import front.cs.csa.service.dao.CSACustVoiceDAO;

/**
 * <pre> 
 * 고객의 소리를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: CSACustVoiceServiceImpl.java
 * @Description		: 고객의 소리를 위한 ServiceImpl
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
@Service("cSACustVoiceService")
public class CSACustVoiceServiceImpl extends EmfAbstractService implements CSACustVoiceService {	
	
	@Resource(name="cSACustVoiceDAO")
	private CSACustVoiceDAO cSACustVoiceDAO;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;
	
	@Resource(name="mailService")
	private MailService mailService;
	
	@Resource(name="custVoiceIdgen")
	private EgovTableIdGnrService custVoiceIdgen;
	
	private String ENCODE = EgovProperties.getProperty("Global.CHARCODE");
	
	/**
	 * 고객의 소리를 등록한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertCustVoice(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("custVoiceSeq", custVoiceIdgen.getNextIntegerId());
		emfMap.put("id", lgnMap.getString("id"));
		emfMap.put("regId", lgnMap.getString("id"));
		emfMap.put("regIp", lgnMap.getString("loginIp"));
		emfMap.put("modId", lgnMap.getString("id"));
		emfMap.put("modIp", lgnMap.getString("loginIp"));
			
		cSACustVoiceDAO.insertCustVoice(emfMap);
		
		//메일발송을 위해 사용자정보를 가져온다.
		EmfMap CustVoiceInfo = cSACustVoiceDAO.selectCustVoice(emfMap);
		
		if(!"".equals(EMFStringUtil.nullConvert(CustVoiceInfo.get("email"))))
		{
			EmfMap mailMap = new EmfMap();
			
			mailMap.put("subject", "[대명아임레디 고객의 소리 신청 완료] 메일입니다.");
			//2017.04.25 박주석 디아모 적용
			mailMap.put("toUser", CustVoiceInfo.getString("email") );
//			mailMap.put("toUser", SeedCipher.decrypt(CustVoiceInfo.getString("email"), ENCODE));
			mailMap.put("inqryNm", CustVoiceInfo.getString("inqryNm"));
			mailMap.put("inqryDtlNm", CustVoiceInfo.getString("inqryDtlNm"));
			mailMap.put("name", CustVoiceInfo.getString("name"));
			mailMap.put("titl", CustVoiceInfo.getString("titl"));
			mailMap.put("cntn", CustVoiceInfo.getString("cntn").replace(System.getProperty("line.separator"), "<br />"));
			
			mailService.sendTempleteMail(mailMap, "cs/csa/CSACustVoiceComp.html");
		}
		
		//메일발송을 위해 관리자정보를 가져온다.
		List<EmfMap> admList = cSACustVoiceDAO.selectCustVoiceAdmList(emfMap);
		
		if(admList.size() > 0)
		{
			EmfMap admMailMap = new EmfMap();
			
			admMailMap.put("subject", "[대명아임레디 관리자 고객의 소리 신청 안내] 메일입니다.");
			admMailMap.put("inqryNm", CustVoiceInfo.getString("inqryNm"));
			admMailMap.put("inqryDtlNm", CustVoiceInfo.getString("inqryDtlNm"));
			admMailMap.put("titl", CustVoiceInfo.getString("titl"));
			admMailMap.put("cntn", CustVoiceInfo.getString("cntn").replace(System.getProperty("line.separator"), "<br />"));
			
			for(int i = 0; i < admList.size(); i++)
			{
				//2017.04.25 박주석 디아모 적용
				admMailMap.put("toUser", admList.get(i).getString("email") );
//				admMailMap.put("toUser", SeedCipher.decrypt(admList.get(i).getString("email"), ENCODE));
				admMailMap.put("name", admList.get(i).getString("name"));
				
				mailService.sendTempleteMail(admMailMap, "cs/csa/CSACustVoiceAdmin.html");
			}
		}
	}
	
	/**
     *  고객의 소리 문의구분 상세를 조회한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public List<EmfMap> selectPrsnInqryDtlList(EmfMap emfMap) throws Exception
	{
		emfMap.put("highrCd", "CUST_VOICE_GB");
		emfMap.put("lowrCd", "CUST_VOICE_DTL_GB");
		
		return cmmUseService.selectCmmLinkCode(emfMap);
	}
}
