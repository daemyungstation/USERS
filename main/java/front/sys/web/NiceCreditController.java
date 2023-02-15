package front.sys.web;

import egovframework.com.cmm.service.EgovProperties;
import emf.core.util.CommonUtils;
import front.sys.service.NiceCreditService;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({"/sys/nice-credit"})
public class NiceCreditController
{
	
  private final Logger log = LoggerFactory.getLogger(NiceCreditController.class);
  @Resource
  private NiceCreditService niceCreditService;
  
  @RequestMapping({"/checkplus_mobile_success.do"})
  public String updateNiceSafekeyMobileSuccess(HttpServletRequest request)
    throws Exception
  {
    boolean isSuccess = true;
    this.niceCreditService.updateNiceSafekeyMobileIssueResult(request, isSuccess);
//    System.out.println("�� ���� ����");
    return "front/sys/nice_safekey_sms_issue_result.pop";
  }
  
  @RequestMapping({"/checkplus_mobile_fail.do"})
  public String updateNiceSafekeyMobileFail(HttpServletRequest request)
    throws Exception
  {
    boolean isSuccess = false;
    this.niceCreditService.updateNiceSafekeyMobileIssueResult(request, isSuccess);
//    System.out.println("�� ���� ����");
    return "front/sys/nice_safekey_sms_issue_result.pop";
  }
  
  @RequestMapping({"/niceVacctNoti.do"})
  public void niceVacctNoti(HttpServletRequest request, HttpServletResponse response)
    throws Exception
  {
    String PayMethod = CommonUtils.nvls(request.getParameter("PayMethod"));
    String MID = CommonUtils.nvls(request.getParameter("MID"));
    String MallUserID = CommonUtils.nvls(request.getParameter("MallUserID"));
    String Amt = CommonUtils.nvls(request.getParameter("Amt"));
    String name = CommonUtils.nvls(request.getParameter("name"));
    	   name = new String(name.getBytes("8859_1"),"euc-kr"); 
    String GoodsName = CommonUtils.nvls(request.getParameter("GoodsName"));
    String TID = CommonUtils.nvls(request.getParameter("TID"));
    String MOID = CommonUtils.nvls(request.getParameter("MOID"));
    String AuthDate = CommonUtils.nvls(request.getParameter("AuthDate"));
    String ResultCode = CommonUtils.nvls(request.getParameter("ResultCode"));
    String ResultMsg = CommonUtils.nvls(request.getParameter("ResultMsg"));
    String VbankNum = CommonUtils.nvls(request.getParameter("VbankNum"));
    String FnCd = CommonUtils.nvls(request.getParameter("FnCd"));
    String VbankName = CommonUtils.nvls(request.getParameter("VbankName"));
    String VbankInputName = CommonUtils.nvls(request.getParameter("VbankInputName"));
    
    String RcptTID = CommonUtils.nvls(request.getParameter("RcptTID"));
    String RcptType = CommonUtils.nvls(request.getParameter("RcptType"));
    String RcptAuthCode = CommonUtils.nvls(request.getParameter("RcptAuthCode"));
    
    Enumeration enm = request.getParameterNames();
    String sKey = "";
    String[] value = null;
    while (enm.hasMoreElements())
    {
      sKey = (String)enm.nextElement();
      value = request.getParameterValues(sKey);
    }
    SimpleDateFormat smt = new SimpleDateFormat("yyyyMMdd");
    Calendar cal = Calendar.getInstance();
    String sYmd = smt.format(cal.getTime());
    
    String file_path = EgovProperties.getProperty("Globals.niceVacctNotiLogPath");
/*    
    String osName = System.getProperty("os.name").toUpperCase();
    if (-1 == osName.indexOf("WINDOWS")) {
      file_path = "C:/";
    }
*/    
    file_path = file_path + File.separator + sYmd + ".log";
    File file = new File(file_path);
    file.createNewFile();
    
    StringBuffer sb = new StringBuffer();
    sb.append("************************************************\r\n");
    sb.append("PayMethod : " + PayMethod + "\r\n");
    sb.append("MID : " + MID + "\r\n");
    sb.append("MallUserID : " + MallUserID + "\r\n");
    sb.append("Amt : " + Amt + "\r\n");
    sb.append("name : " + name + "\r\n");
    sb.append("GoodsName : " + GoodsName + "\r\n");
    sb.append("TID : " + TID + "\r\n");
    sb.append("MOID : " + MOID + "\r\n");
    sb.append("AuthDate : " + AuthDate + "\r\n");
    sb.append("ResultCode : " + ResultCode + "\r\n");
    sb.append("ResultMsg : " + ResultMsg + "\r\n");
    sb.append("VbankNum : " + VbankNum + "\r\n");
    sb.append("FnCd : " + FnCd + "\r\n");
    sb.append("VbankName : " + VbankName + "\r\n");
    sb.append("VbankInputName : " + VbankInputName + "\r\n");
    sb.append("RcptTID : " + RcptTID + "\r\n");
    sb.append("RcptType : " + RcptType + "\r\n");
    sb.append("RcptAuthCode : " + RcptAuthCode + "\r\n");
    sb.append("************************************************\r\n");
    
    HashMap resultMap = new HashMap();
    HashMap hm = new HashMap();
    hm.put("pay_method", PayMethod);
    hm.put("mid", MID);
    hm.put("mall_user_id", MallUserID);
    hm.put("amt", Amt);
    hm.put("name", name);
    hm.put("goods_name", GoodsName);
    hm.put("tid", TID);
    hm.put("moid", MOID);
    hm.put("auth_date", AuthDate);
    hm.put("result_code", ResultCode);
    hm.put("result_msg", ResultMsg);
    hm.put("vbank_num", VbankNum);
    hm.put("fn_cd", FnCd);
    hm.put("vbank_name", VbankName);
    hm.put("vbank_input_name", VbankInputName);
    
    hm.put("rcpt_tid", RcptTID);
    hm.put("rcpt_type", RcptType);
    hm.put("rcpt_auth_code", RcptAuthCode);
    hm.put("err_pay_proc", "N");
    
    String sResult = "";
    try
    {
      int cudCnt = this.niceCreditService.insertNiceVacctNoti(hm);
      sResult = "OK";
    }
    catch (Exception ex)
    {
      sb.append("DB Insert Error> TID : " + TID + "\r\n");
      sResult = "FAIL";
    }
    FileWriter fw = new FileWriter(file_path, true);
    fw.write(sb.toString());
    fw.close();
    
    ServletOutputStream os = response.getOutputStream();
    os.print(sResult);
    os.close();
  }

  @RequestMapping({"/inicisvacctresult.do"})
  public void inicisVacctNoti(HttpServletRequest request, HttpServletResponse response)
    throws Exception
  {
	request.setCharacterEncoding("euc-kr");	  
	//String TID = CommonUtils.nvls(request.getParameter("no_tid"));  			//거래번호
	String TID = CommonUtils.nvls(request.getParameter("no_req_tid"));  			//거래번호
	String MOID = CommonUtils.nvls(request.getParameter("no_oid"));				//주문번호(고유번호)
	String bank_cd = CommonUtils.nvls(request.getParameter("cd_deal"));  		//발급은행코드
	String bank_cd2 = CommonUtils.nvls(request.getParameter("cd_bank"));		//실제지급은행코드
	String bank_nm = CommonUtils.nvls(request.getParameter("nm_inputbank"));	//은행명
	String auth_dt = CommonUtils.nvls(request.getParameter("dt_trans"));		//입급일
	String auth_time = CommonUtils.nvls(request.getParameter("tm_trans"));		//입금시간
	String vtr_acc_no = CommonUtils.nvls(request.getParameter("no_vacct"));		//가상계좌번호
	String memnm = CommonUtils.nvls(request.getParameter("nm_input"));			//입금자명
	String AMT = CommonUtils.nvls(request.getParameter("amt_input"));			//입금금액
	String FLG = CommonUtils.nvls(request.getParameter("flg_close"));			//마감구분 (0:당일마감전, 1:당일마감후)
	String CL = CommonUtils.nvls(request.getParameter("cl_close"));				//마감구분코드 (0:당일마감전, 1:당일마감후)
	String typemsg = CommonUtils.nvls(request.getParameter("type_msg"));		//거래구분 (0200:정상, 0400:취소)
	String dt_calculstd = CommonUtils.nvls(request.getParameter("dt_calculstd"));	//정산기준일자
	String dt_transbase = CommonUtils.nvls(request.getParameter("dt_transbase"));	//거래기준일자

    SimpleDateFormat smt = new SimpleDateFormat("yyyyMMdd");
    Calendar cal = Calendar.getInstance();
    String sYmd = smt.format(cal.getTime());
    
    String file_path = EgovProperties.getProperty("Globals.niceVacctNotiLogPath");
    
    StringBuffer sb = new StringBuffer();
    sb.append("PayMethod : " + TID + "\r\n");
    sb.append("MID : " + MOID + "\r\n");
    sb.append("bank_cd2 : " + bank_cd2 + "\r\n");
    sb.append("auth_dt" + auth_dt + "\r\n");
    sb.append("auth_time : " + auth_time + "\r\n");
    sb.append("vtr_acc_no : " + vtr_acc_no + "\r\n");
    sb.append("TID : " + TID + "\r\n");
    sb.append("MOID : " + MOID + "\r\n");
    sb.append("memnm : " + memnm + "\r\n");
    sb.append("AMT : " + AMT + "\r\n");
    sb.append("ETC : " + FLG +"_"+ CL+"_"+ typemsg +"_"+ dt_calculstd +"_"+ dt_transbase + "\r\n");
      
    HashMap resultMap = new HashMap();
    HashMap hm = new HashMap();
    hm.put("tid", TID);
    hm.put("moid", MOID);
    hm.put("bank_cd", bank_cd2);
    hm.put("auth_dt", auth_dt);
    hm.put("auth_time", auth_time);
    hm.put("vtr_acc_no", vtr_acc_no);
    hm.put("memnm", memnm);
    hm.put("pay_amt", AMT);
    hm.put("etc", sb.toString());

    String sResult = "";

    try{
    	// 이니시스 가상계좌 결과 등록 20200519
    	int cudCnt = this.niceCreditService.insertInicisResult(hm);
    	sResult = "OK";
    }catch (Exception ex) {
      sResult = "FAIL";
    }
    
    System.out.print("xxxxxxxxxxxxxxxxxx> : " +  hm);
    
    ServletOutputStream os = response.getOutputStream();
    os.print(sResult);
    os.close();
  }  
  
}
