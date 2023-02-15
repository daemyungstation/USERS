package front.ml.mle.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import emf.core.extend.service.EmfAbstractService;
import emf.core.vo.EmfMap;
import front.ml.mle.service.MLETrnsfAcquService;
import front.ml.mle.service.dao.MLETrnsfAcquDAO;

/**
 * <pre> 
 * 양도·양수 안내를 위한 ServiceImpl
 * </pre>
 * 
 * @ClassName		: MLETrnsfAcquServiceImpl.java
 * @Description		: 양도·양수 안내를 위한 ServiceImpl
 * @author 허진영
 * @since 2016.03.14
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.14		   허진영				  최초 생성
 * </pre>
 */ 
@Service("mLETrnsfAcquService")
public class MLETrnsfAcquServiceImpl extends EmfAbstractService implements MLETrnsfAcquService {
	
	@Resource(name="mLETrnsfAcquDAO")
	private MLETrnsfAcquDAO mLETrnsfAcquDAO;
	
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
		
		return mLETrnsfAcquDAO.selectJoinPrdctList(emfMap);
	}
}
