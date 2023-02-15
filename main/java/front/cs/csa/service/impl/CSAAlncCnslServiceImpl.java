package front.cs.csa.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.MailService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovNetworkState;
import egovframework.com.utl.sim.service.SeedCipher;
import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.cs.csa.service.CSAAlncCnslService;
import front.cs.csa.service.dao.CSAAlncCnslDAO;

/**
 * <pre> 
 * 제휴 문의를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: CSAAlncServiceImpl.java
 * @Description		: 제휴 문의를 위한 ServiceImpl
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
@Service("cSAAlncCnslService")
public class CSAAlncCnslServiceImpl extends EmfAbstractService implements CSAAlncCnslService {	
	
	@Resource(name="cSAAlncCnslDAO")
	private CSAAlncCnslDAO cSAAlncCnslDAO;
	
   	@Resource(name="EgovFileMngUtil")
   	private EgovFileMngUtil fileUtil;
   	
   	@Resource(name="EgovFileMngService")
    private EgovFileMngService fileMngService;
   	
   	@Resource(name="mailService")
	private MailService mailService;
	
	@Resource(name="alncCnslIdgen")
	private EgovTableIdGnrService alncCnslIdgen;
	
	private final String atchFileSize = EgovProperties.getProperty("Globals.atchFileSize");
	
	private final String[] atchFileExtns = EgovProperties.getProperty("File.UploadMimeType").split(",");
	
	private String ENCODE = EgovProperties.getProperty("Global.CHARCODE");
	
	/**
	 * 제휴 문의를 등록한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertAlncCnsl(EmfMap emfMap, MultipartHttpServletRequest multiRequest) throws Exception
	{
		//보안문자 체크
		String captcha = EMFStringUtil.nullConvert(multiRequest.getSession().getAttribute("CurrentAnswer"));
		
		if(!captcha.equals(EMFStringUtil.nullConvert(emfMap.get("captchaText")))) 
		{
			throw new Exception("보안문자오류");
		}

		//첨부파일 업로드
		final Map<String, MultipartFile> files = multiRequest.getFileMap();	
		
		if(!files.isEmpty())
		{
			List<EmfMap> atchFileList = null;
			String atchFileId = null;
	
			atchFileList = fileUtil.parseFileInf(files, "", 0, "", "Globals.fileStorePath", "atchFile", Integer.parseInt(atchFileSize), atchFileExtns);
			
			if(files.size() == atchFileList.size())
			{
				atchFileId = fileMngService.insertFileInfs(atchFileList);
				emfMap.put("atchFileId", atchFileId);
			} 
			else 
			{
				throw new Exception("파일용량초과");
			}
		}
		
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("alncCnslSeq", alncCnslIdgen.getNextIntegerId());
		
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
			emfMap.put("regIp", EgovNetworkState.getMyIPaddress(multiRequest));
			emfMap.put("modIp", EgovNetworkState.getMyIPaddress(multiRequest));
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
		
		cSAAlncCnslDAO.insertAlncCnsl(emfMap);
		
		//메일발송을 위해 사용자정보를 가져온다.
		EmfMap prsnCnslInfo = cSAAlncCnslDAO.selectAlncCnsl(emfMap);
		
		if(!"".equals(EMFStringUtil.nullConvert(prsnCnslInfo.get("email"))))
		{
			EmfMap mailMap = new EmfMap();
			
			mailMap.put("subject", "[대명아임레디 제휴 문의 신청 완료] 메일입니다.");
			//2017.04.25 박주석 디아모 적용
			mailMap.put("toUser", prsnCnslInfo.getString("email") );
//			mailMap.put("toUser", SeedCipher.decrypt(prsnCnslInfo.getString("email"), ENCODE));
			mailMap.put("inqryNm", prsnCnslInfo.getString("inqryNm"));
			mailMap.put("name", prsnCnslInfo.getString("name"));
			mailMap.put("titl", prsnCnslInfo.getString("titl"));
			mailMap.put("cntn", prsnCnslInfo.getString("cntn").replace(System.getProperty("line.separator"), "<br />"));
			
			mailService.sendTempleteMail(mailMap, "cs/csa/CSAAlncCnslComp.html");
		}
		
		//메일발송을 위해 관리자정보를 가져온다.
		List<EmfMap> admList = cSAAlncCnslDAO.selectAlncCnslAdmList(emfMap);
		
		if(admList.size() > 0)
		{
			EmfMap admMailMap = new EmfMap();
			
			admMailMap.put("subject", "[대명아임레디 관리자 제휴 문의 안내] 메일입니다.");
			admMailMap.put("inqryNm", prsnCnslInfo.getString("inqryNm"));
			admMailMap.put("titl", prsnCnslInfo.getString("titl"));
			admMailMap.put("cntn", prsnCnslInfo.getString("cntn").replace(System.getProperty("line.separator"), "<br />"));
			
			for(int i = 0; i < admList.size(); i++)
			{
				//2017.04.25 박주석 디아모 적용
				admMailMap.put("toUser", admList.get(i).getString("email") );
//				admMailMap.put("toUser", SeedCipher.decrypt(admList.get(i).getString("email"), ENCODE));
				admMailMap.put("name", admList.get(i).getString("name"));
				
				mailService.sendTempleteMail(admMailMap, "cs/csa/CSAAlncCnslAdmin.html");
			}
		}
	}
}
