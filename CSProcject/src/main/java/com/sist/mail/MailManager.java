package com.sist.mail;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

import com.sist.vo.*;
@Component
public class MailManager {
	private String style="<style>" + 
    		"body {" + 
    		"	  padding:1.5em;" + 
    		"	  background: #f5f5f5" + 
    		"	}" + 
    		"	table {" + 
    		"	  border: 1px #a39485 solid;" + 
    		"	  font-size: .9em;" + 
    		"	  box-shadow: 0 2px 5px rgba(0,0,0,.25);" + 
    		"	  width: 100%;" + 
    		"	  border-collapse: collapse;" + 
    		"	  border-radius: 5px;" + 
    		"	  overflow: hidden;" + 
    		"	}" + 
    		"	th {" + 
    		"	  text-align: left;" + 
    		"	}" + 
    		"	thead {" + 
    		"	  font-weight: bold;" + 
    		"	  color: #fff;" + 
    		"	  background: #73685d;" + 
    		"	}" + 
    		"	 td, th {" + 
    		"	  padding: 1em .5em;" + 
    		"	  vertical-align: middle;" + 
    		"	}" + 
    		"	 td {" + 
    		"	  border-bottom: 1px solid rgba(0,0,0,.1);" + 
    		"	  background: #fff;" + 
    		"	}" + 
    		"	a {" + 
    		"	  color: #73685d;" + 
    		"	}" + 
    		"	 @media all and (max-width: 768px) {" + 
    		"	  table, thead, tbody, th, td, tr {" + 
    		"	    display: block;" + 
    		"	  }" + 
    		"	  th {" + 
    		"	    text-align: right;" + 
    		"	  }" + 
    		"	  table {" + 
    		"	    position: relative; " + 
    		"	    padding-bottom: 0;" + 
    		"	    border: none;" + 
    		"	    box-shadow: 0 0 10px rgba(0,0,0,.2);" + 
    		"	  }" + 
    		"	  thead {" + 
    		"	    float: left;" + 
    		"	    white-space: nowrap;" + 
    		"	  }" + 
    		"	  tbody {" + 
    		"	    overflow-x: auto;" + 
    		"	    overflow-y: hidden;" + 
    		"	    position: relative;" + 
    		"	    white-space: nowrap;" + 
    		"	  }" + 
    		"	  tr {" + 
    		"	    display: inline-block;" + 
    		"	    vertical-align: top;" + 
    		"	  }" + 
    		"	  th {" + 
    		"	    border-bottom: 1px solid #a39485;" + 
    		"	  }" + 
    		"	  td {" + 
    		"	    border-bottom: 1px solid #e5e5e5;" + 
    		"	  }" + 
    		"	  }" + 
    		"</style>";

	
//	  public static void main(String[] args) { 
//		  MailManager m=new MailManager();
//		  m.naverMailSend();
//	  }
	 
	public void rentReserveOkMail(ReserveVO vo) {
		 
		 String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정 
	     String user = "cs_test_id1@naver.com"; // 패스워드 
	     String password = "qwer1234";      // SMTP 서버 정보를 설정한다. 
	     Properties props = new Properties(); 
	     props.put("mail.smtp.host", host); 
	     props.put("mail.smtp.port", 587); 
	     props.put("mail.smtp.auth", "true"); 
	     Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator(){ 
	    	 protected PasswordAuthentication getPasswordAuthentication() 
	    	 { 
	    		 return new PasswordAuthentication(user, password); 
	    	 } 
	     }); 
	     try { 
	        	MimeMessage message = new MimeMessage(session); 
	              message.setFrom(new InternetAddress(user)); 
	              message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getEmail())); // 메일 제목 
	              message.setSubject("예약 승인 완료"); // 메일 내용
	              
	              String html="<html>"
	            		     +"		<head>"
	            		     +			style
	            		     +"		</head>"
	            		     +"		<body>"
	            		     + "		<span style=\"font-size: 30px; font-weight:bold; margin-bottom: 20px;\">예약이 승인되었습니다</span><br><br>"
	            		     + "		<span style=\"font-size: 15px; margin-bottom: 3px;\">예약자명 : "+vo.getName()+"</span><br>"
	            		     + "		<span style=\"font-size: 15px; margin-bottom: 3px;\">차량명 : "+vo.getCar_name()+"</span><br>"
	            		     + "		<span style=\"font-size: 15px; margin-bottom: 3px;\">가격 : "+vo.getPrice()+"</span><br>"
	            		     + "		<span style=\"font-size: 15px; margin-bottom: 3px;\">이용기간 : "+vo.getDbsdate()+" ~ "+vo.getDbedate()+"</span><br>"
	            		     +"		</body>"
	            		     +"</html>";
	              		     
	              message.setContent(html,"text/html;charset=UTF-8"); // send the message 
	              Transport.send(message); 
	              System.out.println("Success Message Send"); 
	         } catch (MessagingException e) 
	          {
	        	 e.printStackTrace();
	          }
	     }
	
	
	public void campReserveOkMail(ReserveVO vo) {
		 
		 String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정 
	     String user = "cs_test_id1@naver.com"; // 패스워드 
	     String password = "qwer1234";      // SMTP 서버 정보를 설정한다. 
	     Properties props = new Properties(); 
	     props.put("mail.smtp.host", host); 
	     props.put("mail.smtp.port", 587); 
	     props.put("mail.smtp.auth", "true"); 
	     Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator(){ 
	    	 protected PasswordAuthentication getPasswordAuthentication() 
	    	 { 
	    		 return new PasswordAuthentication(user, password); 
	    	 } 
	     }); 
	     try { 
	        	MimeMessage message = new MimeMessage(session); 
	              message.setFrom(new InternetAddress(user)); 
	              message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getEmail())); // 메일 제목 
	              message.setSubject("예약 승인 완료"); // 메일 내용
	              
	              String html="<html>"
	            		     +"		<head>"
	            		     +			style
	            		     +"		</head>"
	            		     +"		<body>"
	            		     + "		<span style=\"font-size: 30px; font-weight:bold; margin-bottom: 20px;\">예약이 승인되었습니다</span><br><br>"
	            		     + "		<span style=\"font-size: 15px; margin-bottom: 3px;\">예약자명 : "+vo.getName()+"</span><br>"
	            		     + "		<span style=\"font-size: 15px; margin-bottom: 3px;\">캠핑명 : "+vo.getCamp_name()+"</span><br>"
	            		     + "		<span style=\"font-size: 15px; margin-bottom: 3px;\">객실 : "+vo.getCampsite_name()+"</span><br>"
	            		     + "		<span style=\"font-size: 15px; margin-bottom: 3px;\">가격 : "+vo.getPrice()+"</span><br>"
	            		     + "		<span style=\"font-size: 15px; margin-bottom: 3px;\">이용기간 : "+vo.getDbsdate()+" ~ "+vo.getDbedate()+"</span><br>"
	            		     +"		</body>"
	            		     +"</html>";
	              		     
	              message.setContent(html,"text/html;charset=UTF-8"); // send the message 
	              Transport.send(message); 
	              System.out.println("Success Message Send"); 
	         } catch (MessagingException e) 
	          {
	        	 e.printStackTrace();
	          }
	     }
}