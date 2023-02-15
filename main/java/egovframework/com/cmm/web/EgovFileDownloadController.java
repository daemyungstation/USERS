package egovframework.com.cmm.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Calendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovFormBasedFileUtil;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;

/**
 * 파일 다운로드를 위한 컨트롤러 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.3.25  이삼섭          최초 생성
 *
 * Copyright (C) 2009 by MOPAS  All right reserved.
 * </pre>
 */
@Controller
public class EgovFileDownloadController extends EmfController {
	
	/** 첨부파일 위치 지정 **/
    private final String uploadDir = EgovProperties.getProperty("Globals.fileStorePath");
	
    /** 첨부파일 위치 지정 **/
    private final String docDir = EgovProperties.getProperty("Globals.docFileStorePath");
    
    /** Buffer size **/
    public static final int BUFFER_SIZE = 8192;

    public static final String SEPERATOR = File.separator;
    
    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileService;
    
    private static final Logger LOG = Logger.getLogger(EgovFileDownloadController.class.getName());
    
    /**
	 * 브라우저 구분 얻기.
	 * 
	 * @param request
	 * @return String
	 * @throws Exception
	 */
    private String getBrowser(HttpServletRequest request) 
    {
        String header = request.getHeader("User-Agent");
      
        if (header.indexOf("MSIE") > -1) 
        {
            return "MSIE";
        }
        else if (header.indexOf("Chrome") > -1) 
        {
            return "Chrome";
        } 
        else if (header.indexOf("Opera") > -1) 
        {
            return "Opera";
        } 
        else if (header.indexOf("Trident") > -1)
        {
        	return "Trident";
        }
        
        return "Firefox";
    }
    
    /**
     * Disposition 지정하기.
     * 
     * @param filename
     * @param request
     * @param response
     * @return 
     * @throws Exception
     */
    private void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception 
    {
		String browser = getBrowser(request);
		
		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;
		
		if (browser.equals("MSIE")) 
		{
		    encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} 
		else if(browser.equals("Trident"))
		{
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		}
		else if (browser.equals("Firefox"))
		{
		    encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} 
		else if (browser.equals("Opera")) 
		{
		    encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} 
		else if (browser.equals("Chrome")) 
		{
		    StringBuffer sb = new StringBuffer();
		    
		    for (int i = 0; i < filename.length(); i++) 
		    {
				char c = filename.charAt(i);
				
				if (c > '~') 
				{
				    sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} 
				else 
				{
				    sb.append(c);
				}
		    }
		    
		    encodedFilename = sb.toString();
		} 
		else 
		{
		    throw new IOException("Not supported browser");
		}
		
		response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);
	
		if ("Opera".equals(browser))
		{
		    response.setContentType("application/octet-stream;charset=UTF-8");
		}
    }
    
    /**
     * 파일을 뷰한다
     * 
     * @param filename
     * @param request
     * @param response
     * @return 
     * @throws Exception
     */
    @RequestMapping(value="/cmm/fms/fileView.do", method=RequestMethod.GET)
    public void downloadFile(@RequestParam(value="fileId", required=true) String atchFileId,
    						 @RequestParam(value="fileSn", required=true) int fileSeq, 
    						 HttpServletRequest request, HttpServletResponse response, EmfMap emfMap) throws Exception 
    {   
    	atchFileId = atchFileId.replace("../", "");
		
		emfMap.put("atchFileId", atchFileId.trim());
		emfMap.put("fileSeq", Integer.toString(fileSeq));		
		
		EmfMap rtnMap = fileService.selectFileInf(emfMap);
		
		setDisposition(URLEncoder.encode((String)rtnMap.get("realFileNm"), "utf-8"), request, response);
		
		try
		{
			EgovFormBasedFileUtil.viewFile(response, rtnMap.getString("phyPath"), "", rtnMap.getString("saveFileNm"), rtnMap.getString("fileExtn"));
		}
		catch(Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		}
    }

    /**
     * 첨부파일로 등록된 파일에 대하여 다운로드를 제공한다.
     * 
     * @param commandMap
     * @param response
     * @throws Exception
     */
    @RequestMapping(value="/cmm/fms/FileDown.do")    
    public void fileDownload(HttpServletRequest request, HttpServletResponse response, EmfMap emfMap) throws Exception
    {
    	String atchFileId = "";
    	
    	if(emfMap.get("fileId") != null)
    	{
        	atchFileId = emfMap.getString("fileId");
        	atchFileId = atchFileId.replace("../", "");   
        	emfMap.put("atchFileId", atchFileId);
    	}
    	
    	int fileSeq = 0;
    	
    	if(emfMap.get("fileSn") != null)
    	{
    		fileSeq = Integer.parseInt(emfMap.getString("fileSn"));
    		emfMap.put("fileSeq", fileSeq);
    	}
    	
		EmfMap rtnMap  = fileService.selectFileInf(emfMap);
		
	    if(rtnMap == null || "".equals(EgovStringUtil.nullConvert(rtnMap.get("phyPath"))))
	    {
	    	//dispatch-servlet.xml에 정의되어잇는 Exception으로 매핑
	    	throw new FileNotFoundException("파일이 없습니다.");
	    }
	    
	    File uFile = new File(rtnMap.getString("phyPath"), rtnMap.getString("saveFileNm"));
	    
	    int fSize = (int)uFile.length();
	    
	    if (fSize > 0) 
	    {
			String mimetype = "application/x-msdownload";
	
			//response.setBufferSize(fSize);	// OutOfMemeory 발생
			//response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fvo.getOrignlFileNm(), "utf-8") + "\"");
			
			response.setContentType(mimetype);
			response.setContentLength(fSize);
			setDisposition(URLEncoder.encode(rtnMap.getString("realFileNm"), "utf-8"), request, response);
			
			BufferedInputStream in = null;
			BufferedOutputStream out = null;
	
			try 
			{
			    in = new BufferedInputStream(new FileInputStream(uFile));
			    out = new BufferedOutputStream(response.getOutputStream());
	
			    FileCopyUtils.copy(in, out);
			    out.flush();
			} 
			catch (Exception ex) 
			{
			    LOG.debug("IGNORED: " + ex.getMessage());
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
					    LOG.debug("IGNORED: " + ignore.getMessage());
					}
			    }
			    
			    if (out != null) 
			    {
					try 
					{
					    out.close(); 
					} 
					catch (Exception ignore)
					{
					    LOG.debug("IGNORED: " + ignore.getMessage());
					}
			    }

		    	// 다운로드 횟수를 증가시킨다.
		    	//fileService.updateFileCnt(emfMap); 
			}
	    }
	    else 
	    {
	    	throw new FileNotFoundException("파일이 없습니다.");
	    }
	}

    /*
     * 미디어 파일을 다운로드 한다.
     */
    @RequestMapping(value="/cmm/download.do")
    public void downloadMediaFile(HttpServletRequest request, HttpServletResponse response, @RequestParam("subpath") String subpath) throws Exception 
    {  
    	subpath = EgovWebUtil.filePathBlackList(subpath);
    	
    	String downFileName = docDir + subpath;
    	
    	String filename = subpath;
    	String[] arrFilename;
    	
    	arrFilename = filename.split("/");
    	filename = arrFilename[arrFilename.length - 1];
    	
    	if(subpath.indexOf("../") > -1 )
    	{
    		response.sendRedirect("/error/500.do");
    		return;
    	}
    	
    	File file = new File(EgovWebUtil.filePathBlackList(downFileName));

    	if (!file.exists()) 
    	{
    	    throw new FileNotFoundException(downFileName);
    	}

    	if (!file.isFile()) 
    	{
    	    throw new FileNotFoundException(downFileName);
    	}
   	
    	response.setContentType("application/octet-stream");
    	response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(filename, "utf-8") + "\";");
    	response.setHeader("Content-Transfer-Encoding", "binary");
    	response.setHeader("Pragma", "no-cache");
    	response.setHeader("Expires", "0");
    	
    	BufferedInputStream fin = null;
    	BufferedOutputStream outs = null;
    	
    	byte[] b = new byte[BUFFER_SIZE];
    	
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
	 * 모바일 카드 이미지를 다운로드한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	@RequestMapping(value="/cmm/{filename}/download.do")
	public void getMobileCardDownload(HttpServletRequest request, HttpServletResponse response, @PathVariable String filename) throws Exception
	{
		if(EgovUserDetailsHelper.isAuthenticated())
		{
			Calendar oCalendar = Calendar.getInstance();
			
			String pyhPath = EgovProperties.getProperty("Globals.mobileFileStorePath");
			
			pyhPath = pyhPath + "/" + oCalendar.get(Calendar.YEAR);
			pyhPath = pyhPath + "/" + (oCalendar.get(Calendar.MONTH) + 1);
			
			String saveFileNm = filename + ".jpg";
			
			File uFile = new File(pyhPath, saveFileNm);
			
			int fSize = (int) uFile.length();
			
			if(fSize > 0)
			{
				response.setContentType("image/jpeg");
				response.setContentLength(fSize);
				
				setDisposition(URLEncoder.encode("membership.jpg", "utf-8"), request, response);
				
				BufferedInputStream bis = null;
		    	BufferedOutputStream bos = null;
		    	
		    	try 
				{
		    		bis = new BufferedInputStream(new FileInputStream(uFile));
		    		bos = new BufferedOutputStream(response.getOutputStream());
		
				    FileCopyUtils.copy(bis, bos);
				    
				    bos.flush();
				} 
				catch (Exception ex) 
				{
				    LOG.debug("IGNORED: " + ex.getMessage());
				} 
				finally 
				{
				    if (bis != null) 
				    {
						try
						{
							bis.close();
						} 
						catch (Exception ignore)
						{
						    LOG.debug("IGNORED: " + ignore.getMessage());
						}
				    }
				    
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
				}
			}
			else 
		    {
		    	throw new FileNotFoundException("파일이 없습니다.");
		    }
		}
		else
		{
			throw new FileNotFoundException("잘못된 접근입니다.");
		}
	}
}