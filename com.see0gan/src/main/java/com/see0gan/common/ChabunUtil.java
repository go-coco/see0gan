package com.see0gan.common;

import com.see0gan.common.dao.ChabunDAO;
import com.see0gan.common.dao.ChabunDAOImpl;
import com.see0gan.common.service.ChabunService;
import com.see0gan.common.service.ChabunServiceImpl;
import com.see0gan.login.vo.GuestVO;
import com.see0gan.payment.vo.PaymentVO;


public abstract class ChabunUtil {

	public static final String BIZ_GUBUN_P 	= "P"; //
	public static final String BIZ_GUBUN_BK = "BK";
	public static final String BIZ_GUBUN_G 	= "G";
	
	// type : D : 20210001, M : YYYYMM, Y : YYYY, N : 
	public static String numPad(String t, String c){
	
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	public static String getPaymentChabun(String type, String tbsp_pay_num) {
		
		return BIZ_GUBUN_P.concat(ChabunUtil.numPad(type, tbsp_pay_num));
	}
	
	public static String getBookingChabun(String type, String tbsp_num) {
		
		return BIZ_GUBUN_BK.concat(ChabunUtil.numPad(type, tbsp_num));
	}
	
	public static String getGuestIdChabun(String type, String tbu_guestId) {
		
		return BIZ_GUBUN_G.concat(ChabunUtil.numPad(type, tbu_guestId));
				
	}

	public static String getHostNumChabun(String email, String seq) {
		
		return "H".concat(email.concat(seq));
		
	}
	
	public static void main(String[] args) {
		

		ChabunDAO cd = new ChabunDAOImpl();
		
		String c = "1";

		System.out.println(">>> : " + ChabunUtil.getGuestIdChabun("aaa", c));
		System.out.println(">>> : " + ChabunUtil.getHostNumChabun("vvv", c));
		System.out.println(">>> : " + ChabunUtil.getPaymentChabun("P", c));
	//	System.out.println(">>> : " + ChabunUtil.getGuestId("testSpring30", ChabunService.getGuestId().getGuestId()));
		
	}
	
	
	////////////////////////////////////////////////////////////
	//
	// from Lee
	//
	///////////////////////////////////////////////////////////
	
	public static final String BIZ_GUBUN_N 	= "N"; // �������� : NOTICE
	public static final String BIZ_GUBUN_RV	= "RV"; // �ı� : REVIEW
	public static final String BIZ_GUBUN_Q	= "Q"; // Q&A : �����亯
	public static final String BIZ_GUBUN_O	= "O"; // Q&A : �����亯
	

	
	// �������� ��ȣ  
	public static String getNoticeChabun(String type, String notiNum) {

		return BIZ_GUBUN_N.concat(ChabunUtil.numPad(type, notiNum));
	}
	
	// �ı� ��ȣ  
	public static String getReviewChabun(String type, String revNum) {
		
		return BIZ_GUBUN_RV.concat(ChabunUtil.numPad(type, revNum));
	}
	
	// Q&A ��ȣ
	public static String getQnaChabun(String type, String qnaNum) {
		
		return BIZ_GUBUN_Q.concat(ChabunUtil.numPad(type, qnaNum));
	}
	
	// Q&A ��ȣ
	public static String getOneChabun(String type, String oneNum) {
		
		return BIZ_GUBUN_O.concat(ChabunUtil.numPad(type, oneNum));
	}

}
