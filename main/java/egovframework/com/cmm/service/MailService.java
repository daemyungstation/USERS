package egovframework.com.cmm.service;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.Iterator;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.SendFailedException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import emf.core.util.EMFStringUtil;
import emf.core.vo.EmfMap;

@Service("mailService")
public class MailService {
    
    @Resource(name="mailSender")
 	private JavaMailSender mailSender;    

    public void sendMail(EmfMap emfMap)throws Exception
    {		
		MimeMessage message = mailSender.createMimeMessage();
		
		try
		{
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setSubject(emfMap.get("subject").toString());
			messageHelper.setTo(emfMap.get("toUser").toString());
			
			if(!"".equals(EMFStringUtil.nullConvert(emfMap.get("cc"))))
			{
                messageHelper.setCc(emfMap.get("cc").toString());				    
			}
			
			messageHelper.setFrom(emfMap.get("fromUser").toString());
			messageHelper.setText(emfMap.get("contents").toString(),true);
			
			mailSender.send(message);
		}
		catch (MessagingException me) 
		{ 
			me.printStackTrace();
			Exception ex = me;
	
			if (ex instanceof SendFailedException) 
			{
				SendFailedException sfex = (SendFailedException)ex;
				Address[] invalid = sfex.getInvalidAddresses();
			}
		}
	}
    
    /**
     * 사용자 메일 발송 내용.
     * @param data	에는 subject(제목)과 toUser(사용자 메일) fromUser(관리자 메일)
     * @param tmp_name 이메일 템플릿 물리적인 경로의 파일명
     * @param dataMap Map 형식의 데이터(Map에 name이 있으면 이메일 템플릿의 <!--name-->을 치환해준다)
     * @throws Exception
     */
    public void sendTempleteMail(EmfMap emfMap, String fileNm) throws Exception
    {
        BufferedReader br = null;
        
        String mailTmplFilePath = EgovProperties.getProperty("Globals.mailTmplFilePath");
  
        emfMap.put("httpUrl", EgovProperties.getProperty("Globals.httpUrl"));
        emfMap.put("httpAdminUrl", EgovProperties.getProperty("Globals.httpAdminUrl"));
        
        StringBuffer mailStr = new StringBuffer();
        
        EmfMap paramMap = null;
        
        try
        {
            String line = null;
            
            String fileUrl = mailTmplFilePath + fileNm;
            
            br = new BufferedReader(new InputStreamReader(new FileInputStream(fileUrl),"UTF-8"));
            
            while((line=br.readLine()) != null)
            {
            	mailStr.append(line).append("\n");
            }
            
            br.close();
            br = null;
            line = null;
     
            String contents = mailStr.toString();

            mailStr = null;
            
            Iterator iterator = emfMap.entrySet().iterator();
            
            while (iterator.hasNext()) 
            {
            	Entry entry = (Entry) iterator.next();
            	
            	contents = contents.replaceAll("&&"+entry.getKey()+"&&", String.valueOf(entry.getValue()));             
            }
            
            paramMap = new EmfMap();
            paramMap.put("subject", emfMap.getString("subject"));
            paramMap.put("toUser", emfMap.getString("toUser"));
            paramMap.put("fromUser", EgovProperties.getProperty("Globals.fromUser"));
            paramMap.put("contents", contents);
            
           	sendMail(paramMap);
            
            paramMap = null;            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(br != null) br.close();
        }
    }
}