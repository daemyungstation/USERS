package front.lp.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 온라인 상품가입을 위한 DAO
 * </pre>
 * 
 * @ClassName		: LGAMemLoginDAO.java
 * @Description		: 온라인 상품가입을 위한 DAO
 * @author 김필기
 * @since 2016.03.04
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				 description
 *   ==========    ==============    =============================
 *   2016.03.04		   김필기				  최초 생성
 * </pre>
 */ 
@Repository("lPAOnlinePrdctDAO")
public class LPAOnlinePrdctDAO extends EmfAbstractDAO {
	/**
	 * 최근에 적용된 약관을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public EmfMap selectTopTerms(EmfMap emfMap) throws Exception
    {
    	return (EmfMap)selectByPk("LPAOnlinePrdctDAO.selectTopTerms", emfMap);
    }	
    
	/**
     * 온라인 상품 그룹 목록을 조회한다.
     * 
     * @param EmfMap
	 * @return EmfMap
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */

	public List<EmfMap> selectOnlinePrdctList(EmfMap emfMap) throws Exception
	{
		return list("LPAOnlinePrdctDAO.selectOnlinePrdctList", emfMap);
	}
	
    /**
     * 온라인 상담신청 고객정보를 등록한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public void insertOnlinePrdctCsMng(EmfMap emfMap) throws Exception 
	{
		insert("LPAOnlinePrdctDAO.insertOnlinePrdctCsMng", emfMap);
    }

    /**
     * 온라인 상담신청 상품정보를 등록한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public void insertOnlinePrdctInf(EmfMap emfMap) throws Exception 
	{
		insert("LPAOnlinePrdctDAO.insertOnlinePrdctInf", emfMap);
    }
	
    /**
     * 온라인 상담신청 계좌정보를 등록한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
	public void insertOnlinePrdctAcntInf(EmfMap emfMap) throws Exception 
	{
		insert("LPAOnlinePrdctDAO.insertOnlinePrdctAcntInf", emfMap);
    }	
	
	/**
	 * 회사 목록을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	public List<EmfMap> selectCompanyList(EmfMap emfMap) throws Exception 
    {
    	return list("LPAOnlinePrdctDAO.selectCompanyList", emfMap);
    }			
	
	/**
	 * 선택한 상품에 따른 약관 그룹 코드 조회
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	public List<EmfMap> selectTermsGrpCd(EmfMap emfMap) throws Exception 
    {
    	return list("LPAOnlinePrdctDAO.selectTermsGrpCd", emfMap);
    }	
	

	/**
	 * 약관별관리 상세내용을 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectTermsDtl(EmfMap emfMap) throws Exception 
    {
    	return list("LPAOnlinePrdctDAO.selectTermsDtl", emfMap);
    }

	/**
	 * 가입신청일자를 기준으로 적용된 약관 및 계약안내 키를 조회한다.
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectMemTermMst(EmfMap emfMap) throws Exception 
    {
    	return (EmfMap)selectByPk("LPAOnlinePrdctDAO.selectMemTermMst", emfMap);
    }
	
	
	/**
	 *	특정 메뉴 권한을 가진 관리자 이메일 정보 가져오기
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectAdminEmail(EmfMap emfMap) throws Exception 
    {
    	return list("LPAOnlinePrdctDAO.selectAdminEmail", emfMap);
    }
	
	/**
	 * 약관 및 계약안내 설정 확인
	 * 
	 * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */	
	public List<EmfMap> selectCheckTermGrp(EmfMap emfMap) throws Exception 
    {
    	return list("LPAOnlinePrdctDAO.selectCheckTermGrp", emfMap);
    }		
}
