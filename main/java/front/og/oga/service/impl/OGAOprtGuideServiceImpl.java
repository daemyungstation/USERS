package front.og.oga.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.og.oga.service.OGAOprtGuideService;
import front.og.oga.service.dao.OGAOprtGuideDAO;

/**
 * <pre> 
 * 이용안내 조회를 위한 Service
 * </pre>
 * 
 * @ClassName		: OGAOprtGuideServiceImpl.java
 * @Description		: 이용안내 조회를 위한 Service
 * @author 허진영
 * @since 2016.03.11
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.11		   허진영				  최초 생성
 * </pre>
 */ 
@Service("oGAOprtGuideService")
public class OGAOprtGuideServiceImpl extends EmfAbstractService implements OGAOprtGuideService {	
	
	@Resource(name="oGAOprtGuideDAO")
	private OGAOprtGuideDAO oGAOprtGuideDAO;
	
	/**
	 * 이용안내를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectOprtGuide(EmfMap emfMap) throws Exception
	{
		List<EmfMap> rvsnDtList = oGAOprtGuideDAO.selectRvsnDtList(emfMap);
		
		emfMap.put("rvsnDtList", rvsnDtList);
		
		if(rvsnDtList.size() > 0)
		{
			if("".equals(EMFStringUtil.nullConvert(emfMap.get("oprtGuideSeq"))))
			{
				emfMap.put("oprtGuideSeq", rvsnDtList.get(0).getString("oprtGuideSeq"));
			}
			
			emfMap.put("oprtGuideInfo", oGAOprtGuideDAO.selectOprtGuide(emfMap));
		}
		
		return emfMap;
	}
}
