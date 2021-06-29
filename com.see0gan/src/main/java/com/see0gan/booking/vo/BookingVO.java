package com.see0gan.booking.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component("BookingVO")
public class BookingVO {

	// 예약 정보
	private String tbsp_bok_num;		// 예약번호
	private String tbsp_bok_date;		// 예약날짜
	private String tbsp_bok_time_s;		// 예약시간_시작
	private String tbsp_bok_time_e;		// 예약시간_끝
	private String tbsp_bok_type;		// 예약방법
	private String tbsp_bok_status;		// 예약상태
	private String tbsp_bok_person;		// 예약인원
	
	// 공간 정보
	private String tbsp_num;			// 공간번호
	private String tbsp_name;			// 공간명
	private String tbsp_intro1;			// 한줄소개
	private String tbsp_intro2;			// 공간소개
	private String tbsp_img1;			// 대표이미지
	private String tbsp_capacity;		// 최대 수용인원
	private String tbsp_type;			// 공간타입
	private String tbsp_caution;		// 예약시 주의사항
	
	private String tbsp_cost;			// 시간당 금액
	private String tbsp_time_start;		// 이용시간 시작
	private String tbsp_time_end;		// 이용시간 끝
	
	// 게스트 정보
	private String tbu_name;			// 게스트 이름
	private String tbu_phone;			// 게스트 연락처
	private String tbsp_bok_deleteyn;	// 예약취소 여부 
	private String tbu_guestid;			// 게스트 식별번호
	
	// 휴무일
	private String tbsp_r_dayoff;		// 정기휴무
	private String tbsp_r_dayoff2;		// 정기휴무 요일
	private String tbsp_dayoff;			// 지정휴무 일명
	private String tbsp_dayoff_start;	// 지정휴무 시작
	private String tbsp_dayoff_end;		// 지정휴무 끝
	private String tbsp_dayoff2;		// 지정휴무 요일
	
	// 환불정보
	private String tbsp_refund1;
	private String tbsp_refund2;
	private String tbsp_refund3;
	
	// 결제
	private String tbsp_pay_method;		// 결제방법
	
	// 예약 시간
	private String book01;		// 00~01
	private String book02;		// 01~02
	private String book03;		// 02~03
	private String book04;		// 03~04
	private String book05;		// 04~05
	private String book06;		// 05~06
	private String book07;		// 06~07
	private String book08;		// 07~08
	private String book09;		// 08~09
	private String book10;		// 09~10
	private String book11;		// 10~11
	private String book12;		// 11~12
	private String book13;		// 12~13
	private String book14;		// 13~14
	private String book15;		// 14~15
	private String book16;		// 15~16
	private String book17;		// 16~17
	private String book18;		// 17~18
	private String book19;		// 18~19
	private String book20;		// 19~20
	private String book21;		// 20~21
	private String book22;		// 21~22
	private String book23;		// 22~23
	private String book24;		// 23~24
	
	// 호스트 정보
	private String tbc_name;	//상호명
	private String tbc_res_num; 
	private String tbc_ceo;
	private String tbh_phone;
	private String tbh_email;
	
	
	private String payamount; // 결제 금액
	private List<BookingVO> getBookingVOList; // 변수 리스트로 받기위해
	
	public BookingVO() { }

	public BookingVO(String tbsp_bok_num, 
					 String tbsp_bok_date, 
					 String tbsp_bok_time_s, 
					 String tbsp_bok_time_e,
					 String tbsp_bok_type, 
					 String tbsp_bok_status, 
					 String tbsp_bok_person, 
					 
					 String tbsp_num, 
					 String tbsp_name,
					 String tbsp_capacity, 
					 String tbsp_type,
					 String tbsp_intro1,
					 String tbsp_intro2,
					 String tbsp_cost,
					 String tbsp_img1,
					 String tbsp_time_start,
					 String tbsp_time_end,
					 String tbsp_caution,
					 
					 String tbu_name,
					 String tbu_phone,
					 String tbu_guestid,
					 String tbsp_bok_deleteyn,
					 
					 String tbsp_r_dayoff,
					 String tbsp_r_dayoff2,
					 String tbsp_dayoff,
					 String tbsp_dayoff_start,
					 String tbsp_dayoff_end,
					 String tbsp_dayoff2,
					 String book01, String book02, String book03, String book04, String book05, String book06,
					 String book07, String book08, String book09, String book10, String book11, String book12, 
					 String book13, String book14, String book15, String book16, String book17, String book18, 
					 String book19, String book20, String book21, String book22, String book23, String book24,
					 
					 String tbc_name,
					 String tbc_res_num,
					 String tbc_ceo,
					 String tbh_phone,
					 String tbh_email,
					 String payamount,
					 
					 String tbsp_refund1,
					 String tbsp_refund2,
					 String tbsp_refund3,
					 
					 String tbsp_pay_method,
					
					List<BookingVO> getBookingVOList) {
		
		this.tbsp_bok_num = tbsp_bok_num;
		this.tbsp_bok_date = tbsp_bok_date;
		this.tbsp_bok_time_s = tbsp_bok_time_s;
		this.tbsp_bok_time_e = tbsp_bok_time_e;
		this.tbsp_bok_type = tbsp_bok_type;
		this.tbsp_bok_status = tbsp_bok_status;
		this.tbsp_bok_person = tbsp_bok_person;
		
		this.tbsp_num = tbsp_num;
		this.tbsp_name = tbsp_name;
		this.tbsp_capacity = tbsp_capacity;
		this.tbsp_type = tbsp_type;
		this.tbsp_intro1 = tbsp_intro1;
		this.tbsp_intro2 = tbsp_intro2;
		this.tbsp_cost = tbsp_cost;
		this.tbsp_img1 = tbsp_img1;
		this.tbsp_time_start = tbsp_time_start;
		this.tbsp_time_end = tbsp_time_end;
		this.tbsp_caution = tbsp_caution;
				
		this.tbu_name = tbu_name;
		this.tbu_phone = tbu_phone;
		this.tbu_guestid = tbu_guestid;
		this.tbsp_bok_deleteyn = tbsp_bok_deleteyn;
		
		this.tbsp_r_dayoff = tbsp_r_dayoff;
		this.tbsp_r_dayoff2 = tbsp_r_dayoff2;
		this.tbsp_dayoff = tbsp_dayoff;
		this.tbsp_dayoff_start = tbsp_dayoff_start;
		this.tbsp_dayoff_end = tbsp_dayoff_end;
		this.tbsp_dayoff2 = tbsp_dayoff2;
		
		this.book01 = book01;
		this.book02 = book02;
		this.book03 = book03;
		this.book04 = book04;
		this.book05 = book05;
		this.book06 = book06;
		this.book07 = book07;
		this.book08 = book08;
		this.book09 = book09;
		this.book10 = book10;
		this.book11 = book11;
		this.book12 = book12;
		this.book13 = book13;
		this.book14 = book14;
		this.book15 = book15;
		this.book16 = book16;
		this.book17 = book17;
		this.book18 = book18;
		this.book19 = book19;
		this.book20 = book20;
		this.book21 = book21;
		this.book22 = book22;
		this.book23 = book23;
		this.book24 = book24;
		
		this.tbc_name = tbc_name;
		this.tbc_res_num = tbc_res_num;
		this.tbc_ceo = tbc_ceo;
		this.tbh_phone = tbh_phone;
		this.tbh_email = tbh_email;
		
		this.tbsp_refund1 = tbsp_refund1;
		this.tbsp_refund2 = tbsp_refund2;
		this.tbsp_refund3 = tbsp_refund3;
		
		this.payamount = payamount;
		this.getBookingVOList = getBookingVOList;
		
		this.tbsp_pay_method = tbsp_pay_method;
		
	}

	public String getTbsp_bok_num() {return tbsp_bok_num;}
	public String getTbsp_bok_date() {return tbsp_bok_date;}
	
	public String getTbsp_bok_time_s() {return tbsp_bok_time_s;}
	public String getTbsp_bok_time_e() {return tbsp_bok_time_e;}
	
	public String getTbsp_bok_type() {return tbsp_bok_type;}
	public String getTbsp_bok_status() {return tbsp_bok_status;}
	public String getTbsp_bok_person() {return tbsp_bok_person;}
	public String getTbsp_caution() {return tbsp_caution;}
	
	public String getTbsp_num() {return tbsp_num;}
	public String getTbsp_name() {return tbsp_name;}
	public String getTbsp_capacity() {return tbsp_capacity;}
	
	public String getTbsp_type() {return tbsp_type;}
	public String getTbsp_intro1() {return tbsp_intro1;}
	public String getTbsp_intro2() {return tbsp_intro2;}
	public String getTbsp_cost() {return tbsp_cost;}
	public String getTbsp_img1() {return tbsp_img1;}
	public String getTbsp_time_start() {return tbsp_time_start;}
	public String getTbsp_time_end() {return tbsp_time_end;}

	public String getTbu_name() {return tbu_name;}
	public String getTbu_phone() {return tbu_phone;}
	public String getTbu_guestid() {return tbu_guestid;}
	public String getTbsp_bok_deleteyn() {return tbsp_bok_deleteyn;}
	
	public String getTbsp_r_dayoff() {return tbsp_r_dayoff;}
	public String getTbsp_r_dayoff2() {return tbsp_r_dayoff2;}
	public String getTbsp_dayoff() {return tbsp_dayoff;}
	public String getTbsp_dayoff_start() {return tbsp_dayoff_start;}
	public String getTbsp_dayoff_end() {return tbsp_dayoff_end;}
	public String getTbsp_dayoff2() {return tbsp_dayoff2;}
	
	public String getBook01() {return book01;}
	public String getBook02() {return book02;}
	public String getBook03() {return book03;}
	public String getBook04() {return book04;}
	public String getBook05() {return book05;}
	public String getBook06() {return book06;}
	public String getBook07() {return book07;}
	public String getBook08() {return book08;}
	public String getBook09() {return book09;}
	public String getBook10() {return book10;}
	public String getBook11() {return book11;}
	public String getBook12() {return book12;}
	public String getBook13() {return book13;}
	public String getBook14() {return book14;}
	public String getBook15() {return book15;}
	public String getBook16() {return book16;}
	public String getBook17() {return book17;}
	public String getBook18() {return book18;}
	public String getBook19() {return book19;}
	public String getBook20() {return book20;}
	public String getBook21() {return book21;}
	public String getBook22() {return book22;}
	public String getBook23() {return book23;}
	public String getBook24() {return book24;}

	public String getTbc_name() {return tbc_name;}
	public String getTbc_res_num() {return tbc_res_num;}
	public String getTbc_ceo() {return tbc_ceo;}
	public String getTbh_phone() {return tbh_phone;}
	public String getTbh_email() {return tbh_email;}

	
	public String getTbsp_refund1() {return tbsp_refund1;}
	public String getTbsp_refund2() {return tbsp_refund2;}
	public String getTbsp_refund3() {return tbsp_refund3;}

	public String getPayamount() {return payamount;}

	public List<BookingVO> getGetBookingVOList() {return getBookingVOList;}
	
	public String getTbsp_pay_method() {return tbsp_pay_method;}

	public void setTbsp_bok_num(String tbsp_bok_num) {this.tbsp_bok_num = tbsp_bok_num;}
	public void setTbsp_bok_date(String tbsp_bok_date) {this.tbsp_bok_date = tbsp_bok_date;}
	public void setTbsp_bok_time_s(String tbsp_bok_time_s) {this.tbsp_bok_time_s = tbsp_bok_time_s;}
	public void setTbsp_bok_time_e(String tbsp_bok_time_e) {this.tbsp_bok_time_e = tbsp_bok_time_e;}
	public void setTbsp_bok_type(String tbsp_bok_type) {this.tbsp_bok_type = tbsp_bok_type;}
	public void setTbsp_bok_status(String tbsp_bok_status) {this.tbsp_bok_status = tbsp_bok_status;}
	public void setTbsp_bok_person(String tbsp_bok_person) {this.tbsp_bok_person = tbsp_bok_person;}
	public void setTbsp_caution(String tbsp_caution) {this.tbsp_caution = tbsp_caution;}
	
	public void setTbsp_num(String tbsp_num) {this.tbsp_num = tbsp_num;}
	public void setTbsp_name(String tbsp_name) {this.tbsp_name = tbsp_name;}
	public void setTbsp_capacity(String tbsp_capacity) {this.tbsp_capacity = tbsp_capacity;}
	public void setTbsp_type(String tbsp_type) {this.tbsp_type = tbsp_type;}
	public void setTbsp_intro1(String tbsp_intro1) {this.tbsp_intro1 = tbsp_intro1;}
	public void setTbsp_intro2(String tbsp_intro2) {this.tbsp_intro2 = tbsp_intro2;}
	public void setTbsp_cost(String tbsp_cost) {this.tbsp_cost = tbsp_cost;}
	public void setTbsp_img1(String tbsp_img1) {this.tbsp_img1 = tbsp_img1;}
	public void setTbsp_time_start(String tbsp_time_start) {this.tbsp_time_start = tbsp_time_start;}
	public void setTbsp_time_end(String tbsp_time_end) {this.tbsp_time_end = tbsp_time_end;}
	
	public void setTbu_name(String tbu_name) {this.tbu_name = tbu_name;}
	public void setTbu_phone(String tbu_phone) {this.tbu_phone = tbu_phone;}
	public void setTbu_guestid(String tbu_guestid) {this.tbu_guestid = tbu_guestid;}
	public void setTbsp_bok_deleteyn(String tbsp_bok_deleteyn) {this.tbsp_bok_deleteyn = tbsp_bok_deleteyn;}
	
	public void setTbsp_r_dayoff(String tbsp_r_dayoff) {this.tbsp_r_dayoff = tbsp_r_dayoff;}
	public void setTbsp_r_dayoff2(String tbsp_r_dayoff2) {this.tbsp_r_dayoff2 = tbsp_r_dayoff2;}
	public void setTbsp_dayoff(String tbsp_dayoff) {this.tbsp_dayoff = tbsp_dayoff;}
	public void setTbsp_dayoff_start(String tbsp_dayoff_start) {this.tbsp_dayoff_start = tbsp_dayoff_start;}
	public void setTbsp_dayoff_end(String tbsp_dayoff_end) {this.tbsp_dayoff_end = tbsp_dayoff_end;}
	public void setTbsp_dayoff2(String tbsp_dayoff2) {this.tbsp_dayoff2 = tbsp_dayoff2;}
	
	public void setBook01(String book01) {this.book01 = book01;}
	public void setBook02(String book02) {this.book02 = book02;}
	public void setBook03(String book03) {this.book03 = book03;}
	public void setBook04(String book04) {this.book04 = book04;}
	public void setBook05(String book05) {this.book05 = book05;}
	public void setBook06(String book06) {this.book06 = book06;}
	public void setBook07(String book07) {this.book07 = book07;}
	public void setBook08(String book08) {this.book08 = book08;}
	public void setBook09(String book09) {this.book09 = book09;}
	public void setBook10(String book10) {this.book10 = book10;}
	public void setBook11(String book11) {this.book11 = book11;}
	public void setBook12(String book12) {this.book12 = book12;}
	public void setBook13(String book13) {this.book13 = book13;}
	public void setBook14(String book14) {this.book14 = book14;}
	public void setBook15(String book15) {this.book15 = book15;}
	public void setBook16(String book16) {this.book16 = book16;}
	public void setBook17(String book17) {this.book17 = book17;}
	public void setBook18(String book18) {this.book18 = book18;}
	public void setBook19(String book19) {this.book19 = book19;}
	public void setBook20(String book20) {this.book20 = book20;}
	public void setBook21(String book21) {this.book21 = book21;}
	public void setBook22(String book22) {this.book22 = book22;}
	public void setBook23(String book23) {this.book23 = book23;}
	public void setBook24(String book24) {this.book24 = book24;}
	
	public void setTbc_name(String tbc_name) {this.tbc_name = tbc_name;}
	public void setTbc_res_num(String tbc_res_num) {this.tbc_res_num = tbc_res_num;}
	public void setTbc_ceo(String tbc_ceo) {this.tbc_ceo = tbc_ceo;}
	public void setTbh_phone(String tbh_phone) {this.tbh_phone = tbh_phone;}
	public void setTbh_email(String tbh_email) {this.tbh_email = tbh_email;}
	
	public void setTbsp_refund1(String tbsp_refund1) {this.tbsp_refund1 = tbsp_refund1;}
	public void setTbsp_refund2(String tbsp_refund2) {this.tbsp_refund2 = tbsp_refund2;}
	public void setTbsp_refund3(String tbsp_refund3) {this.tbsp_refund3 = tbsp_refund3;}

	public void setPayamount(String payamount) {this.payamount = payamount;}
	public void setGetBookingVOList(List<BookingVO> getBookingVOList) {this.getBookingVOList = getBookingVOList;}
	
	public void setTbsp_pay_method(String tbsp_pay_method) {this.tbsp_pay_method = tbsp_pay_method;}
	
}