/**
 * 
 */
package front.co.coc.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.exception.FileNotSizeException;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovNetworkState;
import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.co.coc.service.COCBoardMngService;
import front.co.coc.service.dao.COCBoardMngDAO;
import front.co.util.COPaginationUtil;

/**
 * <pre> 
 * 게시글 관리를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: COCBoardMngServiceImpl
 * @Description		: 게시글 관리를 위한 ServiceImpl
 * @author 허진영
 * @since 2015.04.11
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since			author				  description
 *    ==========    ==============    =============================
 *    2015.04.11		허진영				   최초 생성
 * </pre>
 */
@Service("cOCBoardMngService")
public class COCBoardMngServiceImpl extends EmfAbstractService implements COCBoardMngService {
	
	@Resource(name = "cOCBoardMngDAO")
	private COCBoardMngDAO cOCBoardMngDAO;

	@Resource(name="EgovFileMngService")
    private EgovFileMngService fileMngService;
	
	@Resource(name="EgovFileMngUtil")
   	private EgovFileMngUtil fileUtil;
	
	@Resource(name="BoardIdgen")
	private EgovTableIdGnrService boardIdgen;	
	
	private final String atchFileSize = EgovProperties.getProperty("Globals.atchFileSize");
	
	private final String[] atchFileExtns = EgovProperties.getProperty("File.UploadMimeType").split(",");
	
	private String ENCODE = EgovProperties.getProperty("Global.CHARCODE");	
	
	/**
	 * 게시판 속성정보 한 건을 상세조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return EmfMap 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectMaster(EmfMap emfMap) throws Exception
	{
		return cOCBoardMngDAO.selectMaster(emfMap);
	}    

	/**
	 * 게시판 속성정보기반으로 데이터를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return List<EmfMap> 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectBoardList(EmfMap emfMap) throws Exception
	{
		PaginationInfo paginationInfo = new COPaginationUtil().getPage(emfMap);
		
		//페이징 처리
		emfMap.put("paginationInfo", paginationInfo);
		
		//공지리스트 가져오기
		emfMap.put("noticeList", cOCBoardMngDAO.selectNoticeBoardList(emfMap));

		//리스트 가져오기
		List<EmfMap> list = cOCBoardMngDAO.selectBoardList(emfMap);
		
		emfMap.put("list", list);
		
		if(list.size() > 0)
		{
			paginationInfo.setTotalRecordCount(Integer.parseInt(list.get(0).getString("totCnt")));
		}
		else
		{
			paginationInfo.setTotalRecordCount(0);
		}
		
		return emfMap;
	}	
	
	/**
	 *  게시물에 상세정보를 조회한다.
	 * 
	 * @param EmfMap 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */  	
  	public EmfMap selectBoardRead(EmfMap emfMap) throws Exception
  	{
  		if(!"".equals(emfMap.getString("idx")))
  		{
  			EmfMap boardInfo = cOCBoardMngDAO.selectBoardRead(emfMap);
  			
  			if(boardInfo != null)
  			{
  				if("N".equals(boardInfo.getString("openYn")))
  				{
  					EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
  					
  					if(lgnMap == null || !lgnMap.getString("id").equals(boardInfo.getString("regid")))
  					{
  						throw new Exception("비공개오류");
  					}
  				}
  				
				emfMap.put("boardInfo", boardInfo);
			
  				if(!"".equals(boardInfo.getString("atchFileId")))
  				{
  					emfMap.put("atchFileList", fileMngService.selectFileInfs(boardInfo));
  				}
  				
  				if(!"".equals(boardInfo.getString("contentsFileId")))
  				{
  					emfMap.put("atchFileId", boardInfo.getString("contentsFileId"));
  					
  					emfMap.put("contentsFileList", fileMngService.selectFileInfs(emfMap));
  				}
  				
				//불량단어 필터링
				if(!"".equals(EgovStringUtil.nullConvert(emfMap.getString("poorWordNm"))))
				{
					boardInfo.put("contents", EgovStringUtil.wordfilter(boardInfo.getString("contents"), emfMap.getString("poorWordNm")));
				}
				
				//조회수 증가
		  		cOCBoardMngDAO.updateReadCnt(emfMap);  
  			}
  		}
  		
  		return emfMap;
  	}  	

	/**
	 * 게시물을 등록한다.
	 * 
	 * @param EmfMap 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertBoardArticle(EmfMap emfMap, MultipartHttpServletRequest multiRequest) throws Exception
	{		
		//첨부파일 업로드
		final Map<String, MultipartFile> files = multiRequest.getFileMap();	
		
		if(!files.isEmpty())
		{
			List<EmfMap> atchFileList = null;
			String atchFileId = null;
			
			long fileSize = 0;
			
			if(!"".equals(emfMap.getString("fileSize")))
			{
	    		int size = Integer.parseInt(emfMap.getString("fileSize"));
	    		fileSize = size * 1024 * 1024;
			}
			
			String filePossibleExtNm = emfMap.getString("filePossibleExtNm");
	
			if(filePossibleExtNm.indexOf(",") > 0)
			{
				atchFileList = fileUtil.parseFileInf(files, "", 0, "", "Globals.fileStorePath", "atchFile", fileSize, filePossibleExtNm.split(","));
			}
			else
			{
				atchFileList = fileUtil.parseFileInf(files, "", 0, "", "Globals.fileStorePath", "atchFile", fileSize, new String[]{filePossibleExtNm});
			}	
			
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
		
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();

		emfMap.put("idx", boardIdgen.getNextIntegerId());
		emfMap.put("notifyYn", EMFStringUtil.nvl(emfMap.getString("notifyYn"), "N"));
		emfMap.put("openYn", EMFStringUtil.nvl(emfMap.getString("openYn"), "Y"));
		emfMap.put("odtmYn", EMFStringUtil.nvl(emfMap.getString("odtmYn"), "N"));
		
		if(Integer.parseInt(emfMap.getString("approvalAuthority")) > 0)
		{
			emfMap.put("useYn", EMFStringUtil.nvl(emfMap.getString("useYn"), "N"));
		}
		else
		{
			emfMap.put("useYn", EMFStringUtil.nvl(emfMap.getString("useYn"), "Y"));
		}
		
		emfMap.put("regId", lgnMap.getString("id"));
		emfMap.put("regNm", lgnMap.getString("name"));
		emfMap.put("regIp", EMFStringUtil.nvl(lgnMap.getString("loginIp"), EgovNetworkState.getMyIPaddress(multiRequest)));
		emfMap.put("modId", lgnMap.getString("id"));
		emfMap.put("modNm", lgnMap.getString("name"));
		emfMap.put("modIp", EMFStringUtil.nvl(lgnMap.getString("loginIp"), EgovNetworkState.getMyIPaddress(multiRequest)));

		cOCBoardMngDAO.insertBoardArticle(emfMap);	
	}
	
	/**
	 * 게시물을 수정한다.
	 * 
	 * @param EmfMap 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateBoardArticle(EmfMap emfMap, MultipartHttpServletRequest multiRequest) throws Exception
	{		
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		EmfMap boardInfo = cOCBoardMngDAO.selectBoardRead(emfMap);
			
		if(lgnMap.getString("id").equals(boardInfo.getString("regid")))
		{
			//첨부파일 업로드
			final Map<String, MultipartFile> files = multiRequest.getFileMap();	
			
			if(!files.isEmpty())
			{
				List<EmfMap> atchFileList = null;
				String atchFileId = null;
		
				String pAtchFileId = emfMap.getString("atchFileId");
			
				if(!"".equals(EMFStringUtil.nullConvert(pAtchFileId)))
				{
					long fileSize = 0;
					
					if(!"".equals(emfMap.getString("fileSize")))
					{
			    		int size = Integer.parseInt(emfMap.getString("fileSize"));
			    		fileSize = size * 1024 * 1024;
					}
					
					String filePossibleExtNm = emfMap.getString("filePossibleExtNm");
					
					//int nxtFileSeq = fileMngService.getMaxFileSeq(emfMap);
					
					if(filePossibleExtNm.indexOf(",") > 0)
					{
						atchFileList = fileUtil.parseFileInf(files, "", 0, pAtchFileId, "Globals.fileStorePath", "atchFile", fileSize, filePossibleExtNm.split(","));
					}
					else
					{
						atchFileList = fileUtil.parseFileInf(files, "", 0, pAtchFileId, "Globals.fileStorePath", "atchFile", fileSize, new String[]{filePossibleExtNm});
					}	
					
					if(files.size() == atchFileList.size()) 
	    			{
						fileMngService.updateFileInfs(atchFileList);
	    			} 
	    			else 
	    			{						
	    				throw new FileNotSizeException("파일용량초과");
	    			}
				}
				else
				{
					atchFileList = fileUtil.parseFileInf(files, "", 0, "", "Globals.fileStorePath", "atchFile", Integer.parseInt(atchFileSize), atchFileExtns);
	    			
	    			if(files.size() == atchFileList.size()) 
	    			{
	    				atchFileId = fileMngService.insertFileInfs(atchFileList);
	    				emfMap.put("atchFileId", atchFileId);
	    			} 
	    			else 
	    			{						
	    				throw new FileNotSizeException("파일용량초과");
	    			}
				}
			}
			
			//첨부파일 삭제
			EmfMap delFileMap = new EmfMap();
			
			String[] delFileSeqArr = multiRequest.getParameterValues("delFileSeq");
			
			if(delFileSeqArr != null && delFileSeqArr.length > 0) 
			{
				String pAtchFileId = emfMap.getString("atchFileId");
				
				if(!"".equals(EgovStringUtil.nullConvert(pAtchFileId)))
				{
					delFileMap.put("atchFileId", pAtchFileId);
					
					for (int i = 0; i < delFileSeqArr.length; i++) 
	    			{
						delFileMap.put("fileSeq", delFileSeqArr[i]);
	    				fileMngService.deleteFileInf(delFileMap);
	    			} 
					
					int fileNum = fileMngService.getFileListCnt(pAtchFileId);
					
					if (fileNum == 0) 
	    			{
	    				fileMngService.deleteAllFileInf(delFileMap);
	    				emfMap.put("atchFileId", null);
	    			}
				}
			}
			
			emfMap.put("notifyYn", EMFStringUtil.nvl(emfMap.getString("notifyYn"), "N"));
			emfMap.put("openYn", EMFStringUtil.nvl(emfMap.getString("openYn"), "Y"));
			emfMap.put("odtmYn", EMFStringUtil.nvl(emfMap.getString("odtmYn"), "N"));

			if(Integer.parseInt(emfMap.getString("approvalAuthority")) > 0)
			{
				emfMap.put("useYn", EMFStringUtil.nvl(emfMap.getString("useYn"), "Y"));
			}
			else
			{
				emfMap.put("useYn", EMFStringUtil.nvl(emfMap.getString("useYn"), "Y"));
			}
			
			emfMap.put("modId", EMFStringUtil.nvl(lgnMap.getString("id"), ""));
			emfMap.put("modNm", EMFStringUtil.nvl(lgnMap.getString("name"), ""));
			emfMap.put("modIp", EMFStringUtil.nvl(lgnMap.getString("loginIp"), ""));

			cOCBoardMngDAO.updateBoardArticle(emfMap);
		}
		else
		{
			throw new Exception("인증오류");
		}
	}
	
	/**
	 * 게시글 삭제한다.
	 * 
	 * @param EmfMap 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	public void deleteBoardArticle(EmfMap emfMap) throws Exception
	{
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		EmfMap boardInfo = cOCBoardMngDAO.selectBoardRead(emfMap);
			
		if(lgnMap.getString("id").equals(boardInfo.getString("regid")))
		{
			cOCBoardMngDAO.deleteBoardArticle(emfMap);
		}
		else
		{
			throw new Exception("인증오류");
		}
	}  	

	/**
	 * 카테고리 구분 값을 가져온다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return List<EmfMap> 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectCategoryGbList(String categoryId) throws Exception
	{
		return cOCBoardMngDAO.selectCategoryGbList(categoryId);
	}	
}
