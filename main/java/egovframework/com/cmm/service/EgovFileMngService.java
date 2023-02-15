package egovframework.com.cmm.service;

import java.util.List;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 파일정보의 관리를 위한 서비스 인터페이스
 * </pre>
 * 
 * @ClassName		: EgovFileMngService.java
 * @Description		: 파일정보의 관리를 위한 서비스 인터페이스
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
public interface EgovFileMngService {
	
    /**
   	 * 파일 목록을 조회한다.
   	 * 
   	 * @param EmfMap 검색할 데이터
   	 * @return EmfMap 조회조건에 검색된 데이터
   	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
   	 */
    public List<EmfMap> selectFileInfs(EmfMap emfMap) throws Exception;
    
    /**
	 * 파일 상세를 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return EmfMap 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public EmfMap selectFileInf(EmfMap emfMap) throws Exception;

    /**
     * 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
     * 
     * @param EmfMap
	 * @return String
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public void insertFileInf(EmfMap emfMap) throws Exception;
    
    /**
     * 여러 개의 파일에 대한 정보(속성 및 상세)를 등록한다.
     * 
     * @param List<EmfMap>
	 * @return String
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public String insertFileInfs(List<EmfMap> fvoList) throws Exception;

    /**
     * 하나의 파일에 대한 정보(속성 및 상세)를 수정한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public void updateFileInf(EmfMap emfMap) throws Exception;
    
    /**
     * 여러 개의 파일에 대한 정보(속성 및 상세)를 수정한다.
     * 
     * @param List<EmfMap>
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public void updateFileInfs(List<EmfMap> fvoList) throws Exception;

    /**
     * 하나의 파일을 삭제한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public void deleteFileInf(EmfMap emfMap) throws Exception;
    
    /**
     * 여러 개의 파일을 삭제한다.
     * 
     * @param List<EmfMap>
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public void deleteFileInfs(List<EmfMap> fvoList) throws Exception;
    
    /**
     * 전체 파일을 삭제한다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public void deleteAllFileInf(EmfMap emfMap) throws Exception;
    
    /**
     * 파일명 검색에 대한 목록을 조회한다.
     * 
     * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public List<EmfMap> selectFileListByFileNm(EmfMap emfMap) throws Exception;

    /**
     * 이미지 파일에 대한 목록을 조회한다.
     * 
     * @param EmfMap
	 * @return List<EmfMap>
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public List<EmfMap> selectImageFileList(EmfMap emfMap) throws Exception;
    
    /**
     * 파일ID에 대한 최대 파일순번을 가져온다.
     * 
     * @param EmfMap
	 * @return int
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public int getMaxFileSeq(EmfMap emfMap) throws Exception;
    
    /**
     * 파일ID에 대한 파일갯수를 가져온다.
     * 
     * @param String 검색할 데이터
	 * @return int 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public int getFileListCnt(String val) throws Exception ;
    
    /**
     * 파일 다운로드 횟수를 증가시킨다.
     * 
     * @param EmfMap
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public void updateFileCnt(EmfMap emfMap) throws Exception;    
}
