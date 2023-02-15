package front.sys.service.impl;

import NiceID.Check.CPClient;
import egovframework.com.cmm.service.EgovProperties;
import emf.core.extend.service.EmfAbstractService;
import emf.core.util.CommonUtils;
import emf.core.util.NiceCreditUtil;
import front.sys.service.NiceCreditService;
import front.sys.service.dao.NiceCreditDAO;
import java.io.PrintStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class NiceCreditServiceImpl
  extends EmfAbstractService
  implements NiceCreditService
{
  private final Logger log = LoggerFactory.getLogger(NiceCreditServiceImpl.class);
  @Resource
  public NiceCreditDAO niceCreditDAO;
  
  public void updateNiceSafekeyMobileIssueResult(HttpServletRequest request, boolean isSuccess)
    throws Exception
  {
    System.out.println("");
    System.out.println("###################### safekey_sms_return #####################");
    System.out.println("");
    
    CPClient niceCheck = new CPClient();
    
    String sEncodeData = NiceCreditUtil.requestReplace(request.getParameter("EncodeData"), "encodeData");
    
    String sSiteCode = EgovProperties.getProperty("nice.safekey.weblink.sitecode");
    String sSitePassword = EgovProperties.getProperty("nice.safekey.weblink.sitepw");
    
    String sReqDthms = NiceCreditUtil.requestReplace(request.getParameter("param_r1"), "");
    String sLoginid = NiceCreditUtil.requestReplace(request.getParameter("param_r2"), "");
    String sMemNo = NiceCreditUtil.requestReplace(request.getParameter("param_r3"), "");
    
    System.out.println("########################## Start Parameter Dump");
    
    Enumeration<String> e = request.getParameterNames();
    while (e.hasMoreElements())
    {
      String name = (String)e.nextElement();
      String[] data = request.getParameterValues(name);
      String sVal = "";
      for (int i = 0; i < data.length; i++) {
        sVal = sVal + ", " + data[i];
      }
      System.out.println(name + " : " + sVal);
    }
    System.out.println("########################## End Parameter Dump");
    
    String sPlainData = "";
    String sSafekey = "";
    
    String sRequestNumber = "";
    
    String sReturnCode = "";
    String sReturnMsg = "";
    
    String sAuthTime = "";
    String sAuthType = "";
    
    String sCi = "";
    String sMobileno = "";
    String sErrMsg = "";
    
    System.out.println("sSiteCode : " + sSiteCode);
    System.out.println("sSitePassword : " + sSitePassword);
    
    int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);
    if (iReturn == 0)
    {
      sPlainData = niceCheck.getPlainData();
      
      HashMap mapresult = niceCheck.fnParse(sPlainData);
      
      sSafekey = (String)mapresult.get("SAFE_KEY");
      sRequestNumber = (String)mapresult.get("REQ_SEQ");
      
      sReturnCode = (String)mapresult.get("RETURN_CODE");
      sReturnMsg = (String)mapresult.get("RETURN_MSG");
      
      sAuthTime = (String)mapresult.get("AUTH_DATETIME");
      sAuthType = (String)mapresult.get("AUTH_TYPE");
      
      sCi = (String)mapresult.get("CI");
      sMobileno = (String)mapresult.get("MOBILENO");
    }
    else if (iReturn == -1)
    {
      sErrMsg = "������ ������ ����������.";
    }
    else if (iReturn == -4)
    {
      sErrMsg = "������ ��������������.";
    }
    else if (iReturn == -5)
    {
      sErrMsg = "������ ���� ����������.";
    }
    else if (iReturn == -6)
    {
      sErrMsg = "������ ������ ����������.";
    }
    else if (iReturn == -9)
    {
      sErrMsg = "���� ������ ����������.";
    }
    else if (iReturn == -12)
    {
      sErrMsg = "������ �������� ����������.";
    }
    else
    {
      sErrMsg = "���� ���� ���� ������. iReturn : " + iReturn;
    }
    Map<String, Object> mRet = new HashMap();
    
    mRet.put("safekey", sSafekey);
    
    mRet.put("auth_type", sAuthType);
    mRet.put("auth_result_code", sReturnCode);
    
    mRet.put("return_code", sReturnCode);
    
    mRet.put("return_msg", CommonUtils.nvls(sReturnMsg));
    
    mRet.put("error_msg", sErrMsg);
    
    mRet.put("auth_datetime", sAuthTime);
    mRet.put("req_seq", sRequestNumber);
    mRet.put("req_dthms", sReqDthms);
    mRet.put("cell", sMobileno);
    mRet.put("loginid", sLoginid);
    mRet.put("rgsr_id", sLoginid);
    mRet.put("mem_no", sMemNo);
    mRet.put("ci", sCi);
    if ((sAuthTime != null) && (!"".equals(sAuthTime))) {
      mRet.put("safekey_srch_dt", sAuthTime.substring(0, 8));
    }
    mRet.put("success_yn", "N");
    if (isSuccess) {
      mRet.put("success_yn", "Y");
    }
    CommonUtils.printLog(mRet);
    
    System.out.println("DAO �������� ����");
    this.niceCreditDAO.updateNiceSafekeyMobileIssueResult(mRet);
    System.out.println("DAO �������� ����");
    
    request.setAttribute("result", mRet);
  }
  
  public int insertNiceVacctNoti(Map<String, Object> pmParam)
    throws Exception
  {
    return this.niceCreditDAO.insertNiceVacctNoti(pmParam);
  }
  
  //이니시스 가상계좌 결과 등록 20200519
  public int insertInicisResult(Map<String, Object> pmParam) throws Exception
  {
    return this.niceCreditDAO.insertInicisResult(pmParam);
  }  
}
