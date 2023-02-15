package egovframework.com.cmm;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;
/**
 * ImagePaginationRenderer.java 클래스
 * 
 * @author 서준식
 * @since 2011. 9. 16.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    -------------    ----------------------
 *   2011. 9. 16.   서준식       이미지 경로에 ContextPath추가
 * </pre>
 */
public class ImagePaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware {

	private ServletContext servletContext;
	
	public ImagePaginationRenderer() 
	{
	
	}
	
	public void initVariables()
	{
		firstPageLabel    = "<a href=\"javascript:\" onclick=\"{0}({1}); return false;\" class=\"fir\" title=\"처음\"><img src=\"/common/images/btn/pagin_fir.gif\" alt=\"\" /></a>";
        previousPageLabel = "<a href=\"javascript:\" onclick=\"{0}({1}); return false;\" class=\"prv\" title=\"이전\"><img src=\"/common/images/btn/pagin_prv.gif\" alt=\"\" /></a>";
        currentPageLabel  = "<strong>{0}</strong>";
        otherPageLabel    = "<a href=\"javascript:\" onclick=\"{0}({1}); return false;\">{2}</a>";
        nextPageLabel     = "<a href=\"javascript:\" onclick=\"{0}({1}); return false;\" class=\"nxt\" title=\"다음\"><img src=\"/common/images/btn/pagin_end.gif\" alt=\"\" /></a>";
        lastPageLabel     = "<a href=\"javascript:\" onclick=\"{0}({1}); return false;\" class=\"end\" title=\"끝\"><img src=\"/common/images/btn/pagin_nxt.gif\" alt=\"\" /></a>";
	}

	public void setServletContext(ServletContext servletContext) 
	{
		this.servletContext = servletContext;
		
		initVariables();
	}
}
