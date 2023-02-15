package front.ml.mla.service.impl;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import front.co.util.COPaginationUtil;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.ml.mla.service.MLARefndPtcService;
import front.ml.mla.service.dao.MLARefndPtcDAO;

/**
 * <pre> 
 * 환급금 조회를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: MLARefndPtcServiceImpl.java
 * @Description		: 환급금 조회를 위한 ServiceImpl
 * @author 허진영
 * @since 2016.03.16
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.16		   허진영				  최초 생성
 * </pre>
 */ 
@Service("mLARefndPtcService")
public class MLARefndPtcServiceImpl extends EmfAbstractService implements MLARefndPtcService {
	
	@Resource(name="mLARefndPtcDAO")
	private MLARefndPtcDAO mLARefndPtcDAO;

	/**
	 * 환급금 목록을 조회한다.
	 *
	 * @param emfMap
	 * @return
	 * @throws Exception
	 */
	public List<EmfMap> selectRefndPtcList(EmfMap emfMap) throws Exception {
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		emfMap.put("memNo", lgnMap.getString("unqNo"));
		
		List<EmfMap> refundPtcList = mLARefndPtcDAO.selectRefndPtcList(emfMap);
		return refundPtcList;
	}

	/**
	 * 환급금상세 목록을 조회한다.
	 *
	 * @param emfMap
	 * @return
	 * @throws Exception
	 */
	public List<EmfMap> selectRefndPtcDtlList(EmfMap emfMap) throws Exception {
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		emfMap.put("memNo", lgnMap.getString("unqNo"));
		
		return mLARefndPtcDAO.selectRefndPtcDtlList(emfMap);
	}

	public EmfMap getRefndPtcHistoryList(EmfMap emfMap) throws Exception {
		List<EmfMap> list = mLARefndPtcDAO.getCashShoppingHistory(emfMap);
		emfMap.put("cashShoppingHistory", list);
		
		BigDecimal resnAmt = new BigDecimal(0); 
		if(!"".equals(emfMap.get("resnAmt"))) {
			resnAmt = new BigDecimal((String) emfMap.get("resnAmt"));
		}
		emfMap.put("cashShoppingAmt", mLARefndPtcDAO.getCashShoppingAmt(emfMap.getString("accntNo"), resnAmt));
		return emfMap;
	}
}
