package emf.core.extend.web;
 
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

/**
 * <pre> 
 * Controller
 * </pre>
 * 
 * @ClassName		: EmfController.java
 * @Description		: Controller 확장
 * @author 박주석
 * @since 2015.11.02
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 * 		since			author					description
 *   ===========    ==============    =============================
 *    2015.11.02		박주석					최초생성
 * </pre>
 */ 
 public class EmfController
 {
	//로그
	protected Log log = LogFactory.getLog(getClass());
 
	protected final WebApplicationContext getContext()
	{
	   return ContextLoader.getCurrentWebApplicationContext();
	}
 }
