package com.see0gan.common;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class GoogleMailSend {

	public void googleMailSend( String name
			                   ,String receiveMail) {
		
	//	System.out.println("googleMailSend mailSubject >>> : " 	+ mailSubject);
	//	System.out.println("googleMailSend sendMail >>> : " 	+ sendMail);
	//	System.out.println("googleMailSend sendPw >>> : " 		+ sendPw);
		System.out.println("googleMailSend resiveMail >>> "	 	+ receiveMail);
	//	System.out.println("googleMailSend sendMsg >>> : " 		+ sendMsg);
		
		String sendMail ="testSpring30@gmail.com";
		String sendPw = "ttSoup10";
		
		String mailSubject ="[See����]��й�ȣ �缳�� �ȳ� ����";
		
		String sendMsg = "�ȳ��ϼ���."+ name +"��\n �� ������ ��й�ȣ �缳���� ���� ���α׷��ӽ����� �߼��ϴ� �����Դϴ�.\n ������ ��û�� ������ �ƴ϶�� �������� ��ȣ�� ���� ��й�ȣ�� �缳�����ּ���. \n  ��й�ȣ�� �ٽ� �����Ϸ��� '��й�ȣ �缳��' ��ũ�� Ŭ�����ּ���.";
		
		Properties prop = System.getProperties();		
		prop.put("mail.smtp.starttls.enable","true");		
		prop.put("mail.smtp.host","smtp.gmail.com");		
		prop.put("mail.smtp.auth","true");		
		prop.put("mail.smtp.port","587");
		
		// gmail password üũ 
		Authenticator auth = new GoogleMailAuth(sendMail, sendPw);
		Session session = Session.getDefaultInstance(prop, auth);
		MimeMessage msg = new MimeMessage(session);
		
		try {

				msg.setSentDate(new Date());	
				msg.setFrom(new InternetAddress(sendMail, mailSubject));	
				InternetAddress to = new InternetAddress(receiveMail);	
				msg.setRecipient(Message.RecipientType.TO, to);
	            msg.setSubject(mailSubject, "UTF-8");
	            msg.setText(sendMsg, "UTF-8");
	            
	            Transport.send(msg);
	        } catch(AddressException ae) {  
	            System.out.println("AddressException : " + ae.getMessage());           
	        } catch(MessagingException me) {
	            System.out.println("MessagingException : " + me.getMessage());
	        } catch(UnsupportedEncodingException e) {
	            System.out.println("UnsupportedEncodingException : " + e.getMessage());			
	        }           
	    }
	}

