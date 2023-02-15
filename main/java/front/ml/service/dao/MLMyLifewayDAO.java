package front.ml.service.dao;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * MyLifeway를 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLMyLifewayDAO.java
 * @Description		: MyLifeway를 위한 DAO
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
@Repository("mLMyLifewayDAO")
public class MLMyLifewayDAO extends EmfAbstractDAO {	

	/**
	 * 고유번호 확인요청 등록을 위한 유효성 체크.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public Integer selectChkReqnCnt(EmfMap emfMap) throws Exception
	{
		return (Integer) selectByPk("MLMyLifewayDAO.selectChkReqnCnt", emfMap);
	}
	
	/**
	 * 고유번호 확인요청을 등록한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertChkReqn(EmfMap emfMap) throws Exception
	{
		insert("MLMyLifewayDAO.insertChkReqn", emfMap);
	}
}
