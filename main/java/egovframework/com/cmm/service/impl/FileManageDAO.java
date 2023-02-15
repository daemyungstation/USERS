package egovframework.com.cmm.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import emf.core.extend.dao.EmfAbstractDAO;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 파일정보 관리를 위한 데이터 처리 클래스
 * </pre>
 * 
 * @ClassName		: EgovFileMngDAO.java
 * @Description		: 파일정보 관리를 위한 데이터 처리 클래스
 * @author 이삼섭
 * @since 2009. 3. 25
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since			author					description
 *   ===========    ==============    =============================
 *    2009. 3. 25.     이삼섭    						최초생성
 * </pre>
 */
@Repository("FileManageDAO")
public class FileManageDAO extends EmfAbstractDAO {

	/**
	 * 파일 목록을 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return List<EmfMap> 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public List<EmfMap> selectFileInfs(EmfMap emfMap) throws Exception 
    {
    	return list("FileManageDAO.selectFileInfs", emfMap);
    }
    
    /**
	 * 파일 상세를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return EmfMap 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public EmfMap selectFileInf(EmfMap emfMap) throws Exception
    {
    	return (EmfMap) selectByPk("FileManageDAO.selectFileInf", emfMap);
    }
    
    /**
     * 파일 마스터를 등록한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public void insertFileMaster(EmfMap emfMap) throws Exception 
    {
    	insert("FileManageDAO.insertFileMaster", emfMap);
    }
    
    /**
     * 파일 상세를 등록한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public void insertFileDetail(EmfMap emfMap) throws Exception 
    {
    	 insert("FileManageDAO.insertFileDetail", emfMap);
    }
    
    /**
     * 파일 상세를 수정한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public void updateFileDetail(EmfMap emfMap) throws Exception
    {
    	update("FileManageDAO.updateFileDetail", emfMap);
    }

    /**
     * 파일 상세를 삭제한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public void deleteFileDetail(EmfMap emfMap) throws Exception 
    {
    	delete("FileManageDAO.deleteFileDetail", emfMap);
    }

    /**
     * 전체 파일을 삭제한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public void deleteAllFileInf(EmfMap emfMap) throws Exception 
    {
    	update("FileManageDAO.deleteAllFileInf", emfMap);
    }

    /**
     * 파일명 검색에 대한 목록을 조회한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return List<EmfMap> 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public List<EmfMap> selectFileListByFileNm(EmfMap emfMap) throws Exception 
    {
    	return list("FileManageDAO.selectFileListByFileNm", emfMap);
    }
    
    /**
     * 이미지 파일에 대한 목록을 조회한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return List<EmfMap> 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public List<EmfMap> selectImageFileList(EmfMap emfMap) throws Exception
    {
    	return list("FileManageDAO.selectImageFileList", emfMap);
    }
    
    /**
     * 파일 마스터에 데이터가 있는지 확인한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return int 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public int getParntFileCnt(String atchFileId) throws Exception 
    {
    	return (Integer) selectByPk("FileManageDAO.getParntFileCnt", atchFileId);
    }
    
    /**
     * 파일ID에 대한 최대 파일순번을 가져온다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return int 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public int getMaxFileSeq(EmfMap emfMap) throws Exception
    {
    	return (Integer) selectByPk("FileManageDAO.getMaxFileSeq", emfMap);
    }
    
    /**
     * 파일의 갯수를 가져온다.
     * 
     * @param String 검색할 데이터
	 * @return int 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public int getFileListCnt(String val) throws Exception 
    {
    	return (Integer) selectByPk("FileManageDAO.getFileListCnt", val);
    }
    
    /**
     * 파일 다운로드 횟수를 증가시킨다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public void updateFileCnt(EmfMap emfMap) throws Exception
    {
    	update("FileManageDAO.updateFileCnt", emfMap);
    }    
}
