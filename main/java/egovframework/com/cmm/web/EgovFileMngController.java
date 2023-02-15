package egovframework.com.cmm.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import emf.core.extend.web.EmfController;
import emf.core.vo.EmfMap;

/**
 * 파일 조회, 삭제, 다운로드 처리를 위한 컨트롤러 클래스
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
 * </pre>
 */
@Controller
public class EgovFileMngController extends EmfController {

    @Resource(name="EgovFileMngService")
    private EgovFileMngService fileService;

    /**
     * 첨부파일에 대한 목록을 조회한다.
     * 
     * @param fileVO
     * @param atchFileId
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmm/fms/selectFileInfs.do")
    public String selectFileInfs(EmfMap emfMap, Map<String, Object> commandMap, ModelMap model) throws Exception
    {
    	String atchFileId = (String)commandMap.get("param_atchFileId");

    	emfMap.put("atchfileid", atchFileId);
    	
    	List<EmfMap> result = fileService.selectFileInfs(emfMap);

		model.addAttribute("fileList", result);
		model.addAttribute("updateFlag", "N");
		model.addAttribute("fileListCnt", result.size());
		model.addAttribute("atchFileId", atchFileId);
	
		return "egovframework/com/cmm/fms/EgovFileList";
    }

    /**
     * 첨부파일 변경을 위한 수정페이지로 이동한다.
     * 
     * @param fileVO
     * @param atchFileId
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmm/fms/selectFileInfsForUpdate.do")
    public String selectFileInfsForUpdate(EmfMap emfMap, Map<String, Object> commandMap, ModelMap model) throws Exception 
    {
		String atchFileId = (String)commandMap.get("param_atchFileId");
		
		emfMap.put("atchfileid", atchFileId);
		
		List<EmfMap> result = fileService.selectFileInfs(emfMap);
		
		model.addAttribute("fileList", result);
		model.addAttribute("updateFlag", "Y");
		model.addAttribute("fileListCnt", result.size());
		model.addAttribute("atchFileId", atchFileId);
		
		return "egovframework/com/cmm/fms/EgovFileList";
    }

    /**
     * 첨부파일에 대한 삭제를 처리한다.
     * 
     * @param fileVO
     * @param returnUrl
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmm/fms/deleteFileInfs.do")
    public String deleteFileInf(EmfMap emfMap, @RequestParam("returnUrl") String returnUrl, HttpServletRequest request, ModelMap model) throws Exception 
    {

    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) 
		{
		    fileService.deleteFileInf(emfMap);
		}
	
		//--------------------------------------------
		// contextRoot가 있는 경우 제외 시켜야 함
		//--------------------------------------------
		if ("".equals(request.getContextPath()) || "/".equals(request.getContextPath()))
		{
		    return "forward:" + returnUrl;
		}
		
		if (returnUrl.startsWith(request.getContextPath())) 
		{
		    return "forward:" + returnUrl.substring(returnUrl.indexOf("/", 1));
		} 
		else
		{
		    return "forward:" + returnUrl;
		}
		//------------------------------------------
    }

    /**
     * 이미지 첨부파일에 대한 목록을 조회한다.
     * 
     * @param fileVO
     * @param atchFileId
     * @param sessionVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/cmm/fms/selectImageFileInfs.do")
    public String selectImageFileInfs(EmfMap emfMap, Map<String, Object> commandMap, ModelMap model) throws Exception
    {
		String atchFileId = (String)commandMap.get("atchFileId");
	
		emfMap.put("atchfileid", atchFileId);
		
		List<EmfMap> result = fileService.selectImageFileList(emfMap);
		
		model.addAttribute("fileList", result);
	
		return "egovframework/com/cmm/fms/EgovImgFileList";
    }
    
    /**
     * 첨부파일 비동기 삭제를 위한 컨트롤러 (ajax로 하여 flag 값만 바꾼다) 
     * @param request
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/cmm/fms/deleteFile.ajax")
    public ModelAndView deleteFileInfo(EmfMap emfMap, HttpServletRequest request, ModelMap modelMap) throws Exception
    {
    	ModelAndView mav = new ModelAndView();
    	
    	try
    	{
    		emfMap.put("atchfileid", request.getParameter("ATCH_FILE_ID").toString());
    		emfMap.put("filesn", request.getParameter("FILE_SN").toString());
    		
    		fileService.deleteFileInf(emfMap);
    		
    		mav.addObject("msg", "Y");
    		
    		mav.setViewName("jsonView");
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	
    	return mav;
    }
}
