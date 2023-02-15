package front.ml.mlc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.MailService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.com.utl.sim.service.SeedCipher;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.co.util.COPaginationUtil;
import front.ml.mlc.service.MLCPfmcRsvtnService;
import front.ml.mlc.service.dao.MLCPfmcRsvtnDAO;

/**
 * <pre> 
 * 공연 예약을 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: MLCPfmcRsvtnServiceImpl.java
 * @Description		: 공연 예약을 위한 ServiceImpl
 * @author 허진영
 * @since 2016.02.26
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.02.26		   허진영				  최초 생성
 * </pre>
 */  
@Service("mLCPfmcRsvtnService")
public class MLCPfmcRsvtnServiceImpl extends EmfAbstractService implements MLCPfmcRsvtnService {
	
	@Resource(name="mLCPfmcRsvtnDAO")
	private MLCPfmcRsvtnDAO mLCPfmcRsvtnDAO;
	
	@Resource(name="mailService")
	private MailService mailService;
	
	private String ENCODE = EgovProperties.getProperty("Global.CHARCODE");
	
	/**
	 * 공연 예약 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPfmcRsvtnList(EmfMap emfMap) throws Exception
	{    	
		PaginationInfo paginationInfo = new COPaginationUtil().getPage(emfMap);
		
		//페이징 처리
		emfMap.put("paginationInfo", paginationInfo);
		
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("id", lgnMap.getString("id"));
		
		//리스트 가져오기
		List<EmfMap> list = mLCPfmcRsvtnDAO.selectPfmcRsvtnList(emfMap);
		
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
	 * 공연 예약 상세를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPfmcRsvtn(EmfMap emfMap) throws Exception
	{    	
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("id", lgnMap.getString("id"));
		
		emfMap.put("rsvtnInfo", mLCPfmcRsvtnDAO.selectPfmcRsvtn(emfMap));
		
    	return emfMap;
    }
	
	/**
	 * 공연 예약을 취소한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updatePfmcRsvtnCancel(EmfMap emfMap) throws Exception
	{    	
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("id", lgnMap.getString("id"));
		emfMap.put("modId", lgnMap.getString("id"));
		emfMap.put("modIp", lgnMap.getString("ip"));
				
		//공연 예약을 취소한다.
		mLCPfmcRsvtnDAO.updatePfmcRsvtnCancel(emfMap);
		
		//공연 예약 처리현황 로그를 등록한다.
		mLCPfmcRsvtnDAO.insertRsvtnPrcsLog(emfMap);
		
		//메일발송을 위해 사용자정보를 가져온다.
		EmfMap rsvtnInfo = mLCPfmcRsvtnDAO.selectPfmcRsvtn(emfMap);
		
		if(!"".equals(EMFStringUtil.nullConvert(rsvtnInfo.get("email"))))
		{
			EmfMap mailMap = new EmfMap();
			
			mailMap.put("subject", "[대명아임레디 예약 취소 안내] 메일입니다.");
			//2017.04.25 박주석 디아모 적용
			mailMap.put("toUser", rsvtnInfo.getString("email") );
//			mailMap.put("toUser", SeedCipher.decrypt(rsvtnInfo.getString("email"), ENCODE));
			mailMap.put("name", rsvtnInfo.getString("name"));
			mailMap.put("pfmcNm", rsvtnInfo.getString("pfmcNm"));
			mailMap.put("seatCnt", rsvtnInfo.getString("seatCnt"));
			mailMap.put("seatGb", rsvtnInfo.getString("seatGb"));
			
			if(!"".equals(rsvtnInfo.getString("lastRsvtnDtm")))
			{
				mailMap.put("rsvtnDtm", EgovDateUtil.convertDate(rsvtnInfo.getString("lastRsvtnDtm"), "yyyy-MM-dd HH:mm:ss", "yyyy년 MM월 dd일(EE) HH시 mm분", ""));
			}
			else
			{
				mailMap.put("rsvtnDtm", EgovDateUtil.convertDate(rsvtnInfo.getString("fstRsvtnDtm"), "yyyy-MM-dd HH:mm:ss", "yyyy년 MM월 dd일(EE) HH시 mm분", ""));
			}
			
			mailMap.put("reqn", rsvtnInfo.getString("reqn").replace(System.getProperty("line.separator"), "<br />"));
			
			mailService.sendTempleteMail(mailMap, "ml/mlc/MLCRsvtnCnclGuide.html");
		}
    }
}
