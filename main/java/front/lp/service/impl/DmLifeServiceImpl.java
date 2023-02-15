package front.lp.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.co.util.COPaginationUtil;
import front.lp.service.DmLifeService;
import front.lp.service.dao.DmLifeDAO;

/**
 * <pre> 
 * 상품 목록 조회를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: ProductMngServiceImpl.java
 * @Description		: 상품 목록 조회를 위한 ServiceImpl
 * @author 김필기
 * @since 2016.02.19
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		 since			author					description
 *   ===========    ==============    =============================
 *    2016.02.19		김필기					 최초생성
 * </pre>
 */ 
@Service("dMLifeService")
public class DmLifeServiceImpl extends EmfAbstractService implements DmLifeService {
	
	@Resource(name="dMLifeDAO")
	private DmLifeDAO dMLifeDAO;
	
	/**
     * 납입방식을 조회한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */	
	public List<EmfMap> getPaymentMethod(EmfMap emfMap) throws Exception{
		
		ArrayList<String> prdctCdList = new ArrayList<String>();
		
		String prdctCd = emfMap.getString("prodCd");		
		
		if(!"".equals(prdctCd))
		{
			String[] result = prdctCd.split(",");	
			
			for(int i = 0 ; i < result.length ; i++)
			{
				prdctCdList.add(result[i]);
			}
		}
		
		emfMap.put("prodCd", prdctCdList);
		
		List<EmfMap> paymentMethodList = dMLifeDAO.getPaymentMethod(emfMap);	// 납입방식 가져오기
		
		return paymentMethodList;
	}
	
	/**
     * 담당자 목록을 조회한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */	
	public EmfMap getEmployeeList(EmfMap emfMap) throws Exception
	{
    	PaginationInfo paginationInfo = new COPaginationUtil().getPage(emfMap);
    	
    	//페이징 처리
		emfMap.put("paginationInfo", paginationInfo);
				
		//리스트 가져오기
		List<EmfMap> employeeList = new ArrayList<EmfMap>();
		
		if(!"".equals(emfMap.getString("q")))
		{
			employeeList = dMLifeDAO.getEmployeeList(emfMap);
		}
		
		emfMap.put("list", employeeList);
		
		if(employeeList.size() > 0)
		{
			paginationInfo.setTotalRecordCount(Integer.parseInt(employeeList.get(0).getString("totCnt")));
		}
		else
		{
			paginationInfo.setTotalRecordCount(0);
		}    	
    	
		return emfMap;				
	}	
	
	/**
	 * 공통 코드 목록을 조회한다.
	 */	
	public List<EmfMap> selectComCd(EmfMap emfMap) throws Exception
	{
		List<EmfMap> comCdList = dMLifeDAO.selectComCd(emfMap);		
		
		return comCdList;
	}
	
	/**
	 * 회사 코드 목록을 조회한다.
	 */	
	public EmfMap selectB2BComCd(EmfMap emfMap) throws Exception
	{
		return dMLifeDAO.selectB2BComCd(emfMap);
	}	
	
	/**
	 * 세부 상품을 조회한다.
	 */	
	public List<EmfMap> getSubProduct(EmfMap emfMap) throws Exception
	{		
		return dMLifeDAO.getSubProduct(emfMap);
	}	
	
	/**
	 * 가입증서를 조회한다.
	 */	
	public EmfMap selectJoinCert(EmfMap emfMap) throws Exception
	{	
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("memNo", lgnMap.getString("unqNo"));
		
		EmfMap resultMap = new EmfMap();
		
		// 회원증서
		EmfMap joinCertMap = dMLifeDAO.selectJoinCert(emfMap);
		
		// 상품설명서
		EmfMap prdctDescMap = dMLifeDAO.selectPrdctDesc(emfMap);

		// 상품 해약환급금 및 환금율
		emfMap.put("recordCountPerPage", 32);
		
		emfMap.put("firstIndex", 0);
		List<EmfMap> resnstdInfoMap1 = dMLifeDAO.selectResnstdInfo(emfMap);	// 1~32
		
		emfMap.put("firstIndex", 32);
		List<EmfMap> resnstdInfoMap2 = dMLifeDAO.selectResnstdInfo(emfMap);	// 33~64
		
		emfMap.put("firstIndex", 64);
		List<EmfMap> resnstdInfoMap3 = dMLifeDAO.selectResnstdInfo(emfMap);	// 65~96
		
		emfMap.put("firstIndex", 96);
		List<EmfMap> resnstdInfoMap4 = dMLifeDAO.selectResnstdInfo(emfMap);	// 97~128
		
		emfMap.put("firstIndex", 128);
		List<EmfMap> resnstdInfoMap5 = dMLifeDAO.selectResnstdInfo(emfMap);	// 129~160
		
		emfMap.put("firstIndex", 160);
		List<EmfMap> resnstdInfoMap6 = dMLifeDAO.selectResnstdInfo(emfMap);	// 161~192
		
		emfMap.put("firstIndex", 192);
		List<EmfMap> resnstdInfoMap7 = dMLifeDAO.selectResnstdInfo(emfMap);	// 193~224
		
		emfMap.put("firstIndex", 224);
		List<EmfMap> resnstdInfoMap8 = dMLifeDAO.selectResnstdInfo(emfMap);	// 225~257		
		
		resultMap.put("joinCert", joinCertMap);
		resultMap.put("prdctDesc", prdctDescMap);
		resultMap.put("resnstdInfoMap1", resnstdInfoMap1);
		resultMap.put("resnstdInfoMap2", resnstdInfoMap2);
		resultMap.put("resnstdInfoMap3", resnstdInfoMap3);
		resultMap.put("resnstdInfoMap4", resnstdInfoMap4);
		resultMap.put("resnstdInfoMap5", resnstdInfoMap5);
		resultMap.put("resnstdInfoMap6", resnstdInfoMap6);
		resultMap.put("resnstdInfoMap7", resnstdInfoMap7);
		resultMap.put("resnstdInfoMap8", resnstdInfoMap8);
		
		return resultMap;
	}		
}
