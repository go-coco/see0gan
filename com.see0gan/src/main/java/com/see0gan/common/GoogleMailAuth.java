package com.see0gan.common;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleMailAuth extends Authenticator{
	
	PasswordAuthentication pa;
	
	public GoogleMailAuth(String sendMail, String sendPw) {
		
		System.out.println("GoogleMailAuth sendMail >>> : " + sendMail);
		System.out.println("GoogleMailAuth sendPw >>> : " + sendPw);
		
		// gmail ���̵�, gmail ��й�ȣ		
		pa = new PasswordAuthentication(sendMail, sendPw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {	
		return pa;
	}
}



