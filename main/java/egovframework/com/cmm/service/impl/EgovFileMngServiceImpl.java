package egovframework.com.cmm.service.impl;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.sim.service.EgovNetworkState;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 파일정보의 관리를 위한 구현 클래스
 * </pre>
 * 
 * @ClassName		: EgovFileMngServiceImpl.java
 * @Description		: 파일정보의 관리를 위한 구현 클래스
 * @author 이삼섭
 * @since 2009. 3. 25
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since			author				  description
 *   ===========    ==============    =============================
 *    2009. 3. 25.      이삼섭    			   최초생성
 * </pre>
 */
@Service("EgovFileMngService")
public class EgovFileMngServiceImpl extends EmfAbstractService implements EgovFileMngService {

    @Resource(name="FileManageDAO")
    private FileManageDAO fileMngDAO;

    public static final Logger LOGGER = Logger.getLogger(EgovFileMngServiceImpl.class.getName());

    /**
	 * 파일 목록을 조회한다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return List<EmfMap> 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public List<EmfMap> selectFileInfs(EmfMap emfMap) throws Exception
    {
		return fileMngDAO.selectFileInfs(emfMap);	
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
    	return fileMngDAO.selectFileInf(emfMap);
    }
    
    /**
     * 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public void insertFileInf(EmfMap emfMap) throws Exception
    {
    	EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
    	
    	emfMap.put("regId", lgnMap.getString("id"));
    	emfMap.put("regIp", lgnMap.getString("loginIp"));
    	emfMap.put("modId", lgnMap.getString("id"));
    	emfMap.put("modIp", lgnMap.getString("loginIp"));
    	
    	//파일 마스터를 등록한다.
    	fileMngDAO.insertFileMaster(emfMap);
    	
    	//파일 상세를 등록한다.
    	fileMngDAO.insertFileDetail(emfMap);
    }

    /**
     * 여러 개의 파일에 대한 정보(속성 및 상세)를 등록한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return String 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public String insertFileInfs(List<EmfMap> fvoList) throws Exception 
    {
    	String atchFileId = null;
    	
    	if (fvoList.size() > 0) 
    	{
    		EmfMap emfMap = (EmfMap) fvoList.get(0);
    		
    		if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("atchFileId"))))
    		{
    			EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
    			
    			if(lgnMap != null)
    			{
    				emfMap.put("regId", lgnMap.getString("id"));
        			emfMap.put("regIp", lgnMap.getString("loginIp"));
        			emfMap.put("modId", lgnMap.getString("id"));
        			emfMap.put("modIp", lgnMap.getString("loginIp"));
    			}
    			else
    			{
    				emfMap.put("regIp", EgovNetworkState.getMyIPaddress());
    				emfMap.put("modIp", EgovNetworkState.getMyIPaddress());
    			}
    			
    			int parntCnt = fileMngDAO.getParntFileCnt(emfMap.getString("atchFileId"));
    			
    			if(parntCnt < 1)
    			{
    				fileMngDAO.insertFileMaster(emfMap);
    			}
        		
        		Iterator iter = fvoList.iterator();
        		
        		while (iter.hasNext()) 
        		{
        			emfMap = (EmfMap)iter.next();
        			
        			if(lgnMap != null)
        			{
        				emfMap.put("regId", lgnMap.getString("id"));
            			emfMap.put("regIp", lgnMap.getString("loginIp"));
            			emfMap.put("modId", lgnMap.getString("id"));
            			emfMap.put("modIp", lgnMap.getString("loginIp"));
        			}
        			else
        			{
        				emfMap.put("regIp", EgovNetworkState.getMyIPaddress());
        				emfMap.put("modIp", EgovNetworkState.getMyIPaddress());
        			}
        			
        			fileMngDAO.insertFileDetail(emfMap);
        		}
        		
        		atchFileId = emfMap.getString("atchFileId");
    		}
    	}
    	
    	return atchFileId;
    }
    
    /**
     * 하나의 파일에 대한 정보(속성 및 상세)를 수정한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public void updateFileInf(EmfMap emfMap) throws Exception 
    {
    	EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
    	
    	if(lgnMap != null)
		{
			emfMap.put("modId", lgnMap.getString("id"));
			emfMap.put("modIp", lgnMap.getString("loginIp"));
		}
		else
		{
			emfMap.put("modIp", EgovNetworkState.getMyIPaddress());
		}
    	
    	fileMngDAO.updateFileDetail(emfMap);
    }
    
    /**
     * 여러 개의 파일에 대한 정보(속성 및 상세)를 수정한다.
     * 
     * @param List<EmfMap> 검색할 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public void updateFileInfs(List<EmfMap> fvoList) throws Exception 
    {
    	//Delete & Insert
    	EmfMap lgnMap = (EmfMap) EgovUserDetailsHelper.getAuthenticatedUser();
    	
    	EmfMap emfMap = new EmfMap();
    	
    	Iterator iter = fvoList.iterator();
		
		while (iter.hasNext()) 
		{
			emfMap = (EmfMap)iter.next();
			
			if(lgnMap != null)
			{
				emfMap.put("regId", lgnMap.getString("id"));
    			emfMap.put("regIp", lgnMap.getString("loginIp"));
    			emfMap.put("modId", lgnMap.getString("id"));
    			emfMap.put("modIp", lgnMap.getString("loginIp"));
			}
			else
			{
				emfMap.put("regIp", EgovNetworkState.getMyIPaddress());
				emfMap.put("modIp", EgovNetworkState.getMyIPaddress());
			}
			
			//파일 상세를 삭제한다.
			fileMngDAO.deleteFileDetail(emfMap);
			
			//파일 상세를 등록한다.
			fileMngDAO.insertFileDetail(emfMap);
		}
    }
    
    /**
     * 하나의 파일을 삭제한다.
     * 
     * @param EmfMap 검색할 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public void deleteFileInf(EmfMap emfMap) throws Exception 
    {
    	fileMngDAO.deleteFileDetail(emfMap);
    }
    
    /**
	 * 여러 개의 파일을 삭제한다.
	 * 
	 * @param List<EmfMap> 검색할 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
    public void deleteFileInfs(List<EmfMap> fvoList) throws Exception 
    {
    	EmfMap emfMap = new EmfMap();
    	
    	Iterator iter = fvoList.iterator();
		
		while (iter.hasNext()) 
		{
			emfMap = (EmfMap)iter.next();
			
			fileMngDAO.deleteFileDetail(emfMap);
		}
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
    	fileMngDAO.deleteAllFileInf(emfMap);
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
		return fileMngDAO.selectFileListByFileNm(emfMap);		
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
    	return fileMngDAO.selectImageFileList(emfMap);
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
    	return fileMngDAO.getMaxFileSeq(emfMap);
    }
    
    /**
     * 파일ID에 대한 파일갯수를 가져온다.
     * 
     * @param String 검색할 데이터
	 * @return int 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
     */
    public int getFileListCnt(String val) throws Exception 
    {
    	return fileMngDAO.getFileListCnt(val);
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
    	fileMngDAO.updateFileCnt(emfMap);
    }
}
