package egovframework.com.cmm.web;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovProperties;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;

/**
 * @Class Name : EgovImageProcessController.java
 * @Description :
 * @Modification Information
 *
 *    수정일       수정자         수정내용
 *    -------        -------     -------------------
 *    2009. 4. 2.     이삼섭
 *
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 4. 2.
 * @version
 * @see
 *
 */
@SuppressWarnings("serial")
@Controller
public class EgovImageProcessController extends HttpServlet {

    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileService;
    
    /** 첨부파일 위치 지정 */
	private final String uploadDir = EgovProperties.getProperty("Globals.editorFileStorePath");

    private static final Logger LOG = Logger.getLogger(EgovImageProcessController.class.getName());

    /**
     * 첨부된 이미지에 대한 미리보기 기능을 제공한다.
     *
     * @param atchFileId
     * @param fileSn
     * @param sessionVO
     * @param model
     * @param response
     * @throws Exception
     */
    @RequestMapping("/cmm/fms/getImage.do")
    public void getImageInf(EmfMap emfMap, ModelMap model,
    						@RequestParam("fileId") String atchFileId,
    						@RequestParam("fileSn") String fileSeq, 
    						@RequestParam(value="thnlYn", required=false, defaultValue="N") String thnlYn, 
    						HttpServletResponse response) throws Exception 
    {
		emfMap.put("atchFileId", atchFileId);
		emfMap.put("fileSeq", fileSeq);
		
		EmfMap fvo = fileService.selectFileInf(emfMap);
	
		if(fvo == null)
		{
			return;
		}
		
		// 2011.10.10 보안점검 후속조치
		File file = null;
		FileInputStream fis = null;
	
		BufferedInputStream in = null;
		ByteArrayOutputStream bStream = null;
		
		if("Y".equals(thnlYn.toUpperCase()))
		{
			fvo.put("saveFileNm", fvo.getString("saveFileNm") + "." + fvo.getString("fileExtn"));
		}
		
		try 
		{
		    file = new File(fvo.getString("phyPath"), fvo.getString("saveFileNm"));
		    
		    if(!file.isFile())
		    {
		    	return;
		    }
		    
		    fis = new FileInputStream(file);
		    in = new BufferedInputStream(fis);
		    bStream = new ByteArrayOutputStream();
	
		    int imgByte;
		    
		    while ((imgByte = in.read()) != -1)
		    {
		    	bStream.write(imgByte);
		    }
	
			String type = "";
		
			if (!"".equals(EMFStringUtil.nullConvert(fvo.get("fileExtn"))))
			{
				String fileExtn = fvo.getString("fileExtn");
				
			    if ("jpg".equals(fileExtn.toLowerCase())) 
			    {
			    	type = "image/jpeg";
			    } 
			    else 
			    {
			    	type = "image/" + fileExtn.toLowerCase();
			    }
			    
			    type = "image/" + fileExtn.toLowerCase();
			} 
			else 
			{
			    LOG.debug("Image fileType is null.");
			}
		
			response.setHeader("Content-Type", type);
			response.setHeader("Content-Disposition", "filename=" + fvo.getString("realFileNm") + ";");
			response.setContentLength(bStream.size());
		
			bStream.writeTo(response.getOutputStream());
		
			response.getOutputStream().flush();
			response.getOutputStream().close();
			
			// 2011.10.10 보안점검 후속조치 끝
		}
		finally 
		{
			if (bStream != null) 
			{
				try 
				{
					bStream.close();
				} 
				catch (Exception ignore)
				{
					LOG.debug("IGNORE: " + ignore.getMessage());
				}
			}
			
			if (in != null) 
			{
				try
				{
					in.close();
				} 
				catch (Exception ignore)
				{
					LOG.debug("IGNORE: " + ignore.getMessage());
				}
			}
			
			if (fis != null)
			{
				try
				{
					fis.close();
				} 
				catch (Exception ignore)
				{
					LOG.debug("IGNORE: " + ignore.getMessage());
				}
			}
		}
    }
    
    /**
     * 에디터의 이미지를 보여준다.
     *
     * @param atchFileId
     * @param fileSn
     * @param sessionVO
     * @param model
     * @param response
     * @throws Exception
     */
    @RequestMapping("/cmm/fms/getEditorImage.do")
    public void getImageInf(EmfMap emfMap, ModelMap model, 
    						@RequestParam(value="fn", required=true) String strFile,
    						HttpServletResponse response) throws Exception 
    {
		File file = null;
		FileInputStream fis = null;
		
		BufferedInputStream in = null;
		ByteArrayOutputStream bStream = null;
		
		strFile = new String(strFile.getBytes("8859_1"),"utf-8");
		
		try 
		{			
			// 상대경로를 통한 파일 접근 제한
			strFile = strFile.replaceAll("\\.\\./", ""); // ../
			strFile = strFile.replaceAll("\\.\\.\\\\", ""); // ..\
			strFile = strFile.replaceAll("\\.\\.", ""); // ..
			String path = uploadDir + "/" + strFile;
			file = new File(EgovWebUtil.filePathBlackList(uploadDir + "/" + strFile));

		    if (!file.exists()) 
		    {
			    throw new FileNotFoundException(strFile);
			}
		    
		    fis = new FileInputStream(file);
		    in = new BufferedInputStream(fis);
		    bStream = new ByteArrayOutputStream();
	
		    int imgByte;
		   
		    while ((imgByte = in.read()) != -1) 
		    {
		    	bStream.write(imgByte);
		    }
	
			String type = "";
			String fileExt = "";
			fileExt = "jpg";
		
			if (fileExt != null && !"".equals(fileExt)) 
			{
			    if ("jpg".equals(fileExt.toLowerCase())) 
			    {
			    	type = "image/jpeg";
			    } 
			    else 
			    {
			    	type = "image/" + fileExt.toLowerCase();
			    }
			    
			    type = "image/" + fileExt.toLowerCase();
			}
			else
			{
			    LOG.debug("Image fileType is null.");
			}
		
			response.setHeader("Content-Type", type);
			response.setHeader("Content-Disposition", "filename=images;");
			response.setContentLength(bStream.size());
		
			bStream.writeTo(response.getOutputStream());
		
			response.getOutputStream().flush();
			response.getOutputStream().close();
	
			// 2011.10.10 보안점검 후속조치 끝
		}
		finally 
		{
			if (bStream != null)
			{
				try 
				{
					bStream.close();
				} 
				catch (Exception ignore)
				{
					LOG.debug("IGNORE: " + ignore.getMessage());
				}
			}
			if (in != null) 
			{
				try
				{
					in.close();
				} 
				catch (Exception ignore)
				{
					LOG.debug("IGNORE: " + ignore.getMessage());
				}
			}
			if (fis != null) 
			{
				try 
				{
					fis.close();
				} 
				catch (Exception ignore)
				{
					LOG.debug("IGNORE: " + ignore.getMessage());
				}
			}
		}
    }
}