package front.co.coc.service;

import emf.core.vo.EmfMap;

/**
 * <pre> 
 * 게시글 댓글 관리를 위한 Service
 * </pre>
 * 
 * @ClassName		: COCBoardCommentService.java
 * @Description		: 게시글 댓글 관리를 위한 Service
 * @author 허진영
 * @since 2016.04.12
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since		   author				  description
 *   ==========    ==============    =============================
 *   2016.04.12		   허진영				   최초 생성
 * </pre>
 */
public interface COCBoardCommentService {
	
	/**
	 * 게시글에 대한 댓글 목록을 조회힌다.
	 * 
	 * @param EmfMap 검색할 데이터
	 * @return EmfMap 조회조건에 검색된 데이터
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public EmfMap selectBoardCommentList(EmfMap emfMap) throws Exception;

	/**
	 * 게시글에 대한 댓글을 등록한다.
	 * 
	 * @param EmfMap 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void insertBoardComment(EmfMap emfMap) throws Exception;	

	/**
	 * 게시글에 대한 댓글을 수정한다.
	 * 
	 * @param EmfMap 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void updateBoardComment(EmfMap emfMap) throws Exception;
	
	/**
	 * 게시글에 대한 댓글을 삭제한다.
	 * 
	 * @param EmfMap 데이터
	 * @return 
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public void deleteBoardComment(EmfMap emfMap) throws Exception;	
}
