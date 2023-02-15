package front.ml.mlh.service.dao;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 회원탈퇴를 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLHMemDrotDAO.java
 * @Description		: 회원탈퇴를 위한 DAO
 * @author 허진영
 * @since 2016.03.08
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.08		   허진영				  최초 생성
 * </pre>
 */ 
@Repository("mLHMemDrotDAO")
public class MLHMemDrotDAO extends EmfAbstractDAO {	
	
	/**
	 * 회원탈퇴를 한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateMemDrot(EmfMap emfMap) throws Exception
	{
		update("MLHMemDrotDAO.updateMemDrot", emfMap);
	}
	
	/**
	 * 부가 식별 정보를 삭제한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void deleteIdntInf(EmfMap emfMap) throws Exception
	{
		update("MLHMemDrotDAO.deleteIdntInf", emfMap);
	}

	public void insertMemDropInfo(EmfMap emfMap) throws Exception {
		insert("MLHMemDrotDAO.insertMemDropInfo", emfMap);
	}

	public void deleteMemDrot(EmfMap emfMap) throws Exception {
		delete("MLHMemDrotDAO.deleteMemDrot", emfMap);
	}

	public void deleteMemEtcDrot(String id) throws Exception {
		delete("MLHMemDrotDAO.deleteMemEtcDrot", id);
	}

	public void insertMemDropInfoFromQscn(EmfMap emfMap) throws Exception {
		insert("MLHMemDrotDAO.insertMemDropInfoFromQscn", emfMap);
	}

	public void deleteMemDrotFromQscn(EmfMap emfMap) throws Exception {
		delete("MLHMemDrotDAO.deleteMemDrotFromQscn", emfMap);
	}

}
