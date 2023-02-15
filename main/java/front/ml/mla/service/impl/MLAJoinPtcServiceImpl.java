package front.ml.mla.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.ml.mla.service.MLAJoinPtcService;
import front.ml.mla.service.dao.MLAJoinPtcDAO;

/**
 * <pre> 
 * 가입내역 조회를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: MLAJoinPtcServiceImpl.java
 * @Description		: 가입내역 조회를 위한 ServiceImpl
 * @author 허진영
 * @since 2016.03.15
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.15		   허진영				  최초 생성
 * </pre>
 */ 
@Service("mLAJoinPtcService")
public class MLAJoinPtcServiceImpl extends EmfAbstractService implements MLAJoinPtcService {
	
	@Resource(name="mLAJoinPtcDAO")
	private MLAJoinPtcDAO mLAJoinPtcDAO;

	/**
	 * 가입내역 목록을 조회한다.
	 *
	 * @param emfMap
	 * @return
	 * @throws Exception
	 */
	public EmfMap selectJoinPtcList(EmfMap emfMap) throws Exception {
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("memNo", lgnMap.getString("unqNo"));
		
		List<EmfMap> joinPtcList = mLAJoinPtcDAO.selectJoinPtcList(emfMap);
		emfMap.put("joinPtcList", joinPtcList);

		if (joinPtcList.size() > 0) {
			List<EmfMap> spplSrvcList = mLAJoinPtcDAO.selectSpplSrvcList(emfMap);
			HashMap<String, Object> spplSrvcMap = new HashMap<String, Object>();
			ArrayList<EmfMap> list;

			for (int i = 0; i < spplSrvcList.size(); i++) {
				EmfMap tmpMap1 = spplSrvcList.get(i);
				String accntNo = tmpMap1.getString("accntNo");
				if (spplSrvcMap.get(accntNo) == null) {
					spplSrvcMap.put(accntNo, new ArrayList<EmfMap>());
				}

				list = (ArrayList<EmfMap>) spplSrvcMap.get(accntNo);
				list.add(tmpMap1);
			}

			for (int j = 0; j < joinPtcList.size(); j++) {
				EmfMap tmpMap2 = joinPtcList.get(j);
				String accntNo = tmpMap2.getString("accntNo");

				if (spplSrvcMap.get(accntNo) != null) {
					tmpMap2.put("spplSrvcList", spplSrvcMap.get(accntNo));
					joinPtcList.set(j, tmpMap2);
				}
			}
		}

		return emfMap;
	}
}
