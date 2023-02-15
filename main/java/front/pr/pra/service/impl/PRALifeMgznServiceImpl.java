package front.pr.pra.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;
import front.pr.pra.service.PRALifeMgznService;
import front.pr.pra.service.dao.PRALifeMgznDAO;

/**
 * <pre> 
 * 라이프웨이 매거진 조회를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: PRALifeMgznServiceImpl.java
 * @Description		: 라이프웨이 매거진 조회를 위한 ServiceImpl
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
@Service("pRALifeMgznService")
public class PRALifeMgznServiceImpl extends EmfAbstractService implements PRALifeMgznService {
	
	@Resource(name="pRALifeMgznDAO")
	private PRALifeMgznDAO pRALifeMgznDAO;
	
	/**
	 * 라이프웨이 매거진을 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectLifeMgzn(EmfMap emfMap) throws Exception
	{
		List<EmfMap> yrList = pRALifeMgznDAO.selectMgznPbtnYrList();
		
		emfMap.put("yrList", yrList);
		
		if(yrList.size() > 0)
		{
			if("".equals(EMFStringUtil.nullConvert(emfMap.get("mgznPbtnYr"))))
			{
				emfMap.put("mgznPbtnYr", yrList.get(0).getString("mgznPbtnYr"));
			}
			
			emfMap.put("mgznInfo", pRALifeMgznDAO.selectLifeMgzn(emfMap));
		}
		
		return emfMap;
	}
}
