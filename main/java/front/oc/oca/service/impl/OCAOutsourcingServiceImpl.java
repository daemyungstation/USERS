package front.oc.oca.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;

import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.MailService;
import egovframework.com.utl.sim.service.EgovNetworkState;
import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.lp.service.DmLifeService;
import front.oc.oca.service.OCAOutsourcingService;
import front.oc.oca.service.dao.OCAOutsourcingDAO;

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
@Service("oCAOutsourcingService")
public class OCAOutsourcingServiceImpl extends EmfAbstractService implements OCAOutsourcingService {
	
	@Resource(name="oCAOutsourcingDAO")
	private OCAOutsourcingDAO oCAOutsourcingDAO;
	
	@Resource(name="outsourcingIdgen")
	private EgovTableIdGnrService outsourcingIdgen;	
	
	@Resource(name="dMLifeService")
    private DmLifeService dMLifeService;
	
	@Resource(name="EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

	// 메일 서비스
	@Resource(name="mailService")
    private MailService mailService;
	
	/**
	 * 신청 정보를 등록한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public boolean insertOutsourcingInf(EmfMap emfMap, HttpServletRequest request) throws Exception
	{
		// 중복가입 검사
		EmfMap overrapMap = this.getOverrapSid(emfMap);
		if(!"0".equals(overrapMap.getString("cnt")))
			return false;

		emfMap.put("seq", outsourcingIdgen.getNextIntegerId());
		
		if(!"".equals(emfMap.getString("b2bCd")))
		{
			EmfMap b2bComCdMap = dMLifeService.selectB2BComCd(emfMap);
			
			emfMap.put("b2bNm", b2bComCdMap.getString("comNm"));
		}
		
		if(!"".equals(emfMap.getString("prdctCd")))
		{
			emfMap.put("cdId", "OUTSOURCING_PRDCT");
			emfMap.put("cd", emfMap.getString("prdctCd"));
			
			EmfMap cdDtlInf1 = cmmUseService.selectCmmCodeDetailInf(emfMap);

			emfMap.put("prdctNm", cdDtlInf1.getString("cdNm"));
		}
		
		String prdctCd2 = (String) emfMap.remove("prdctCd2");
		String prdctCd3 = (String) emfMap.remove("prdctCd3");
		String idNo2 = (String) emfMap.remove("idNo2");
		String idNo3 = (String) emfMap.remove("idNo3");
		String discountCtn2 = (String) emfMap.remove("discountCtn2");
		String discountCtn3 = (String) emfMap.remove("discountCtn3");
		
		if(!"".equals(emfMap.getString("fusionPrdctCd")))
		{
			emfMap.put("cdId", "FUSION_PRDCT");
			emfMap.put("cd", emfMap.getString("fusionPrdctCd"));
			
			EmfMap cdDtlInf2 = cmmUseService.selectCmmCodeDetailInf(emfMap);

			emfMap.put("fusionPrdctNm", cdDtlInf2.getString("cdNm"));
		}
		
		emfMap.put("regIp", EgovNetworkState.getMyIPaddress(request));
		emfMap.put("sid", RequestContextHolder.getRequestAttributes().getSessionId());

		StringBuilder sb = null;

		if (emfMap.get("contractNo1") != null) {
			sb = new StringBuilder();
			sb.append(emfMap.getString("contractNo1"));
			sb.append(emfMap.getString("contractNo2"));
			sb.append(emfMap.getString("contractNo3"));
			sb.append(emfMap.getString("contractNo4"));
			emfMap.put("contractNo", sb.toString());
		}

		oCAOutsourcingDAO.insertOutsourcingInf(emfMap);
		
		emfMap.remove("prdctCd");
		emfMap.remove("prdctNm");
		emfMap.remove("mainContType");
		
		if(!"".equals(EMFStringUtil.nvl(prdctCd2, "")))
		{
			emfMap.put("seq", outsourcingIdgen.getNextIntegerId());
			
			emfMap.put("cdId", "OUTSOURCING_PRDCT");
			emfMap.put("cd", prdctCd2);
			
			EmfMap cdDtlInf3 = cmmUseService.selectCmmCodeDetailInf(emfMap);
			
			emfMap.put("prdctCd2", prdctCd2);
			emfMap.put("prdctNm2", cdDtlInf3.getString("cdNm"));
			emfMap.put("mainContType", emfMap.getString("mainContType2"));
			emfMap.put("idNo", idNo2);
			emfMap.put("discountCtn", discountCtn2);
			
			if(!"".equals(emfMap.getString("fusionPrdctCd2")))
			{
				emfMap.put("cdId", "FUSION_PRDCT");
				emfMap.put("cd", emfMap.getString("fusionPrdctCd2"));
				
				EmfMap cdDtlInf2 = cmmUseService.selectCmmCodeDetailInf(emfMap);

				emfMap.put("fusionPrdctNm2", cdDtlInf2.getString("cdNm"));
			}
			emfMap.remove("fusionPrdctCd");
			emfMap.remove("fusionPrdctNm");
			
			oCAOutsourcingDAO.insertOutsourcingInf(emfMap);
			
			emfMap.remove("prdctCd2");
			emfMap.remove("prdctNm2");
			emfMap.remove("mainContType");
		}
		
		if(!"".equals(EMFStringUtil.nvl(prdctCd3, "")))
		{
			emfMap.put("seq", outsourcingIdgen.getNextIntegerId());
			
			emfMap.put("cdId", "OUTSOURCING_PRDCT");
			emfMap.put("cd", prdctCd3);
			emfMap.put("mainContType", emfMap.getString("mainContType3"));
			emfMap.put("idNo", idNo3);
			emfMap.put("discountCtn", discountCtn3);
			
			EmfMap cdDtlInf4 = cmmUseService.selectCmmCodeDetailInf(emfMap);
			
			emfMap.put("prdctCd3", prdctCd3);
			emfMap.put("prdctNm3", cdDtlInf4.getString("cdNm"));
			
			oCAOutsourcingDAO.insertOutsourcingInf(emfMap);
		}
		
		return true;
    }
	
	/**
     * 외주업체 코드별 관리 정보를 조회한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public EmfMap selectOutsourcingPageMngInfo(EmfMap emfMap) throws Exception
    {
    	return oCAOutsourcingDAO.selectOutsourcingPageMngInfo(emfMap);
    }	
    
    /**
     * 외주업체 상품 정보를 조회한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public EmfMap selectOutsourcingPrdctList(EmfMap emfMap) throws Exception
    {
    	String oscCd = emfMap.getString("oscCd");
    	EmfMap rtnMap = new EmfMap();
    	
		emfMap.put("highrCd", "OUTSOURCING");
		emfMap.put("highrDtlCd", oscCd);
		emfMap.put("lowrCd", "OUTSOURCING_PRDCT");
		rtnMap.put("product", cmmUseService.selectCmmLinkCode(emfMap));
		
		if ("LGB2B".equals(oscCd)) {
			emfMap.put("highrCd", "OUTSOURCING_PRDCT");
			emfMap.put("highrDtlCd", Arrays.asList("LGB2B3", "LGB2B4", "LGB2B5", "LGB2B6", "LGB2B7", "LGB2B8", "LGB2B9", "LGB2B99"));
		} else if ("LGSTAY".equals(oscCd)) {
			emfMap.put("highrCd", "OUTSOURCING_PRDCT");
			emfMap.put("highrDtlCd", Arrays.asList("LGSTAY4", "LGSTAY5", "LGSTAY6"));
		}
		
		emfMap.put("lowrCd", "FUSION_PRDCT");
		rtnMap.put("goods", cmmUseService.selectCmmLinkCode(emfMap));

		emfMap.put("lowrCd", "OUTSOURCING_CHANNEL");
		rtnMap.put("channel", cmmUseService.selectCmmLinkCode(emfMap));
		
    	return rtnMap;
    }
    
    
    /**
     * (selectCmmLinkCode 메서드로 합쳐지면서 사용하지 않음)
     * LGB2B 상품 정보를 조회한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public EmfMap selectOutsourcingPrdctListLGB2B(EmfMap emfMap) throws Exception
    {
    	EmfMap rtnMap = new EmfMap();
    	
		emfMap.put("highrCd", "OUTSOURCING");
		emfMap.put("highrDtlCd", emfMap.getString("oscCd"));

		emfMap.put("lowrCd", "OUTSOURCING_PRDCT");

		List<EmfMap> cmmLinkCodeList = cmmUseService.selectCmmLinkCode(emfMap);

		List<String> codeList = new ArrayList<String>();
		for (EmfMap paramMap : cmmLinkCodeList) {
			codeList.add((String) paramMap.get("cd"));
		}

		rtnMap.put("product", cmmLinkCodeList);

		emfMap.put("codeList", codeList);
		emfMap.put("lowrCd", "FUSION_PRDCT");
		rtnMap.put("goods", cmmUseService.selectCmmLinkCodeLGB2B(emfMap));


		emfMap.put("lowrCd", "OUTSOURCING_CHANNEL");
		rtnMap.put("channel", cmmUseService.selectCmmLinkCode(emfMap));
		
    	return rtnMap;
    }

    
    /**
     * 쿼리를 조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public EmfMap getOverrapSid(EmfMap emfMap) throws Exception
    {
    	return oCAOutsourcingDAO.selectOverrapSid(emfMap);
    }

    /**
     * THEONE 상품 정보를 조회한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	@Override
	public EmfMap selectOutsourcingPrdctListTHEONE(EmfMap emfMap) throws Exception {
    	EmfMap rtnMap = new EmfMap();
    	
		emfMap.put("highrCd", "OUTSOURCING");
		emfMap.put("highrDtlCd", emfMap.getString("oscCd"));

		emfMap.put("lowrCd", "OUTSOURCING_PRDCT");
		rtnMap.put("product", cmmUseService.selectCmmLinkCode(emfMap));
		
		
		emfMap.put("lowrCd", "FUSION_PRDCT");
		rtnMap.put("goods", cmmUseService.selectCmmLinkCodeTHEONE(emfMap));

		
		emfMap.put("lowrCd", "OUTSOURCING_CHANNEL");
		rtnMap.put("channel", cmmUseService.selectCmmLinkCode(emfMap));
		
    	return rtnMap;
	}
	
	public EmfMap agentAuthCheck(HttpServletRequest request, EmfMap emfMap) throws Exception {
		return oCAOutsourcingDAO.agentAuthCheck(emfMap);
	}

	public EmfMap agentCdCheck(HttpServletRequest request, EmfMap emfMap) throws Exception {
		return oCAOutsourcingDAO.agentCdCheck(emfMap);
	}
	
	public void insertAuthInf(EmfMap emfMap) throws Exception {
		oCAOutsourcingDAO.insertAuthInf(emfMap);
	}
}
