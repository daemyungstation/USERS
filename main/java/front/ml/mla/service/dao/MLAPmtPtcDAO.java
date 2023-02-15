package front.ml.mla.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractOutDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 납입현황 조회를 위한 DAO
 * </pre>
 * 
 * @ClassName		: MLAPmtPtcDAO.java
 * @Description		: 납입현황 조회를 위한 DAO
 * @author 허진영
 * @since 2016.03.15
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.15		   허진영				  최초 생성
 * </pre>
 */ 
@Repository("mLAPmtPtcDAO")
public class MLAPmtPtcDAO extends EmfAbstractOutDAO {
	
	/**
	 * 납입현황 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectPmtPtcList(EmfMap emfMap) throws Exception
	{
		return list("MLAPmtPtcDAO.selectPmtPtcList", emfMap);
	}
	
	/**
	 * 납입현황상세 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectPmtPtcDtlList(EmfMap emfMap) throws Exception
	{
		return list("MLAPmtPtcDAO.selectPmtPtcDtlList", emfMap);
	}
	
	
	/**
	 * 납입현황 상세내용을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectPmtPtcInfo(EmfMap emfMap) throws Exception
	{
		return (EmfMap)selectByPk("MLAPmtPtcDAO.selectPmtPtcInfo", emfMap);
	}	
	
	/**
	 * 담당자의 부서를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectDeptInf(EmfMap emfMap) throws Exception
	{
		return (EmfMap)selectByPk("MLAPmtPtcDAO.selectDeptInf", emfMap);
	}		

	/**
	 * 상품 상세정보를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectProductDtlInf(EmfMap emfMap) throws Exception
	{
		return (EmfMap)selectByPk("MLAPmtPtcDAO.selectProductDtlInf", emfMap);
	}	
	
}
