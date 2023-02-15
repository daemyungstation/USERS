package egovframework.com.cmm.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmm.EgovWebUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.string.EgovStringUtil;
import emf.core.vo.EmfMap;

/**
 * @Class Name  : EgovFileMngUtil.java
 * @Description : 메시지 처리 관련 유틸리티
 * @Modification Information
 *
 *     수정일         수정자                   수정내용
 *     -------          --------        ---------------------------
 *   2009.02.13       이삼섭                  최초 생성
 *   2011.08.09       서준식                  utl.fcc패키지와 Dependency제거를 위해 getTimeStamp()메서드 추가
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 02. 13
 * @version 1.0
 * @see
 *
 */
@Component("EgovFileMngUtil")
public class EgovFileMngUtil {

    public static final int BUFF_SIZE = 2048;

    @Resource(name = "egovFileIdGnrService")
    private EgovIdGnrService idgenService;

    private static final Logger LOG = Logger.getLogger(EgovFileMngUtil.class.getName());

    /**
     * 첨부파일에 대한 목록 정보를 취득한다.
     *
     * @param files
     * @return
     * @throws Exception
     */
    public List<EmfMap> parseFileInf(Map<String, MultipartFile> files, String KeyStr, int fileKeyParam, String atchFileId, String storePath, String formname, long fileSize, String[] checkFileExt) throws Exception 
    {
		int fileKey = fileKeyParam;
	
		String pyhPath = "";
		String atchFileIdString = "";
		
		if ("".equals(storePath) || storePath == null) 
		{
			pyhPath = EgovProperties.getProperty("Globals.fileStorePath");
		} 
		else 
		{
			pyhPath = EgovProperties.getProperty(storePath);
		}	
		
		Calendar oCalendar = Calendar.getInstance();
		
		pyhPath = pyhPath + "/" + oCalendar.get(Calendar.YEAR);
		pyhPath = pyhPath + "/" + (oCalendar.get(Calendar.MONTH) + 1);
	
		if ("".equals(atchFileId) || atchFileId == null) 
		{
		    atchFileIdString = idgenService.getNextStringId();
		} 
		else 
		{
		    atchFileIdString = atchFileId;
		}
	
		File saveFolder = new File(EgovWebUtil.filePathBlackList(pyhPath));
	
		if (!saveFolder.exists() || saveFolder.isFile())
		{
		    saveFolder.mkdirs();
		}
	
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;
		
		EmfMap fvo;
		List<EmfMap> result = new ArrayList<EmfMap>();
		
		while (itr.hasNext()) 
		{
		    Entry<String, MultipartFile> entry = itr.next();
		    file = entry.getValue();
		    
		    if(file.getName().indexOf(formname) > -1)
		    {
			    String realFileNm = file.getOriginalFilename();
			    // cross site scripting 처리
			    realFileNm = realFileNm.replaceAll("<", "");
			    realFileNm = realFileNm.replaceAll(">", "");
			    realFileNm = realFileNm.replaceAll("\"", "");
			    realFileNm = realFileNm.replaceAll("'", "");
			    realFileNm = realFileNm.replaceAll("&", "");
			    realFileNm = realFileNm.replaceAll("%", "");
			    realFileNm = realFileNm.replaceAll("!", "");
			    realFileNm = realFileNm.replaceAll("--", "");
			    //realFileNm = realFileNm.replaceAll("+", "");
			    realFileNm = realFileNm.replaceAll(";", "");
			    //realFileNm = realFileNm.replaceAll("(", "");
			    //realFileNm = realFileNm.replaceAll(")", "");
			    realFileNm = realFileNm.replaceAll("%00", "");
			    
			    //--------------------------------------
			    // 원 파일명이 없는 경우 처리
			    // (첨부가 되지 않은 input file type)
			    //--------------------------------------
			    if ("".equals(realFileNm)) 
			    {
			    	continue;
			    }
			    ////------------------------------------
			    
			    long _size = file.getSize();
	
			    if (_size > (long)fileSize) 
			    {
			    	continue;
			    }
		
			    int index = realFileNm.lastIndexOf(".");
			    
			    //String fileName = orginFileName.substring(0, index);
			    String fileExtn = realFileNm.substring(index + 1);
			    boolean isFileExt = true;
			    
			    if(checkFileExt != null)
			    {
			    	isFileExt = false;
			    	
			    	for(int q = 0; q < checkFileExt.length; q++)
			    	{
			    		if(EgovStringUtil.trim(checkFileExt[q]).toLowerCase().equals(fileExtn.toLowerCase()))
			    		{
			    			isFileExt = true;
			    			break;
			    		}
			    	}
			    }
	
			    if(!isFileExt)
			    {
			    	continue;
			    }
			    
			    String saveFileNm = KeyStr + getTimeStamp() + fileKey + "." + fileExtn;
			    
			    if (!"".equals(realFileNm)) 
			    {
			    	String filePath = pyhPath + File.separator + saveFileNm;
			    	file.transferTo(new File(EgovWebUtil.filePathBlackList(filePath)));
			    }	
				
			    fvo = new EmfMap();
			    fvo.put("fileExtn", fileExtn);
			    fvo.put("phyPath", pyhPath);
			    fvo.put("fileSize", _size);
			    fvo.put("realFileNm", realFileNm);
			    fvo.put("saveFileNm", saveFileNm);
			    fvo.put("atchFileId", atchFileIdString);
			    fvo.put("fileSeq", fileKey);
			    result.add(fvo);
			    fileKey++;
		    }
		}

		return result;
    }
    
    /**
     * 첨부파일에 대한 파일 사이즈를 반환한다.
     *
     * @param files
     * @return
     * @throws Exception
     */
    public long parseFileSize(Map<String, MultipartFile> files) throws Exception
    {
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;
		
		long _size = 0;
		
		while (itr.hasNext())
		{
		    Entry<String, MultipartFile> entry = itr.next();
		    file = entry.getValue();
		    String orginFileName = file.getOriginalFilename();
			
		    //--------------------------------------
		    // 원 파일명이 없는 경우 처리
		    // (첨부가 되지 않은 input file type)
		    //--------------------------------------
		    if ("".equals(orginFileName))
		    {
		    	continue;
		    }
		    ////------------------------------------
		    
		    _size = file.getSize();
		}
		
		return _size;
    }

    /**
     * 첨부파일을 서버에 저장한다.
     *
     * @param file
     * @param newName
     * @param stordFilePath
     * @throws Exception
     */
    protected void writeUploadedFile(MultipartFile file, String newName, String stordFilePath) throws Exception
    {
		InputStream stream = null;
		OutputStream bos = null;

		try 
		{
		    stream = file.getInputStream();
		    File cFile = new File(stordFilePath);
	
		    if (!cFile.isDirectory())
		    {
		    	boolean _flag = cFile.mkdir();
		    	
				if (!_flag) 
				{
				    throw new IOException("Directory creation Failed ");
				}
		    }
	
		    bos = new FileOutputStream(stordFilePath + File.separator + newName);
	
		    int bytesRead = 0;
		    byte[] buffer = new byte[BUFF_SIZE];
	
		    while ((bytesRead = stream.read(buffer, 0, BUFF_SIZE)) != -1) 
		    {
		    	bos.write(buffer, 0, bytesRead);
		    }
		} 
		catch (Exception e) 
		{
		    LOG.error("IGNORE:", e);	// 2011.10.10 보안점검 후속조치
		} 
		finally 
		{
		    if (bos != null)
		    {
				try 
				{
				    bos.close();
				} 
				catch (Exception ignore) 
				{
				    LOG.debug("IGNORED: " + ignore.getMessage());
				}
		    }
		    if (stream != null) 
		    {
				try
				{
				    stream.close();
				} catch (Exception ignore) 
				{
				    LOG.debug("IGNORED: " + ignore.getMessage());
				}
		    }
		}
    }

    /**
     * 서버의 파일을 다운로드한다.
     *
     * @param request
     * @param response
     * @throws Exception
     */
    public static void downFile(HttpServletRequest request, HttpServletResponse response) throws Exception 
    {
		String downFileName = "";
		String orgFileName = "";
	
		if ((String)request.getAttribute("downFile") == null) 
		{
		    downFileName = "";
		} 
		else 
		{
		    downFileName = (String)request.getAttribute("downFile");
		}
	
		if ((String)request.getAttribute("orgFileName") == null) 
		{
		    orgFileName = "";
		} 
		else
		{
		    orgFileName = (String)request.getAttribute("orginFile");
		}
	
		orgFileName = orgFileName.replaceAll("\r", "").replaceAll("\n", "");
	
		File file = new File(EgovWebUtil.filePathBlackList(downFileName));
	
		if (!file.exists()) 
		{
		    throw new FileNotFoundException(downFileName);
		}
	
		if (!file.isFile())
		{
		    throw new FileNotFoundException(downFileName);
		}
	
		//buffer size 2K.
		byte[] b = new byte[BUFF_SIZE];
	
		response.setContentType("application/x-msdownload");
		response.setHeader("Content-Disposition:", "attachment; filename=" + new String(orgFileName.getBytes(), "UTF-8"));
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
	
		BufferedInputStream fin = null;
		BufferedOutputStream outs = null;
	
		try 
		{
			fin = new BufferedInputStream(new FileInputStream(file));
		    outs = new BufferedOutputStream(response.getOutputStream());
		    int read = 0;
	
			while ((read = fin.read(b)) != -1)
			{
			    outs.write(b, 0, read);
			}
		} 
		finally 
		{
		    if (outs != null) 
		    {
				try 
				{
				    outs.close();
				} 
				catch (Exception ignore)
				{
				    LOG.debug("IGNORED: " + ignore.getMessage());
				}
		    }
		    
		    if (fin != null)
		    {
				try 
				{
				    fin.close();
				} 
				catch (Exception ignore)
				{
				    LOG.debug("IGNORED: " + ignore.getMessage());
				}
		    }
		}
    }

    /**
     * 첨부로 등록된 파일을 서버에 업로드한다.
     *
     * @param file
     * @return
     * @throws Exception
     */
    public static HashMap<String, String> uploadFile(MultipartFile file) throws Exception 
    {
		HashMap<String, String> map = new HashMap<String, String>();
		
		//Write File 이후 Move File????
		String newName = "";
		String stordFilePath = EgovProperties.getProperty("Globals.fileStorePath");
		String orginFileName = file.getOriginalFilename();
	
		int index = orginFileName.lastIndexOf(".");
		//String fileName = orginFileName.substring(0, _index);
		String fileExt = orginFileName.substring(index + 1);
		long size = file.getSize();
	
		//newName 은 Naming Convention에 의해서 생성
		newName = getTimeStamp();	// 2012.11 KISA 보안조치
		writeFile(file, newName, stordFilePath);
		
		//storedFilePath는 지정
		map.put(Globals.ORIGIN_FILE_NM, orginFileName);
		map.put(Globals.UPLOAD_FILE_NM, newName);
		map.put(Globals.FILE_EXT, fileExt);
		map.put(Globals.FILE_PATH, stordFilePath);
		map.put(Globals.FILE_SIZE, String.valueOf(size));
	
		return map;
    }

    /**
     * 파일을 실제 물리적인 경로에 생성한다.
     *
     * @param file
     * @param newName
     * @param stordFilePath
     * @throws Exception
     */
    protected static void writeFile(MultipartFile file, String newName, String stordFilePath) throws Exception 
    {
		InputStream stream = null;
		OutputStream bos = null;
	
		try 
		{
		    stream = file.getInputStream();
		    
		    File cFile = new File(EgovWebUtil.filePathBlackList(stordFilePath));
	
		    if (!cFile.isDirectory())
		    {
		    	cFile.mkdir();
		    }
	
		    bos = new FileOutputStream(EgovWebUtil.filePathBlackList(stordFilePath + File.separator + newName));
	
		    int bytesRead = 0;
		    
		    byte[] buffer = new byte[BUFF_SIZE];
	
		    while ((bytesRead = stream.read(buffer, 0, BUFF_SIZE)) != -1) 
		    {
		    	bos.write(buffer, 0, bytesRead);
		    }
		}
		catch (Exception e) 
		{
			Logger.getLogger(EgovFileMngUtil.class).debug("IGNORED: " + e.getMessage());
		} 
		finally
		{
		    if (bos != null) 
		    {
				try
				{
				    bos.close();
				} 
				catch (Exception ignore) 
				{
				    Logger.getLogger(EgovFileMngUtil.class).debug("IGNORED: " + ignore.getMessage());
				}
		    }
		    if (stream != null)
		    {
				try 
				{
				    stream.close();
				} 
				catch (Exception ignore)
				{
				    Logger.getLogger(EgovFileMngUtil.class).debug("IGNORED: " + ignore.getMessage());
				}
		    }
		}
    }

    /**
     * 서버 파일에 대하여 다운로드를 처리한다.
     *
     * @param response
     * @param streFileNm
     *            : 파일저장 경로가 포함된 형태
     * @param orignFileNm
     * @throws Exception
     */
    public void downFile(HttpServletResponse response, String streFileNm, String orignFileNm) throws Exception 
    {
		String downFileName = streFileNm;
		String orgFileName = orignFileNm;
	
		File file = new File(downFileName);
		
		if (!file.exists()) 
		{
		    throw new FileNotFoundException(downFileName);
		}
	
		if (!file.isFile())
		{
		    throw new FileNotFoundException(downFileName);
		}
	
		//byte[] b = new byte[BUFF_SIZE]; //buffer size 2K.
		int fSize = (int)file.length();
		
		if (fSize > 0) 
		{
		    BufferedInputStream in = null;
	
		    try
		    {
		    	in = new BufferedInputStream(new FileInputStream(file));
	
    	    	String mimetype = "text/html"; //"application/x-msdownload"
    	    	
    	    	response.setBufferSize(fSize);
				response.setContentType(mimetype);
				response.setHeader("Content-Disposition:", "attachment; filename=" + orgFileName);
				response.setContentLength(fSize);
				FileCopyUtils.copy(in, response.getOutputStream());
		    } 
		    finally
		    {
				if (in != null) 
				{
				    try 
				    {
				    	in.close();
				    } 
				    catch (Exception ignore) 
				    {
				    	Logger.getLogger(EgovFileMngUtil.class).debug("IGNORED: " + ignore.getMessage());
				    }
				}
		    }
		    
		    response.getOutputStream().flush();
		    response.getOutputStream().close();
		}
    }

    /**
     * 2011.08.09
     * 공통 컴포넌트 utl.fcc 패키지와 Dependency제거를 위해 내부 메서드로 추가 정의함
     * 응용어플리케이션에서 고유값을 사용하기 위해 시스템에서17자리의TIMESTAMP값을 구하는 기능
     *
     * @param
     * @return Timestamp 값
     * @exception MyException
     * @see
     */
    public static String getTimeStamp() 
    {
		String rtnStr = null;
	
		// 문자열로 변환하기 위한 패턴 설정(년도-월-일 시:분:초:초(자정이후 초))
		String pattern = "yyyyMMddhhmmssSSS";
	
		try 
		{
		    SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
		    Timestamp ts = new Timestamp(System.currentTimeMillis());
		    rtnStr = sdfCurrent.format(ts.getTime());
		} 
		catch (Exception e) 
		{
		    LOG.debug("IGNORED: " + e.getMessage());
		}
		
		return rtnStr;
    }
}
