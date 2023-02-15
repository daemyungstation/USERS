package front.ml.mlg.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovFormatCheckUtil;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.ml.mlg.service.MLGObtrNotiService;
import front.ml.mlg.service.dao.MLGObtrNotiDAO;
import front.ml.mlg.service.dao.MLGObtrNotiOutDAO;
import front.ml.mlg.service.dao.MLGObtrNotiSmsDAO;

/**
 * <pre> 
 * 부고알리미를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: MLGObtrNotiServiceImpl.java
 * @Description		: 부고알리미를 위한 ServiceImpl
 * @author 허진영
 * @since 2016.03.02
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.02		   허진영				  최초 생성
 * </pre>
 */ 
@Service("mLGObtrNotiService")
public class MLGObtrNotiServiceImpl extends EmfAbstractService implements MLGObtrNotiService {	
	
	@Resource(name="mLGObtrNotiDAO")
	private MLGObtrNotiDAO mLGObtrNotiDAO;
	
	@Resource(name="mLGObtrNotiOutDAO")
	private MLGObtrNotiOutDAO mLGObtrNotiOutDAO;
	
	@Resource(name="mLGObtrNotiSmsDAO")
	private MLGObtrNotiSmsDAO mLGObtrNotiSmsDAO;
	
	@Resource(name="EgovFileMngUtil")
   	private EgovFileMngUtil fileUtil;
   	
   	@Resource(name="EgovFileMngService")
    private EgovFileMngService fileMngService;
   	
   	private final String atchFileSize = EgovProperties.getProperty("Globals.atchFileSize");
	
	private final String[] atchFileExtns = {"xls"};
	
	/**
	 * 가입상품 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectJoinPrdctList(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("memNo", lgnMap.getString("unqNo"));
		
		return mLGObtrNotiOutDAO.selectJoinPrdctList(emfMap);
	}
	
	/**
	 * 부고알리미 정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectObtrNotiInf(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("memNo", lgnMap.getString("unqNo"));
		emfMap.put("id", lgnMap.getString("id"));
		
		emfMap.put("obtrInfo", mLGObtrNotiDAO.selectObtrNotiInf(emfMap));
		
		emfMap.put("prdctInfo", mLGObtrNotiOutDAO.selectJoinPrdctInf(emfMap));
		
		return emfMap;
	}
	
	/**
	 * 부고알리미 정보를 저장한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateObtrNotiInf(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("id", lgnMap.getString("id"));
		emfMap.put("regId", lgnMap.getString("id"));
		emfMap.put("regIp", lgnMap.getString("loginIp"));
		emfMap.put("modId", lgnMap.getString("id"));
		emfMap.put("modIp", lgnMap.getString("loginIp"));
		
		mLGObtrNotiDAO.updateObtrNotiInf(emfMap);
	}
	
	/**
	 * 양식으로 업로드된 데이터를 가져온다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<String> getFormExcelData(EmfMap emfMap, MultipartHttpServletRequest multiRequest) throws Exception
	{
		List<String> list = new ArrayList<String>();
		
		try
		{
			final Map<String, MultipartFile> files = multiRequest.getFileMap();	

			if(!files.isEmpty()) 
			{
				List<EmfMap> atchFileList = null;
		
				atchFileList = fileUtil.parseFileInf(files, "", 0, "", "Globals.fileStorePath", "atchFile", Integer.parseInt(atchFileSize), atchFileExtns);
				
				if(atchFileList.size() > 0) 
				{
					Workbook workbook = null;
				    Sheet sheet = null;
				    Cell cell = null;
					
				    //엑셀파일을 인식
					workbook = Workbook.getWorkbook(new FileInputStream(new File(atchFileList.get(0).getString("phyPath") , atchFileList.get(0).getString("saveFileNm"))));
					
			        if(workbook != null) 
			        {
			        	//엑셀파일에서 첫번째 Sheet를 인식
			            sheet = workbook.getSheet(0);

			            if(sheet != null) 
			            {
			            	int rows = sheet.getRows();       // 세로항목
			            	
			            	for(int i = 1; i < rows; i++)
			            	{
		            			cell = sheet.getCell(1, i);
	            	        	
            	        		if(EgovFormatCheckUtil.checkFormatCell(cell.getContents()))
            	        		{
	            	        		list.add(cell.getContents());
            	        		}
		            	    }
			            }
			        }
			        
			        workbook.close();
				} 
			}
		}
		catch(Exception e)
		{
			throw (Exception)e;
		}
		
		return list; 
	}
	
	/**
	 * 부고알리미를 발송한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertObtrNotiSend(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("memNo", lgnMap.getString("unqNo"));
		emfMap.put("id", lgnMap.getString("id"));
		
		//상품 정보 가져오기
		EmfMap prdctInfo = (EmfMap) emfMap.get("prdctInfo");
		
		emfMap.put("accntNo", prdctInfo.getString("accntNo"));
		emfMap.put("prodCd", prdctInfo.getString("prodCd"));
		
		emfMap.put("callback", lgnMap.getString("hp").replaceAll("-", ""));

		if(!"".equals(emfMap.getString("smsCntn")))
		{
			byte[] strByte = emfMap.getString("smsCntn").getBytes("EUC-KR");
			
			if(strByte.length <= 80)
			{
				emfMap.put("sendType", "sms");
			}
			else
			{
				emfMap.put("sendType", "mms");
			}
			
			List<String> hpList = emfMap.getList("hp");
			
			EmfMap obtrInfo = mLGObtrNotiDAO.selectObtrNotiInf(emfMap);
			
			int sendAbleCnt = 100 - Integer.parseInt(obtrInfo.getString("smsSendCnt"));
			
			for (int i = 0; i < hpList.size(); i++) 
			{
				if(sendAbleCnt <= i)
				{
					break;
				}
				
				emfMap.put("hp", hpList.get(i));
				
				mLGObtrNotiSmsDAO.insertObtrNotiSms(emfMap);
			}
			
			//발송 건수 저장
			emfMap.put("smsSendCnt", hpList.size());
			emfMap.put("regId", lgnMap.getString("id"));
			emfMap.put("regIp", lgnMap.getString("loginIp"));
			emfMap.put("modId", lgnMap.getString("id"));
			emfMap.put("modIp", lgnMap.getString("loginIp"));

			mLGObtrNotiDAO.updateObtrNotiInf(emfMap);
		}
	}
}
