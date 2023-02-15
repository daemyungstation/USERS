package front.cs.csa.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * VOC DAO
 * </pre>
 * 
 * @ClassName		: CSAVocDAO.java
 * @Description		: VOC DAO
 * @author 장준일
 * @since 2021.02.23
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2021.02.23		   장준일				  최초 생성
 * </pre>
 */ 
@Repository("cSAVocDAO")
public class CSAVocDAO extends EmfAbstractDAO {
	/**
	 * VOC 마지막 행을 가져온다
	 * 
	 * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public String selectMaxVoc() throws Exception
	{
		return (String) selectByPk("CSAVocDAO.selectMaxVoc", null);
	}
	
	/**
	 * VOC를 등록한다.
	 * 
	 * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertVoc(EmfMap emfMap) throws Exception
	{
		insert("CSAVocDAO.insertVoc", emfMap);
	}
	
}
