package front.lg.lgb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.lg.lgb.service.DMLifeMemService;
import front.lg.lgb.service.dao.DMLifeMemDAO;
import front.ml.mla.service.dao.MLAJoinPtcDAO;

/**
 * <pre> 
 * 전산DB 회원정보 ServiceImpl
 * </pre>
 * 
 * @ClassName		: DMLifeMemServiceImpl.java
 * @Description		: 전산DB 회원정보 ServiceImpl
 * @author 김필기
 * @since 2016.03.03
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.03		   김필기				  최초 생성
 * </pre>
 */  
@Service("dMLifeMemService")
public class DMLifeMemServiceImpl extends EmfAbstractService implements DMLifeMemService {
	
	@Resource(name="dMLifeMemDAO")
	private DMLifeMemDAO dMLifeMemDAO;
	
	@Resource(name="mLAJoinPtcDAO")
	private MLAJoinPtcDAO mLAJoinPtcDAO;
	
	/**
	 * 회원 정보를 가져온다
	 * 
	 * @param EmfMap(check : id or email)
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	public EmfMap selectDMLifeMemInf(EmfMap emfMap) throws Exception {
		List<EmfMap> rtnMemInfMap = dMLifeMemDAO.selectDMLifeMemInf(emfMap);
		emfMap.put("info", rtnMemInfMap);
		return emfMap;
	}
	
	/**
	 * 가입내역 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectJoinPtcList(EmfMap emfMap) throws Exception {
		
		List<EmfMap> joinPtcList = mLAJoinPtcDAO.selectJoinPtcList(emfMap);
		
		emfMap.put("joinPtcList", joinPtcList);
		
		if(joinPtcList.size() > 0)
		{
			List<EmfMap> spplSrvcList = mLAJoinPtcDAO.selectSpplSrvcList(emfMap);

			EmfMap tmpMap1 = null;
			
			HashMap<String, Object> spplSrvcMap = new HashMap<String, Object>();
			
			ArrayList<EmfMap> list;

			for(int i = 0; i < spplSrvcList.size(); i++)
			{
				tmpMap1 = (EmfMap) spplSrvcList.get(i);

				if(spplSrvcMap.get(tmpMap1.getString("accntNo")) == null)
				{
					spplSrvcMap.put(tmpMap1.getString("accntNo"), new ArrayList<EmfMap>());
				}

				list = (ArrayList<EmfMap>) spplSrvcMap.get(tmpMap1.getString("accntNo"));
				list.add(tmpMap1);
			}

			EmfMap tmpMap2 = null;
			
			for(int j = 0; j < joinPtcList.size(); j++)
			{
				tmpMap2 = joinPtcList.get(j);
				
				if(spplSrvcMap.get(tmpMap2.getString("accntNo")) != null)
				{
					tmpMap2.put("spplSrvcList", spplSrvcMap.get(tmpMap2.getString("accntNo")));
					
					joinPtcList.set(j, tmpMap2);
				}
			}
		}
		
		return emfMap;
	}
}
