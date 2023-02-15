package front.cs.csa.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 고객의 소리를 위한 DAO
 * </pre>
 * 
 * @ClassName		: CSACustVoiceDAO.java
 * @Description		: 고객의 소리를 위한 DAO
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
@Repository("cSACustVoiceDAO")
public class CSACustVoiceDAO extends EmfAbstractDAO {
	
	/**
	 * 고객의 소리를 등록한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertCustVoice(EmfMap emfMap) throws Exception
	{
		insert("CSACustVoiceDAO.insertCustVoice", emfMap);
	}
	
	/**
     * 고객의 소리 상세를 조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public EmfMap selectCustVoice(EmfMap emfMap) throws Exception 
    {
    	return (EmfMap) selectByPk("CSACustVoiceDAO.selectCustVoice", emfMap);
    }
	
	/**
     * 고객의 소리 관련 관리자 목록을 조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public List<EmfMap> selectCustVoiceAdmList(EmfMap emfMap) throws Exception 
    {
    	return list("CSACustVoiceDAO.selectCustVoiceAdmList", emfMap);
    }
}
