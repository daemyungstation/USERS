package emf.core.request;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;

import egovframework.com.cmm.EgovWebUtil;
import emf.core.vo.EmfMap;

public class EmfWebCustomArgumentResolver implements WebArgumentResolver
{
	protected static final Log log = LogFactory.getLog(EmfWebCustomArgumentResolver.class);
	
	/**
	 * 로그인 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	public Object resolveArgument(MethodParameter methodParameter, NativeWebRequest webRequest)  throws Exception
	{
		Class<?> clazz = methodParameter.getParameterType();
		String paramName = methodParameter.getParameterName();
		if ( clazz.equals(EmfMap.class)  ) 
		{
			EmfMap commandMap = new EmfMap();
			HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
			Enumeration<?> enumeration = request.getParameterNames();
			while (enumeration.hasMoreElements()) 
			{
				String key = (String) enumeration.nextElement();
				String[] values = request.getParameterValues(key);
				if (values != null) 
				{
					for(int q = 0 ; q < values.length ; q++)
	            	{
	            		values[q] = EgovWebUtil.clearXSSMinimum(values[q]);
	            	}
					commandMap.put(key, (values.length > 1) ? values : values[0]);
				}
			}
			return commandMap;
		}
		return UNRESOLVED;
	}
}
