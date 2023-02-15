package front.ml.mlf.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.co.util.COPaginationUtil;
import front.ml.mlf.service.MLFPrsnCnslService;
import front.ml.mlf.service.dao.MLFPrsnCnslDAO;

/**
 * <pre> 
 * 1:1 상담내역 조회를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: MLFPrsnCnslServiceImpl.java
 * @Description		: 1:1 상담내역 조회를 위한 ServiceImpl
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
@Service("mLFPrsnCnslService")
public class MLFPrsnCnslServiceImpl extends EmfAbstractService implements MLFPrsnCnslService {	
	
	@Resource(name="mLFPrsnCnslDAO")
	private MLFPrsnCnslDAO mLFPrsnCnslDAO;
	
	/**
	 * 1:1 상담내역 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPrsnCnslList(EmfMap emfMap) throws Exception
	{
		PaginationInfo paginationInfo = new COPaginationUtil().getPage(emfMap);
		
		//페이징 처리
		emfMap.put("paginationInfo", paginationInfo);

		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("id", lgnMap.getString("id"));
		
		//리스트 가져오기
		List<EmfMap> list = mLFPrsnCnslDAO.selectPrsnCnslList(emfMap);
		
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
	 * 1:1 상담내역 상세를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPrsnCnsl(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("id", lgnMap.getString("id"));
		
		emfMap.put("prsnCnslInfo", mLFPrsnCnslDAO.selectPrsnCnsl(emfMap));
		
		emfMap.put("prsnCnslLog", mLFPrsnCnslDAO.selectPrsnCnslLog(emfMap));
		
		return emfMap;
	}
}
