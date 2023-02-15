package front.ml.mlf.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 1:1 상담내역 조회를 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLFPrsnCnslDAO.java
 * @Description		: 1:1 상담내역 조회를 위한 DAO
 * @author 허진영
 * @since 2016.03.03
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.03		   허진영				  최초 생성
 * </pre>
 */ 
@Repository("mLFPrsnCnslDAO")
public class MLFPrsnCnslDAO extends EmfAbstractDAO {	
	
	/**
	 * 1:1 상담내역 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectPrsnCnslList(EmfMap emfMap) throws Exception
	{
		return list("MLFPrsnCnslDAO.selectPrsnCnslList", emfMap);
	}
	
	/**
	 * 1:1 상담내역 상세를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPrsnCnsl(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("MLFPrsnCnslDAO.selectPrsnCnsl", emfMap);
	}
	
	/**
	 * 1:1 상담내역 상세로그를 조회한다.
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPrsnCnslLog(EmfMap emfMap) throws Exception
	{
		return (EmfMap) selectByPk("MLFPrsnCnslDAO.selectPrsnCnslLog", emfMap);
	}
}
