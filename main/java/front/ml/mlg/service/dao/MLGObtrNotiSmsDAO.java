package front.ml.mlg.service.dao;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractSmsDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 부고알리미를 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLGObtrNotiOutDAO.java
 * @Description		: 부고알리미를 위한 DAO
 * @author 허진영
 * @since 2016.05.10
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.05.10		   허진영				  최초 생성
 * </pre>
 */ 
@Repository("mLGObtrNotiSmsDAO")
public class MLGObtrNotiSmsDAO extends EmfAbstractSmsDAO {
	
	/**
	 * 부고알리미를 발송한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertObtrNotiSms(EmfMap emfMap) throws Exception
	{
		insert("MLGObtrNotiSmsDAO.insertObtrNotiSms", emfMap);
	}
}
