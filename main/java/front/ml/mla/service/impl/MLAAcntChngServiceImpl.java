package front.ml.mla.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.lp.service.DmLifeService;
import front.ml.mla.service.MLAAcntChngService;
import front.ml.mla.service.dao.MLAAcntChngDAO;
import front.ml.mla.service.dao.MLAAcntChngOutDAO;

/**
 * <pre> 
 * 결제계좌 조회/변경을 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: MLAAcntChngServiceImpl.java
 * @Description		: 결제계좌 조회/변경을 위한 ServiceImpl
 * @author 허진영
 * @since 2016.03.02
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.02		   허진영				  최초 생성
 * </pre>
 */ 
@Service("mLAAcntChngService")
public class MLAAcntChngServiceImpl extends EmfAbstractService implements MLAAcntChngService {	
	
	@Resource(name="mLAAcntChngDAO")
	private MLAAcntChngDAO mLAAcntChngDAO;
	
	@Resource(name="mLAAcntChngOutDAO")
	private MLAAcntChngOutDAO mLAAcntChngOutDAO;
	
	@Resource(name="dMLifeService")
	private DmLifeService dMLifeService;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;
	
	@Resource(name="acntChngIdgen")
	private EgovTableIdGnrService acntChngIdgen;
	
	private String ENCODE = EgovProperties.getProperty("Global.CHARCODE");
	
	/**
	 * 가입상품 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectJoinPrdctList(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		emfMap.put("memNo", lgnMap.getString("unqNo"));
		return mLAAcntChngOutDAO.selectJoinPrdctList(emfMap);
	}

	/**
	 * 가입상품 목록을 조회한다.(결제계좌 변경안내)
	 *
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectJoinPrdctListPaymentAccount(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		emfMap.put("memNo", lgnMap.getString("unqNo"));
		return mLAAcntChngOutDAO.selectJoinPrdctListPaymentAccount(emfMap);
	}

	/**
	 * 가입상품 목록을 조회한다.(로그인)
	 *
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectJoinPrdctListForLogin(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		emfMap.put("memNo", lgnMap.getString("unqNo"));
		return mLAAcntChngOutDAO.selectJoinPrdctListForLogin(emfMap);
	}
	
	/**
	 * 결제계좌 정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPayAcntInf(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("memNo", lgnMap.getString("unqNo"));
		
		EmfMap payInfo = mLAAcntChngOutDAO.selectPayMthd(emfMap);
		
		emfMap.put("payInfo", payInfo);
		
		emfMap.put("exceInfo", mLAAcntChngDAO.selectPayDayExceInf(emfMap));
			
		if("04".equals(payInfo.getString("payMthd")))
		{
			emfMap.put("pmtAcntInfo", mLAAcntChngOutDAO.selectCmsPmtAcntInf(emfMap));
		}
		else if("06".equals(payInfo.getString("payMthd")))
		{
			EmfMap cardInfoMap = mLAAcntChngOutDAO.selectCardPmtAcntInf(emfMap);
			String cardNo = String.valueOf(cardInfoMap.get("cardNo"));
			String expireDate = String.valueOf(cardInfoMap.get("expireDate"));
			String iniYn = String.valueOf(cardInfoMap.get("iniYn"));
			String cardNm = String.valueOf(cardInfoMap.get("cardNm"));
			
			if (cardNo != null) {
				String outputCardNo = cardNo.substring(0, 8);
				
				for (int i = 0; i < cardNo.length() - outputCardNo.length(); i++) {
					outputCardNo += "*";
				}
				
				cardInfoMap.put("cardNo", outputCardNo);
				cardInfoMap.put("cardNm", cardNm);
			}
			
			if (expireDate != null) {
				StringBuilder outputExpireDate = new StringBuilder(expireDate);
				outputExpireDate.setCharAt(1, '*');
				outputExpireDate.setCharAt(3, '*');
				
				cardInfoMap.put("expireDate", outputExpireDate);
			}
			
			//카드사 목록을 조회한다.
			if (iniYn.equals("Y")){
				emfMap.put("grpCd", "0196");	
			} else {
				emfMap.put("grpCd", "0120");
			}
						
			emfMap.put("cardlist", dMLifeService.selectComCd(emfMap));
			
			emfMap.put("pmtAcntInfo", cardInfoMap);
		}
		
		//은행점 목록을 조회한다.
		emfMap.put("grpCd", "63");
		
		emfMap.put("banklist", dMLifeService.selectComCd(emfMap));
				
		//공통코드 배열 셋팅
		ArrayList<String> cdDtlList = new ArrayList<String>();
		
		//해피콜 가능시간
		cdDtlList.add("HAPPY_CALL");
		
		//정의된 코드id값들의 상세 코드 맵 반환		
		emfMap.put("cdDtlList", cmmUseService.selectCmmCodeBindAll(cdDtlList));
		
		return emfMap;
	}
	
	/**
	 * 결제계좌 변경신청을 등록한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertAcntChngRqst(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("id", lgnMap.getString("id"));
		
		int chngRqstCnt = mLAAcntChngDAO.selectChngRqstCnt(emfMap);
		
		if(chngRqstCnt < 1)
		{
			emfMap.put("memNo", lgnMap.getString("unqNo"));
			
			//결제계좌 정보 가져오기
			EmfMap payInfo = mLAAcntChngOutDAO.selectPayMthd(emfMap);
			
			emfMap.put("chngSeq", acntChngIdgen.getNextIntegerId());
			emfMap.put("payMthd", payInfo.getString("payMthd"));
			
			EmfMap bfrInfo = null;
			
			if("04".equals(payInfo.getString("payMthd")))
			{
				bfrInfo = mLAAcntChngOutDAO.selectCmsPmtAcntInf(emfMap);
				
				emfMap.put("bfrInfo", bfrInfo);
				//2017.04.25 박주석 디아모 적용
//				if(!"".equals(bfrInfo.getString("bankAccntNo")))
//				{
//					bfrInfo.put("bankAccntNo", SeedCipher.encrypt(bfrInfo.getString("bankAccntNo"), ENCODE));
//				}
			}
			else if("06".equals(payInfo.getString("payMthd")))
			{
				bfrInfo = mLAAcntChngOutDAO.selectCardPmtAcntInf(emfMap);
				
				emfMap.put("bfrInfo", bfrInfo);
				//2017.04.25 박주석 디아모 적용
//				if(!"".equals(bfrInfo.getString("cardNo")))
//				{
//					bfrInfo.put("cardNo", SeedCipher.encrypt(bfrInfo.getString("cardNo"), ENCODE));
//				}
				
				if(!"".equals(bfrInfo.getString("expireDate")))
				{
					bfrInfo.put("cardExprYr", bfrInfo.getString("expireDate").substring(0, 2));
					bfrInfo.put("cardExprMm", bfrInfo.getString("expireDate").substring(2, 4));
				}
			}
			
			String curDay = EgovDateUtil.convertDate(EgovDateUtil.getToday(), "yyyyMMdd", "dd", "");
			
			if(bfrInfo != null)
			{
				String payDay = "";
				
				if("04".equals(payInfo.getString("payMthd")))
				{
					payDay = bfrInfo.getString("ichaeDt");
				}
				else if("06".equals(payInfo.getString("payMthd")))
				{
					payDay = bfrInfo.getString("payDt");
				}
				
				int diffDay1 = Integer.parseInt(payDay) - Integer.parseInt(curDay);

				if( diffDay1 > 0 && diffDay1 <= 3 )
				{
					throw new Exception("이중출금오류");
				}
			}
			
			int diffDay2 = Integer.parseInt(emfMap.getString("pmtDay")) - Integer.parseInt(curDay);
			
			if( diffDay2 > 0 && diffDay2 <= 3 )
			{
				throw new Exception("이중출금오류");
			}

			if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("bankInfo"))))
			{
				emfMap.put("bankCd", emfMap.getString("bankInfo").split(",")[0]);
				emfMap.put("bankNm", emfMap.getString("bankInfo").split(",")[1]);
			}
			//2017.04.25 박주석 디아모 적용
//			if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("acntNo"))))
//			{
//				emfMap.put("acntNo", SeedCipher.encrypt(emfMap.getString("acntNo"), ENCODE));
//			}

			if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("cardInfo"))))
			{
				emfMap.put("cardCd", emfMap.getString("cardInfo").split(",")[0]);
				emfMap.put("cardNm", emfMap.getString("cardInfo").split(",")[1]);
			}
			//2017.04.25 박주석 디아모 적용
//			if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("cardNo"))))
//			{
//				emfMap.put("cardNo", SeedCipher.encrypt(emfMap.getString("cardNo"), ENCODE));
//			}
			
			emfMap.put("regId", lgnMap.getString("id"));
			emfMap.put("regIp", lgnMap.getString("loginIp"));
			emfMap.put("modId", lgnMap.getString("id"));
			emfMap.put("modIp", lgnMap.getString("loginIp"));
			
			mLAAcntChngDAO.insertAcntChngRqst(emfMap);
		}
		else
		{
			throw new Exception("재신청오류");
		}
	}
}
