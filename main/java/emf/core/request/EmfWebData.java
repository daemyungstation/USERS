package emf.core.request;

import java.io.Serializable;

import emf.core.vo.EmfMap;

public abstract interface EmfWebData extends Serializable, Cloneable
{
  public abstract EmfMap getHaeder();

  public abstract EmfMap getParam();

  public abstract void putHaeVO(EmfMap paramHaeVO);
}