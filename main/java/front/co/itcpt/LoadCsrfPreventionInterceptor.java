package front.co.itcpt;

import java.security.SecureRandom;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;


public class LoadCsrfPreventionInterceptor extends HandlerInterceptorAdapter
{
	@Override
	public boolean preHandle(HttpServletRequest httpReq, HttpServletResponse response, Object handler) throws Exception 
	{		
		Cache<String, Boolean> csrfPreventionSaltCache = (Cache<String, Boolean>) httpReq.getSession().getAttribute("csrfPreventionSaltCache");
		
		if(csrfPreventionSaltCache == null)
		{
			csrfPreventionSaltCache = CacheBuilder.newBuilder().maximumSize(5000).expireAfterWrite(20, TimeUnit.MINUTES).build();
			httpReq.getSession().setAttribute("csrfPreventionSaltCache", csrfPreventionSaltCache);		
		}	
		
		String salt = RandomStringUtils.random(20, 0, 0, true, true, null, new SecureRandom());	
		csrfPreventionSaltCache.put(salt, Boolean.TRUE);	
		httpReq.setAttribute("csrfPreventionSalt", salt);
		return true;
	}
}
