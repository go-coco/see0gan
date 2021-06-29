package com.see0gan.payment.vo;

import org.springframework.stereotype.Component;

@Component("PaymentVO")
public class PaymentVO {
	
	// 결제 정보
	private String tbsp_pay_num;		// 결제 번호
	private String tbsp_pay_date;		// 결자 날짜
	private String tbsp_pay_amount;		// 결제 금액
	private String tbsp_pay_method;		// 결제 방법
	private String tbsp_pay_status;		// 결제 상태
	
	// 게스트 정보
	private String tbu_name;	// 게스트이름
	private String tbu_phone;	// 게스트 연락처
	
	public PaymentVO() { }

	public PaymentVO(String tbsp_pay_num, 
					 String tbsp_pay_date, 
					 String tbsp_pay_amount, 
					 String tbsp_pay_method,
					 String tbsp_pay_status, 
					 String tbu_name, 
					 String tbu_phone) {
		this.tbsp_pay_num = tbsp_pay_num;
		this.tbsp_pay_date = tbsp_pay_date;
		this.tbsp_pay_amount = tbsp_pay_amount;
		this.tbsp_pay_method = tbsp_pay_method;
		this.tbsp_pay_status = tbsp_pay_status;
		this.tbu_name = tbu_name;
		this.tbu_phone = tbu_phone;
	}

	public String getTbsp_pay_num() {return tbsp_pay_num;}
	public String getTbsp_pay_date() {return tbsp_pay_date;}
	public String getTbsp_pay_amount() {return tbsp_pay_amount;}
	public String getTbsp_pay_method() {return tbsp_pay_method;}
	public String getTbsp_pay_status() {return tbsp_pay_status;}
	public String getTbu_name() {return tbu_name;}
	public String getTbu_phone() {return tbu_phone;}

	public void setTbsp_pay_num(String tbsp_pay_num) {this.tbsp_pay_num = tbsp_pay_num;}
	public void setTbsp_pay_date(String tbsp_pay_date) {this.tbsp_pay_date = tbsp_pay_date;}
	public void setTbsp_pay_amount(String tbsp_pay_amount) {this.tbsp_pay_amount = tbsp_pay_amount;}
	public void setTbsp_pay_method(String tbsp_pay_method) {this.tbsp_pay_method = tbsp_pay_method;}
	public void setTbsp_pay_status(String tbsp_pay_status) {this.tbsp_pay_status = tbsp_pay_status;}
	public void setTbu_name(String tbu_name) {this.tbu_name = tbu_name;}
	public void setTbu_phone(String tbu_phone) {this.tbu_phone = tbu_phone;}
	
	// 검색 구분자 및 검색어 
	private String keyword;
	private String startdate;
	private String endDate;
	private String keyfilter;
	private String paymentstate;
	
	public String getKeyfilter() {
		return keyfilter;
	}

	public void setKeyfilter(String keyfilter) {
		this.keyfilter = keyfilter;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	public String getPaymentstate() {
		return paymentstate;
	}

	public void setPaymentstate(String paymentstate) {
		this.paymentstate = paymentstate;
	}

	
}
