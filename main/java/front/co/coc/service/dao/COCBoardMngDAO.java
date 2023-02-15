/**
 * 
 */
package front.co.coc.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 게시글 관리를 위한 DAO
 * </pre>
 * 
 * @ClassName		: COCBoardMngDAO
 * @Description		: 게시글 관리를 위한 DAO
 * @author 허진영
 * @since 2015.04.11
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since			author				  description
 *    ==========    ==============    =============================
 *    2015.04.11		허진영				   최초 생성
 * </pre>
 */
@Repository("cOCBoardMngDAO")
public class COCBoardMngDAO extends EmfAbstractDAO {

    /**
     * 게시판 속성정보 한 건을 상세조회 한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return EmfMap 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public EmfMap selectMaster(EmfMap emfMap) throws Exception 
    {
    	return (EmfMap)selectByPk("COCBoardMngDAO.selectMaster", emfMap);
    }
    
    /**
	 * 게시판 속성정보기반으로 공지사항 데이터를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return List<EmfMap> 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectNoticeBoardList(EmfMap emfMap) throws Exception
	{
		return list("COCBoardMngDAO.selectNoticeBoardList", emfMap);
	}

	/**
	 * 게시판 속성정보기반으로 데이터를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return List<EmfMap> 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectBoardList(EmfMap emfMap) throws Exception
	{
		return list("COCBoardMngDAO.selectBoardList", emfMap);
	}    
	
    /**
     * 게시물 한 건에 대하여 상세 내용을 조회 한다.
     * 
	 * @return EmfMap 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public EmfMap selectBoardRead(EmfMap emfMap) throws Exception 
    {
    	return (EmfMap)selectByPk("COCBoardMngDAO.selectBoardRead", emfMap);
    }

	/**
	 * 게시물을 등록한다.
	 * 
	 * @param EmfMap 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertBoardArticle(EmfMap emfMap) throws Exception
	{
		insert("COCBoardMngDAO.insertBoardArticle", emfMap);
	}
	
	/**
	 * 게시물을 수정한다.
	 * 
	 * @param EmfMap 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateBoardArticle(EmfMap emfMap) throws Exception
	{
		update("COCBoardMngDAO.updateBoardArticle", emfMap);
	}
	
	/**
	 * 게시물에 대한 조회 건수를 수정 한다.
	 * 
	 * @param EmfMap 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public void updateReadCnt(EmfMap emfMap) throws Exception 
    {
    	update("COCBoardMngDAO.updateReadCnt", emfMap);
    }
    
	/**
	 * 해당 게시물에 이전글 조회한다.
	 * 
	 * @param EmfMap 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public EmfMap selectBoardPrev(EmfMap emfMap) throws Exception 
    {
    	return (EmfMap) selectByPk("COCBoardMngDAO.selectBoardPrev", emfMap);
    }
    
	/**
	 * 해당 게시물에 다음글 조회한다.
	 * 
	 * @param EmfMap 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public EmfMap selectBoardNext(EmfMap emfMap) throws Exception 
    {
    	return (EmfMap) selectByPk("COCBoardMngDAO.selectBoardNext", emfMap);
    }

	/**
	 * 게시글 삭제한다.
	 * 
	 * @param EmfMap 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void deleteBoardArticle(EmfMap emfMap) throws Exception
	{
		update("COCBoardMngDAO.deleteBoardArticle", emfMap);
	}
    
	/**
	 * 카테고리 구분 값을 가져온다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return List<EmfMap> 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public List<EmfMap> selectCategoryGbList(String categoryId) throws Exception
	{ 
		return list("COCBoardMngDAO.selectCategoryGbList", categoryId);
	}	
}
