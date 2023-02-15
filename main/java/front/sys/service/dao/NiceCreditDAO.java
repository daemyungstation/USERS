package front.sys.service.dao;

import emf.core.extend.dao.EmfAbstractSmsDAO;
import java.util.Map;
import org.springframework.stereotype.Repository;

@Repository
public class NiceCreditDAO
  extends EmfAbstractSmsDAO
{
  public int updateNiceSafekeyMobileIssueResult(Map<String, ?> pmParam)
    throws Exception
  {
    int iCnt = -1;
    try
    {
      iCnt = insert("NiceCreditMap.updateNiceSafekeyMobileIssueResult", pmParam);
    }
    catch (Exception ex)
    {
      ex.printStackTrace();
    }
    return iCnt;
  }
  
  public int insertNiceVacctNoti(Map<String, Object> pmParam)
    throws Exception
  {
    return insert("NiceCreditMap.insertNiceVacctNoti", pmParam);
  }
  
  //이니시스 가상계좌 결과 등록 20200519
  public int insertInicisResult(Map<String, Object> pmParam) throws Exception
  {
    return insert("NiceCreditMap.insertInicisResult", pmParam);
  }
}
