package front.ml.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.idgnr.impl.EgovTableIdGnrService;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.ml.service.MLMyLifewayService;
import front.ml.service.dao.MLMyLifewayDAO;

/**
 * <pre> 
 * MyLifeway를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: MLMyLifewayServiceImpl.java
 * @Description		: MyLifeway를 위한 ServiceImpl
 * @author 허진영
 * @since 2016.03.21
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.21		   허진영				  최초 생성
 * </pre>
 */ 
@Service("mLMyLifewayService")
public class MLMyLifewayServiceImpl extends EmfAbstractService implements MLMyLifewayService {	

	@Resource(name="mLMyLifewayDAO")
	private MLMyLifewayDAO mLMyLifewayDAO;
	
	@Resource(name="chkReqnIdgen")
	private EgovTableIdGnrService chkReqnIdgen;
	
	/**
	 * 고유번호 확인요청을 등록한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap insertChkReqn(EmfMap emfMap) throws Exception
	{
		//로그인 정보 가져오기
		EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
		
		emfMap.put("id", lgnMap.getString("id"));
		
		int chkReqnCnt = mLMyLifewayDAO.selectChkReqnCnt(emfMap);
		
		if(chkReqnCnt > 0)
		{
			emfMap.put("chkReqnYn", "N");
		}
		else
		{
			emfMap.put("reqnSeq", chkReqnIdgen.getNextIntegerId());
			emfMap.put("regId", lgnMap.getString("id"));
			emfMap.put("regIp", lgnMap.getString("loginIp"));
			emfMap.put("modId", lgnMap.getString("id"));
			emfMap.put("modIp", lgnMap.getString("loginIp"));
			
			mLMyLifewayDAO.insertChkReqn(emfMap);
			
			emfMap.put("chkReqnYn", "Y");
		}
		
		return emfMap;
	}
}
