package emf.core.vo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

import org.apache.commons.collections.map.ListOrderedMap;

import emf.core.util.EMFStringUtil;

public class EmfMap extends ListOrderedMap
{
  private static final long serialVersionUID = 1L;
  private static final String CAMEL_YN = "Y";
  public Object put(Object key, Object value)
  {
	   if ("Y".equals("Y")) 
	   {
			return super.put(EMFStringUtil.haeConvert2Camel((String)key), value);
	   }
	   return super.put(key, value);
  }

  public Set<String> keySet()
  {
	   return super.keySet();
  }

  public Object clone()
  {
	   Object obj = new Object();
    try {
   	 obj = super.clone();
    } catch (Exception e) {
   	 e.getMessage();
    }
    return obj;
  }

  public Object get(int index)
  {
	   return super.get(index);
  }
  
	/**
	* 맵의 데이터를 가져온다
	* 
	* @param Object
	* @return null 이면 ""로 받는다.
	* @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	*/
	public String getString(Object str)
	{		
		Object src = this.get(str);
		
		if (src != null && src instanceof java.math.BigDecimal) {
		    return ((BigDecimal)src).toString();
		}
		
		if (src != null && src instanceof Integer) {
		    return src.toString();
		}

		if (src == null || src.equals("null")) {
		    return "";
		} else {
		    return ((String)src).trim();
		}
	}
	
	/**
	* 맵의 데이터를 리스트로 가져온다
	* 
	* @param Object
	* @return null 이면 ""로 받는다.
	* @throws 비지니스 로직이나 DAO 처리 중 에러가 발생할 경우 Exception을 Throw 한다.
	*/
	public List<String> getList(Object str)
	{		
		Object src = this.get(str);		
		
		if (src == null) 
		{
		    return new ArrayList();
		}
		else
		{
			if(src instanceof Object[])
			{
				ArrayList list = new ArrayList(Arrays.asList( (Object[])super.get(str) ));
				return list;
			}
			else
			{
				ArrayList list = new ArrayList();
				list.add(src);
				return list;
			}			
		}
	}
}