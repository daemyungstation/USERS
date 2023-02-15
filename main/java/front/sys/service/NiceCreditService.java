package front.sys.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public abstract interface NiceCreditService
{
  public abstract void updateNiceSafekeyMobileIssueResult(HttpServletRequest paramHttpServletRequest, boolean paramBoolean)
    throws Exception;
  
  // 나이스 가상계좌 결과 등록
  public abstract int insertNiceVacctNoti(Map<String, Object> paramMap)
    throws Exception;
  
  // 이니시스 가상계좌 결과 등록 20200519
  public abstract int insertInicisResult(Map<String, Object> paramMap)
    throws Exception;
}
