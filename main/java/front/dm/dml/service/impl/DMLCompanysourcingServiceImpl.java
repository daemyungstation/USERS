package front.dm.dml.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.MailService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.dm.dml.service.DMLCompanysourcingService;
import front.dm.dml.service.dao.DMLCompanysourcingDAO;
import front.lp.service.DmLifeService;

/**
 * <pre> 
 * 외주업체 상담 신청을 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: OCAOutsourcingServiceImpl.java
 * @Description		: 외주업체 상담 신청을 위한 ServiceImpl
 * @author 김필기
 * @since 2016.03.23
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.23		   김필기				  최초 생성
 * </pre>
 */  
@Service("dMLCompanysourcingService")
public class DMLCompanysourcingServiceImpl extends EmfAbstractService implements DMLCompanysourcingService {
	
	@Resource(name="dMLCompanysourcingDAO")
	private DMLCompanysourcingDAO dMLCompanysourcingDAO;
	
	@Resource(name="outsourcingIdgen")
	private EgovTableIdGnrService outsourcingIdgen;	
	
	@Resource(name="dMLifeService")
    private DmLifeService dMLifeService;
	
	// 메일 서비스
	@Resource(name="mailService")
    private MailService mailService;
	

	/**
     * 임동진테스트
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */

	public EmfMap selectLdjList(EmfMap emfMap) throws Exception
	{
		//리스트 가져오기
		List<EmfMap> list = dMLCompanysourcingDAO.selectLdjList(emfMap);
		
		emfMap.put("list", list);
		
		return emfMap;
	}
	
	/**
     * EIS화면 개발
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */

	public EmfMap selectEisList(EmfMap emfMap) throws Exception
	{
		//리스트 가져오기
		List<EmfMap> list = dMLCompanysourcingDAO.selectEisList(emfMap);
		
		emfMap.put("list", list);
		
		return emfMap;
	}
		
	
	/**
     * 임동진의전정보
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */

	public EmfMap selectLdj_Event_List(EmfMap emfMap) throws Exception
	{
		//리스트 가져오기
		List<EmfMap> list = dMLCompanysourcingDAO.selectLdj_Event_List(emfMap);
		
		emfMap.put("list", list);
		
		return emfMap;
	}	
	
	/**
     * 투어몰 회원번호 검색
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */

	public EmfMap selectLdj_Tour_List(EmfMap emfMap) throws Exception
	{
		//리스트 가져오기
		List<EmfMap> list = dMLCompanysourcingDAO.selectLdj_Tour_List(emfMap);
		
		emfMap.put("list", list);
		
		return emfMap;
	}	
	
	public EmfMap select_SDP_CHECK_List(EmfMap emfMap) throws Exception
	{
		//리스트 가져오기
		List<EmfMap> list = dMLCompanysourcingDAO.select_SDP_CHECK_List(emfMap);
		
		emfMap.put("list", list);
		
		return emfMap;
	}

	@Override
	public EmfMap select_THEONE_CHECK_List(EmfMap emfMap) throws Exception {
		//리스트 가져오기
		List<EmfMap> list = dMLCompanysourcingDAO.select_THEONE_CHECK_List(emfMap);
		
		emfMap.put("list", list);
		
		return emfMap;
	}
	
	/**
	 * 고유번호 확인요청을 등록한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap insertChkReqn(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("id", lgnMap.getString("id"));
		
		int chkReqnCnt = dMLCompanysourcingDAO.selectChkReqnCnt(emfMap);
		
		if(chkReqnCnt > 0)
		{
			emfMap.put("chkReqnYn", "N");
		}
		else
		{
			//emfMap.put("reqnSeq", chkReqnIdgen.getNextIntegerId());
			//emfMap.put("regId", lgnMap.getString("id"));
			//emfMap.put("regIp", lgnMap.getString("loginIp"));
			//emfMap.put("modId", lgnMap.getString("id"));
			//emfMap.put("modIp", lgnMap.getString("loginIp"));
			
			//mLMyLifewayDAO.insertChkReqn(emfMap);
			
			emfMap.put("chkReqnYn", "Y");
		}
		
		return emfMap;
	}
	
	/**
	 * 고유번호 확인요청을 등록한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectShopIdCheck(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		//EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		//emfMap.put("id", lgnMap.getString("id"));
		
		String strMemNo =  dMLCompanysourcingDAO.selectIdCheck(emfMap);
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>     " + strMemNo);
		
		emfMap.put("memno", strMemNo);
		
		return emfMap;
	}
	
	/**
     * 일별 만기방어 리스트
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */

	public EmfMap selectResnProtectList(EmfMap emfMap) throws Exception
	{
		//리스트 가져오기
		List<EmfMap> list = dMLCompanysourcingDAO.selectResnProtectList(emfMap);
		
		emfMap.put("list", list);
		
		return emfMap;
	}	
}
