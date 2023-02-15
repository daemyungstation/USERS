package front.co.util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import emf.core.vo.EmfMap;

/**
 * 페이징 처리 함수
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    	 --------    ---------------------------
 *   2015.07.20  박주석          최초 생성
 *
 * </pre>
 */
public class COPaginationUtil {
	
	//페이지 사이즈
	private static int PageSize = 10;
	
	//리스트 사이즈
	private static int CntPage = 10;
	
	/**
	 * 페이지 정보를 가져온다.
	 * 
	 * @param pageNo 현재 페이지
	 * @param countPage 가져올 리스트 수
	 * @return resultVO:HaeMap 페이징 결과
	 * @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	 */
	public static PaginationInfo getPage(EmfMap emfMap) throws Exception
	{
		if("".equals( emfMap.getString("pageIndex") ))
		{
			emfMap.put("pageIndex", 1);
		}
		
		int pageN = Integer.parseInt( emfMap.getString("pageIndex") );
		
		PaginationInfo page = new PaginationInfo();
    	page.setCurrentPageNo(pageN);
    	
    	if("".equals( emfMap.getString("cntPage") ))
    	{
    		page.setRecordCountPerPage( CntPage );
    	}
    	else
    	{
    		page.setRecordCountPerPage(Integer.parseInt(emfMap.get("cntPage").toString()));
    	}
    	
    	page.setPageSize(PageSize);
    	
    	emfMap.put("firstIndex", page.getFirstRecordIndex());
    	emfMap.put("recordCountPerPage", page.getRecordCountPerPage());
    	
		return page;
	}
}
