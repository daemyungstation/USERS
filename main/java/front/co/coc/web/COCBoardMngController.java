/**
 * 
 */
package front.co.coc.web;

import java.io.FileNotFoundException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import emf.core.exception.EmfException;
import emf.core.extend.web.EmfController;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.co.coc.service.COCBoardMngService;

/**
 * <pre> 
 * 게시글 관리를 위한 Controller
 * </pre>
 * 
 * @ClassName		: COCBoardMngController
 * @Description		: 게시글 관리를 위한 Controller
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
@Controller
public class COCBoardMngController extends EmfController {
	
	/** 서비스 **/
	@Resource(name="cOCBoardMngService")
	private COCBoardMngService cOCBoardMngService;
	
    /** 파일정보 **/
    @Resource(name="EgovFileMngService")
    private EgovFileMngService egovFileMngService;
    
    /** 파일 전용 객채 **/
	@Resource(name="EgovFileMngUtil")
    private EgovFileMngUtil fileUtil;    
	
	/**
     * 게시글 목록 조회
     * 
     * @param EmfMap 데이터
	 * @return String 뷰 URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/**/communityid/{communityid}/list.do")
	public String selectBoardList(HttpServletRequest request, EmfMap emfMap, ModelMap modelMap, @PathVariable int communityid) throws Exception
	{
		try
		{
			emfMap.put("communityId", communityid);
			
			EmfMap mstInfo = cOCBoardMngService.selectMaster(emfMap);  
			
			if(mstInfo != null && "Y".equals(mstInfo.getString("useYn")))
			{
				if(Integer.parseInt(EMFStringUtil.nvl(mstInfo.getString("listUserAuthority"), "0")) > 0)
				{
					if(!EgovUserDetailsHelper.isAuthenticated())
					{
						modelMap.addAttribute("msg", "로그인이 필요한 페이지입니다.");
						//modelMap.addAttribute("url", "/member/login/Login.do");
						modelMap.addAttribute("url", "/member/login/Login.do?vwUrl=" + request.getRequestURI());
						return "error/blank.error";
					}
				}
				
				//검색어 체크
				String f = emfMap.getString("f");
				String q = emfMap.getString("q");
				
				if(!"".equals(EMFStringUtil.nullConvert(q)) && q.length() <= 15)
				{
					emfMap.put("f", f);
					emfMap.put("q", q);
				}
				else
				{
					emfMap.put("f", "");
					emfMap.put("q", "");
				}				
	
				emfMap.put("tablenm", mstInfo.getString("tablenm"));
				emfMap.put("cntPage", mstInfo.getString("pageRowCnt"));

				EmfMap rtnMap = cOCBoardMngService.selectBoardList(emfMap);
				
				modelMap.addAttribute("rtnMap", rtnMap);									
				modelMap.addAttribute("mstInfo", mstInfo);	
				
				if("Y".equals(mstInfo.getString("categoryYn")))
				{
					modelMap.addAttribute("ctgrList", cOCBoardMngService.selectCategoryGbList(mstInfo.getString("categoryId")));
				}
			}
			else
			{
				throw new FileNotFoundException();
			}
		}
		catch(Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		}
		
		return "front/co/coc/list/COCBoardList.front";
	}
	
	/**
     * 게시글 보기
     * 
     * @param EmfMap 데이터
	 * @return String 뷰 URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/**/communityid/{communityid}/view.do")
	public String getBoardViewPage(HttpServletRequest request, EmfMap emfMap, ModelMap modelMap, @PathVariable int communityid) throws Exception
	{
		String url = "error/blank.error";
		
		try
		{
			emfMap.put("communityId", communityid);
			
			EmfMap mstInfo = cOCBoardMngService.selectMaster(emfMap);  
			
			if(mstInfo != null && "Y".equals(mstInfo.getString("useYn")))
			{
				if(Integer.parseInt(EMFStringUtil.nvl(mstInfo.getString("viewUserAuthority"), "0")) > 0)
				{
					if(!EgovUserDetailsHelper.isAuthenticated())
					{
						modelMap.addAttribute("msg", "로그인이 필요한 페이지입니다.");
						//modelMap.addAttribute("url", "/member/login/Login.do");
						modelMap.addAttribute("url", "/member/login/Login.do?vwUrl=" + request.getRequestURI());
						return "error/blank.error";
					}
				}
				
				emfMap.put("tablenm", mstInfo.getString("tablenm"));
				emfMap.put("communityType", mstInfo.getString("communityType"));
				emfMap.put("poorWordNm", mstInfo.getString("poorWordNm"));

				EmfMap rtnMap = cOCBoardMngService.selectBoardRead(emfMap);
				
				modelMap.addAttribute("rtnMap", rtnMap);		
				modelMap.addAttribute("mstInfo", mstInfo);
				
				url = "front/co/coc/view/COCBoardView.front";
			}
			else
			{
				throw new FileNotFoundException();
			}
		}
		catch(Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			
			if("비공개오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "비공개 글입니다.");
				modelMap.addAttribute("url", "./list.do");
			}
			else
			{
				throw new EmfException(he.getMessage());
			}
		}
		
		return url;
	}
	
	/**
     * 게시글 쓰기, 수정 페이지
     * 
     * @param EmfMap 데이터
	 * @return String 뷰 URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/**/communityid/{communityid}/write.do")	
	public String selectBoardRead(HttpServletRequest request, EmfMap emfMap, ModelMap modelMap, @PathVariable int communityid) throws Exception
	{
		String url = "error/blank.error";
		//getLoginView(null, null)
		try
		{
			emfMap.put("communityId", communityid);
			
			EmfMap mstInfo = cOCBoardMngService.selectMaster(emfMap);
			
			if(mstInfo != null && "Y".equals(mstInfo.getString("useYn")))
			{
				if(Integer.parseInt(EMFStringUtil.nvl(mstInfo.getString("writeUserAuthority"), "0")) > 0)
				{
					if(!EgovUserDetailsHelper.isAuthenticated())
					{
						modelMap.addAttribute("msg", "로그인이 필요한 페이지입니다.");
						//modelMap.addAttribute("url", "/member/login/Login.do");
						modelMap.addAttribute("url", "/member/login/Login.do?vwUrl=" + request.getRequestURI());
						
						return "error/blank.error";
					}else{ 
				
						emfMap.put("tablenm", mstInfo.getString("tablenm"));
						emfMap.put("communityType", mstInfo.getString("communityType"));
						emfMap.put("poorWordNm", mstInfo.getString("poorWordNm"));
										
						EmfMap rtnMap = cOCBoardMngService.selectBoardRead(emfMap);
						
						if("Y".equals(mstInfo.getString("categoryYn")))
						{
							modelMap.addAttribute("ctgrList", cOCBoardMngService.selectCategoryGbList(mstInfo.getString("categoryId")));
						}
						
						modelMap.addAttribute("rtnMap", rtnMap);		
						modelMap.addAttribute("mstInfo", mstInfo);	
						
						url = "front/co/coc/write/COCBoardWrite.front";						
					}
				}else{
					modelMap.addAttribute("msg", "잘못된 접근입니다.");
					modelMap.addAttribute("url", "./list.do");
				}
			}
		}
		catch(Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			
			if("비공개오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "비공개 글입니다.");
				modelMap.addAttribute("url", "./list.do");
			}
			else
			{
				throw new EmfException(he.getMessage());
			}
		}	
		
		return url;	
	}
	
	/**
     * 게시글을 등록한다.
     * 
     * @param EmfMap 데이터
	 * @return String 뷰 URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	@RequestMapping(value="/**/communityid/{communityid}/insert.do", method=RequestMethod.POST)
	public String insertBoardArticle(EmfMap emfMap, ModelMap modelMap, @PathVariable int communityid, MultipartHttpServletRequest multiRequest) throws Exception
	{			
		String url = "error/blank.error";
		 
		try
		{
			emfMap.put("communityId", communityid);
			
			EmfMap mstInfo = cOCBoardMngService.selectMaster(emfMap);		
			
			if(mstInfo != null && "Y".equals(mstInfo.getString("useYn")))
			{
				if(Integer.parseInt(EMFStringUtil.nvl(mstInfo.getString("writeUserAuthority"), "0")) > 0)
				{
					if(!EgovUserDetailsHelper.isAuthenticated())
					{
						modelMap.addAttribute("msg", "로그인이 필요한 페이지입니다.");
						modelMap.addAttribute("url", "/member/login/Login.do");
						return "error/blank.error";
					}else{
						emfMap.put("tablenm", mstInfo.getString("tablenm"));
						emfMap.put("approvalAuthority", mstInfo.getString("approvalAuthority"));
						emfMap.put("fileSize", mstInfo.getString("fileSize"));
						emfMap.put("filePossibleExtNm", mstInfo.getString("filePossibleExtNm"));

						cOCBoardMngService.insertBoardArticle(emfMap, multiRequest);
						
						modelMap.addAttribute("msg", "등록되었습니다.");
						modelMap.addAttribute("url", "./list.do");
					}
				}else{
					modelMap.addAttribute("msg", "잘못된 접근입니다.");
					modelMap.addAttribute("url", "./list.do");
				}
			}
			else
			{
				throw new FileNotFoundException();
			}
		}
		catch(Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			
			if("인증오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "잘못된 접근입니다.");
				modelMap.addAttribute("url", "/");
			}
			else if("파일용량초과".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "파일 용량이 초과되었습니다.");
				modelMap.addAttribute("url", "javascript:history.back();");
			}
			else
			{
				throw new EmfException(he.getMessage());
			}
		}
		 
		return url;
	}	
	
	/**
     * 게시글을 수정한다.
     * 
     * @param EmfMap 데이터
	 * @return String 뷰 URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	@RequestMapping(value="/**/communityid/{communityid}/update.do", method=RequestMethod.POST)
	public String updateBoardArticle(EmfMap emfMap, ModelMap modelMap, @PathVariable int communityid, final MultipartHttpServletRequest multiRequest) throws Exception
	{			
		String url = "error/blank.error";
		
		try
		{
			emfMap.put("communityId", communityid);
			
			EmfMap mstInfo = cOCBoardMngService.selectMaster(emfMap);		
			
			if(mstInfo != null && "Y".equals(mstInfo.getString("useYn")))
			{
				if(Integer.parseInt(EMFStringUtil.nvl(mstInfo.getString("writeUserAuthority"), "0")) > 0)
				{
					if(!EgovUserDetailsHelper.isAuthenticated())
					{
						modelMap.addAttribute("msg", "로그인이 필요한 페이지입니다.");
						modelMap.addAttribute("url", "/member/login/Login.do");
						return "error/blank.error";
					}
				}
				
				emfMap.put("tablenm", mstInfo.getString("tablenm"));
				emfMap.put("approvalAuthority", mstInfo.getString("approvalAuthority"));
				emfMap.put("fileSize", mstInfo.getString("fileSize"));
				emfMap.put("filePossibleExtNm", mstInfo.getString("filePossibleExtNm"));

				cOCBoardMngService.updateBoardArticle(emfMap, multiRequest);
				
				modelMap.addAttribute("msg", "수정되었습니다.");
				modelMap.addAttribute("url", "./view.do?idx=" + emfMap.getString("idx"));
			}
			else
			{
				throw new FileNotFoundException();
			}
		}
		catch(Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			
			if("인증오류".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "잘못된 접근입니다.");
				modelMap.addAttribute("url", "/");
			}
			else if("파일용량초과".equals(EgovStringUtil.nullConvert(he.getMessage())))
			{
				modelMap.addAttribute("msg", "파일 용량이 초과되었습니다.");
				modelMap.addAttribute("url", "javascript:history.back();");
			}
			else
			{
				throw new EmfException(he.getMessage());
			}
		}
		 
		return url;
	}
	
	/**
     * 게시글 삭제
     * 
     * @param EmfMap 검색데이터
	 * @return String View URL
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */    
	@RequestMapping(value="/**/communityid/{communityid}/delete.do", method=RequestMethod.POST)
	public String deleteBoardArticle(EmfMap emfMap, ModelMap modelMap, @PathVariable int communityid) throws Exception
	{	
		String url = "error/blank.error";
		
		try
		{		
			emfMap.put("communityId", communityid);
			
			EmfMap mstInfo = cOCBoardMngService.selectMaster(emfMap); 
			
			if(mstInfo != null && "Y".equals(mstInfo.getString("useYn")))
			{
				if(Integer.parseInt(EMFStringUtil.nvl(mstInfo.getString("writeUserAuthority"), "0")) > 0)
				{
					if(!EgovUserDetailsHelper.isAuthenticated())
					{
						modelMap.addAttribute("msg", "로그인이 필요한 페이지입니다.");
						modelMap.addAttribute("url", "/member/login/Login.do");
						return "error/blank.error";
					}
				}
				
				emfMap.put("tablenm", mstInfo.getString("tablenm"));
				
				cOCBoardMngService.deleteBoardArticle(emfMap);
				
				modelMap.addAttribute("msg", "삭제되었습니다.");
				modelMap.addAttribute("url", "./list.do");
			}
			else
			{
				throw new FileNotFoundException();
			}
		}
		catch(Exception he)
		{
			if (log.isDebugEnabled()) 
			{
				log.debug(he);
            }
			throw new EmfException(he.getMessage());
		}
		
		return url;
	}	
}