/*    */ package emf.core.request;
/*    */

/*    */ import java.util.Map;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import org.apache.commons.logging.Log;
/*    */ import org.apache.commons.logging.LogFactory;
/*    */ 
/*    */ public abstract class EmfWebAdapter
/*    */   implements EmfWebUiAdapter
/*    */ {
/*    */   public static final String LOCAL_SESSION = "HAE_FRAMEWORK_REQUESTHOLDER_SESSION_ATTRIBUTE";
/* 37 */   protected Log log = LogFactory.getLog(getClass());
/*    */   private Object obj;
/*    */ 
/*    */   public abstract Object converte4In(Object paramObject, HttpServletRequest paramHttpServletRequest);
/*    */ 
/*    */   public abstract Class getModelName();
/*    */ }

/* Location:           D:\프로그램\0.1.022\hae_core-0.1.022.jar
 * Qualified Name:     hae.core.request.HaeWebAdapter
 * JD-Core Version:    0.6.2
 */