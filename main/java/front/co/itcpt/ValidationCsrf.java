package front.co.itcpt;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.google.common.cache.Cache;

public class ValidationCsrf extends HandlerInterceptorAdapter 
{
	@Override
	public boolean preHandle(HttpServletRequest httpReq, HttpServletResponse response, Object handler) throws Exception 
	{		
		String salt = (String)httpReq.getParameter("csrfPreventionSalt");
		
		Cache<String, Boolean> csrfPreventionSaltCache = (Cache<String, Boolean>) httpReq.getSession().getAttribute("csrfPreventionSaltCache");		
		
		if(csrfPreventionSaltCache != null && salt != null && csrfPreventionSaltCache.getIfPresent(salt) != null)
		{
			return true;
		}
		else
		{
			System.out.println("ValidationCsrf ERROR : " + httpReq.getRequestURI());
			throw new ServletException("Potential CSRF detected!! Informm a scary sysadmin ASAP.");
		}
	}
}
