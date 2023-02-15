package front.ml.mli.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.co.util.COPaginationUtil;
import front.ml.mli.service.dao.MLICustVoiceDAO;
import front.ml.mli.service.MLICustVoiceService;

/**
 * <pre> 
 * 고객의 소리 접수내역 조회를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: MLICustVoiceServiceImpl.java
 * @Description		: 고객의 소리 접수내역 조회를 위한 ServiceImpl
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
@Service("mLICustVoiceService")
public class MLICustVoiceServiceImpl extends EmfAbstractService implements MLICustVoiceService {	
	
	@Resource(name="mLICustVoiceDAO")
	private MLICustVoiceDAO mLICustVoiceDAO;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;
	
	/**
	 * 고객의 소리 접수내역 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectCustVoiceList(EmfMap emfMap) throws Exception
	{
		PaginationInfo paginationInfo = new COPaginationUtil().getPage(emfMap);
		
		//페이징 처리
		emfMap.put("paginationInfo", paginationInfo);

		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("id", lgnMap.getString("id"));
		
		//리스트 가져오기
		List<EmfMap> list = mLICustVoiceDAO.selectCustVoiceList(emfMap);
		
		emfMap.put("list", list);
		
		if(list.size() > 0)
		{
			paginationInfo.setTotalRecordCount(Integer.parseInt(list.get(0).getString("totCnt")));
		}
		else
		{
			paginationInfo.setTotalRecordCount(0);
		}
		
		/*
		 홈페이지 개인정보 로그 - 보안관련 로직 신규 구현
		 2017.12.26
		 */
		EmfMap logMap = new EmfMap();
		logMap.put("ip", RequestContextHolder.getRequestAttributes().getAttribute("logIp", RequestAttributes.SCOPE_SESSION));
		logMap.put("gubun", "나의 라이프웨이 - 고객의 소리 접수내역 조회");
		logMap.put("flag", "S");
		logMap.put("pageGubun", "H");
		logMap.put("name", lgnMap.get("name"));
		logMap.put("hp", lgnMap.get("hp"));
		logMap.put("id", lgnMap.get("id"));
		cmmUseService.actionViewAuthLog(logMap);
		
		return emfMap;
	}
	
	/**
	 * 고객의 소리 접수내역 상세를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectCustVoice(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("id", lgnMap.getString("id"));
		
		emfMap.put("custVoiceInfo", mLICustVoiceDAO.selectCustVoice(emfMap));
		
		emfMap.put("custVoiceLog", mLICustVoiceDAO.selectCustVoiceLog(emfMap));
		
		return emfMap;
	}
}
