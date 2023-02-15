/**
 * 
 */
package front.co.coc.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.co.coc.service.COCBoardCommentService;
import front.co.coc.service.dao.COCBoardCommentDAO;
import front.co.util.COPaginationUtil;
import front.lg.sso.exception.SsoException;
import front.lg.sso.service.SSOService;

/**
 * <pre> 
 * 게시글 댓글 관리를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: COCBoardCommentServiceImpl.java
 * @Description		: 게시글 댓글 관리를 위한 ServiceImpl
 * @author 허진영
 * @since 2016.04.12
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				  description
 *   ==========    ==============    =============================
 *   2016.04.12		   허진영				   최초 생성
 * </pre>
 */
@Service("cOCBoardCommentService")
public class COCBoardCommentServiceImpl extends EmfAbstractService implements COCBoardCommentService {
		
	@Resource(name="cOCBoardCommentDAO")
	private COCBoardCommentDAO cOCBoardCommentDAO;

	@Resource(name="BoardCommentIdgen")
	private EgovTableIdGnrService boardCommentIdgen;		
	
	@Resource(name="ssoService")
	private SSOService ssoService;
	
	/**
	 * 게시글에 대한 댓글 목록을 조회힌다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return EmfMap 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectBoardCommentList(EmfMap emfMap) throws Exception
	{
		PaginationInfo paginationInfo = new COPaginationUtil().getPage(emfMap);
		
		//페이징 처리
		emfMap.put("paginationInfo", paginationInfo);
		
		//리스트 가져오기
		List<EmfMap> list = cOCBoardCommentDAO.selectBoardCommentList(emfMap);
		
		emfMap.put("list", list);
		
		if(list.size() > 0)
		{
			for (int j=0; j<list.size(); j++) { 
				String homepageCI = list.get(j).getString("ci");
				try
				{
					if(!"".equals(homepageCI)) {
						HashMap ssoMemberInfo = ssoService.find("", null, homepageCI, "0.0.0.0");
						if(ssoMemberInfo != null) {
							list.get(j).put("regid", (String)ssoMemberInfo.get("id"));
						}
					}
				}
				catch (SsoException ex)
				{
					ex.printStackTrace();
				}
			}
			paginationInfo.setTotalRecordCount(Integer.parseInt(list.get(0).getString("totCnt")));
		}
		else
		{
			paginationInfo.setTotalRecordCount(0);
		}
		
		return emfMap;
	}    

	/**
	 * 게시글에 대한 댓글을 등록한다.
	 * 
	 * @param EmfMap 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertBoardComment(EmfMap emfMap) throws Exception
	{		
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(lgnMap != null)
		{
			int idx = boardCommentIdgen.getNextIntegerId();
			
			emfMap.put("cidx", idx);
			emfMap.put("groupId", EMFStringUtil.nvl(emfMap.getString("groupId"), String.valueOf(idx)));
			emfMap.put("reDepth", EMFStringUtil.nvl(emfMap.getString("reDepth"), String.valueOf(0)));
			emfMap.put("regId", lgnMap.getString("id"));
			emfMap.put("regNm", lgnMap.getString("name"));
			emfMap.put("regIp", lgnMap.getString("loginIp"));
			emfMap.put("modId", lgnMap.getString("id"));
			emfMap.put("modNm", lgnMap.getString("name"));
			emfMap.put("modIp", lgnMap.getString("loginIp"));

	  		cOCBoardCommentDAO.insertBoardComment(emfMap);
		}
	}
	
	/**
	 * 게시글에 대한 댓글을 수정한다.
	 * 
	 * @param EmfMap 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateBoardComment(EmfMap emfMap) throws Exception
	{		
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(lgnMap != null)
		{
			EmfMap cmtInfo = cOCBoardCommentDAO.selectBoardComment(emfMap);
			
			if(cmtInfo != null && lgnMap.getString("id").equals(cmtInfo.getString("regid"))) 
			{
				emfMap.put("modId", lgnMap.getString("id"));
				emfMap.put("modNm", lgnMap.getString("name"));
				emfMap.put("modIp", lgnMap.getString("loginIp"));
				
				cOCBoardCommentDAO.updateBoardComment(emfMap);
			}
		}
	}
	
	/**
	 * 게시글에 대한 댓글을 삭제한다.
	 * 
	 * @param EmfMap 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void deleteBoardComment(EmfMap emfMap) throws Exception
	{		
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		if(lgnMap != null)
		{
			EmfMap cmtInfo = cOCBoardCommentDAO.selectBoardComment(emfMap);
			
			if(cmtInfo != null && lgnMap.getString("id").equals(cmtInfo.getString("regid"))) 
			{
				cOCBoardCommentDAO.deleteBoardComment(emfMap);
			}
		}
	}
}
