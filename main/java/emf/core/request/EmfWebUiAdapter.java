package emf.core.request;

import javax.servlet.http.HttpServletRequest;

public abstract interface EmfWebUiAdapter
{
  public abstract Object convert(HttpServletRequest paramHttpServletRequest)
    throws Exception;

  public abstract Class getModelName();
}

/* Location:           D:\프로그램\0.1.022\hae_core-0.1.022.jar
 * Qualified Name:     hae.core.request.HaeWebUiAdapter
 * JD-Core Version:    0.6.2
 */