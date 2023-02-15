package front.ml.mlc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.MailService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.com.utl.sim.service.SeedCipher;
import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.ml.mla.service.MLAAcntChngService;
import front.ml.mlc.service.MLCPfmcInfService;
import front.ml.mlc.service.MLCPfmcRsvtnService;
import front.ml.mlc.service.dao.MLCOutMemInfDAO;
import front.ml.mlc.service.dao.MLCPfmcInfDAO;

/**
 * <pre> 
 * 공연 예약을 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: MLCPfmcInfServiceImpl.java
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
@Service("mLCPfmcInfService")
public class MLCPfmcInfServiceImpl extends EmfAbstractService implements MLCPfmcInfService {
	
	@Resource(name="mLCPfmcInfDAO")
	private MLCPfmcInfDAO mLCPfmcInfDAO;
	
	@Resource(name="mLCOutMemInfDAO")
	private MLCOutMemInfDAO mLCOutMemInfDAO;
	
	@Resource(name="mLAAcntChngService")
	private MLAAcntChngService mLAAcntChngService;
	
	@Resource(name="mLCPfmcRsvtnService")
	private MLCPfmcRsvtnService mLCPfmcRsvtnService;
	
	@Resource(name="mailService")
	private MailService mailService;
	
	@Resource(name="rsvtnIdgen")
	private EgovTableIdGnrService rsvtnIdgen;	
	
	private String ENCODE = EgovProperties.getProperty("Global.CHARCODE");
	
	/**
	 * 공연정보 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPfmcInfList(EmfMap emfMap) throws Exception
	{    	
		//리스트 가져오기
		List<EmfMap> list = mLCPfmcInfDAO.selectPfmcInfList(emfMap);
		
		emfMap.put("list", list);
		
		if(list.size() > 0 && !"Y".equals(emfMap.getString("mbspSrvcYn")))
		{
			//로그인 정보 가져오기
			EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
			
			emfMap.put("memNo", lgnMap.getString("unqNo"));
			
			emfMap.put("memList", mLAAcntChngService.selectJoinPrdctList(emfMap));
		}
		
    	return emfMap;
    }
	
	/**
	 * 공연정보 상세를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPfmcInf(EmfMap emfMap) throws Exception
	{
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("memNo", lgnMap.getString("unqNo"));
		emfMap.put("id", lgnMap.getString("id"));
		
		EmfMap memInfo = mLCOutMemInfDAO.selectOutMemInf(emfMap);
		
		String currDt = EgovDateUtil.getToday();
		String truePayDt = memInfo.getString("truePayDt");
		
		if(!"정상".equals(memInfo.getString("accStat")) || memInfo.getString("payStat").indexOf("연체") > -1)
		{
			if("".equals(truePayDt))
			{
				throw new Exception("실납입오류");
			}
			else if(memInfo.getString("accStat").indexOf("행사") > -1)
			{
				if(Integer.parseInt(EgovDateUtil.addYear(truePayDt, 5)) < Integer.parseInt(currDt))
				{
					throw new Exception("행사오류");
				}
			}
			else
			{
				throw new Exception("회원상태오류");
			}
		}
		
		EmfMap checkMonth = mLCPfmcInfDAO.getCheckMonth(emfMap);	// 아이디 + 회원번호 월 1회 제한
		
		if(checkMonth != null)
		{
			throw new Exception("월예약오류");
		}
		else
		{
			EmfMap rsvtnInfo = mLCPfmcInfDAO.getPfmcRsvtnInf(emfMap);
			
			if(rsvtnInfo != null)
			{
				String prcsCd = rsvtnInfo.getString("prcsCd");
				
				if("01".equals(prcsCd) || "02".equals(prcsCd))
				{
					throw new Exception("재예약오류");
				}
				
				if("03".equals(prcsCd))
				{
					String lastRsvtnDt = rsvtnInfo.getString("lastRsvtnDt");
					
					if(!"".equals(lastRsvtnDt) && EgovDateUtil.getDaysDiff(lastRsvtnDt, currDt) > 0)
					{
						String currMm = EgovDateUtil.convertDate(currDt, "yyyyMMdd", "MM", "");
						String lastRsvtnMm = EgovDateUtil.convertDate(lastRsvtnDt, "yyyyMMdd", "MM", "");
						
						if(currMm.equals(lastRsvtnMm))
						{
							throw new Exception("재관람오류");
						}
					}
					else
					{
						throw new Exception("재예약오류");
					}
				}
			}
		}
		
		emfMap.put("pfmcInfo", mLCPfmcInfDAO.selectPfmcInf(emfMap));
			
		emfMap.put("rsvtnDtm", mLCPfmcInfDAO.selectRsvtnDtmList(emfMap));
	
    	return emfMap;
    }
	
	/**
	 * 공연 예약을 등록한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertPfmcRsvtn(EmfMap emfMap) throws Exception
	{    
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("id", lgnMap.getString("id"));
		emfMap.put("regId", lgnMap.getString("id"));
		emfMap.put("regIp", lgnMap.getString("loginIp"));
		emfMap.put("modId", lgnMap.getString("id"));
		emfMap.put("modIp", lgnMap.getString("loginIp"));

		//공연 예약을 등록한다.
		mLCPfmcInfDAO.insertPfmcRsvtn(emfMap);
		
		//공연 예약 처리현황 로그를 등록한다.
		mLCPfmcInfDAO.insertRsvtnPrcsLog(emfMap);
		
		//메일발송을 위해 사용자정보를 가져온다.
		EmfMap tmpMap = mLCPfmcRsvtnService.selectPfmcRsvtn(emfMap);
		
		EmfMap rsvtnInfo = (EmfMap) tmpMap.get("rsvtnInfo");
		
		String email = rsvtnInfo.getString("email");
		
		if(!"".equals(email))
		{
			EmfMap mailMap = new EmfMap();
			
			mailMap.put("subject", "[대명아임레디 공연 예약 완료] 메일입니다.");
			//2017.04.25 박주석 디아모 적용
			mailMap.put("toUser", email );
//			mailMap.put("toUser", SeedCipher.decrypt(email, ENCODE));
			mailMap.put("name", rsvtnInfo.getString("name"));
			mailMap.put("pfmcNm", rsvtnInfo.getString("pfmcNm"));
			mailMap.put("seatCnt", rsvtnInfo.getString("seatCnt"));
			mailMap.put("seatGb", rsvtnInfo.getString("seatGb"));
			mailMap.put("fstRsvtnDtm", EgovDateUtil.convertDate(rsvtnInfo.getString("fstRsvtnDtm"), "yyyy-MM-dd HH:mm:ss", "yyyy년 MM월 dd일(EE) HH시 mm분", ""));
			mailMap.put("secnRsvtnDtm", EgovDateUtil.convertDate(rsvtnInfo.getString("secnRsvtnDtm"), "yyyy-MM-dd HH:mm:ss", "yyyy년 MM월 dd일(EE) HH시 mm분", ""));
			mailMap.put("reqn", rsvtnInfo.getString("reqn").replace(System.getProperty("line.separator"), "<br />"));
			
			mailService.sendTempleteMail(mailMap, "ml/mlc/MLCPfmcRsvtnComp.html");
		}
		
		//메일발송을 위해 관리자정보를 가져온다.
		List<EmfMap> admList = mLCPfmcInfDAO.selectPfmcRsvtnAdmList(emfMap);
		
		if(admList.size() > 0)
		{
			EmfMap admMailMap = new EmfMap();
			
			admMailMap.put("subject", "[대명아임레디 관리자 무료 공연 예약 신청 안내] 메일입니다.");
			admMailMap.put("pfmcNm", rsvtnInfo.getString("pfmcNm"));
			admMailMap.put("seatCnt", rsvtnInfo.getString("seatCnt"));
			admMailMap.put("seatGb", rsvtnInfo.getString("seatGb"));
			admMailMap.put("fstRsvtnDtm", EgovDateUtil.convertDate(rsvtnInfo.getString("fstRsvtnDtm"), "yyyy-MM-dd HH:mm:ss", "yyyy년 MM월 dd일(EE) HH시 mm분", ""));
			admMailMap.put("secnRsvtnDtm", EgovDateUtil.convertDate(rsvtnInfo.getString("secnRsvtnDtm"), "yyyy-MM-dd HH:mm:ss", "yyyy년 MM월 dd일(EE) HH시 mm분", ""));
			admMailMap.put("reqn", rsvtnInfo.getString("reqn").replace(System.getProperty("line.separator"), "<br />"));
			
			String admEmail = null;
			
			for(int i = 0; i < admList.size(); i++)
			{
				admEmail = admList.get(i).getString("email");
				//2017.04.25 박주석 디아모 적용
				if(!"".equals(admEmail))
				{
					admMailMap.put("toUser", admEmail);
//					admMailMap.put("toUser", SeedCipher.decrypt(admEmail, ENCODE));
					admMailMap.put("name", admList.get(i).getString("name"));
					
					mailService.sendTempleteMail(admMailMap, "ml/mlc/MLCPfmcRsvtnAdmin.html");
				}
			}
		}
    }
}