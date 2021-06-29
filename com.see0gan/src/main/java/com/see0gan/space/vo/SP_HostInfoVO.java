package com.see0gan.space.vo;

public class SP_HostInfoVO {
	
	public SP_HostInfoVO() {
		
	}
	
	//?¸ìŠ¤íŠ¸ì •ë³?
	private String tbsp_num;
	private String tbh_num;
	private String tbh_email;
	private String tbh_phone;
	private String tbsp_tel;
	
	//?¸ìŠ¤íŠ¸ì •ë³???±ìž
	public SP_HostInfoVO(String tbsp_num, String tbh_num, String tbh_email, String tbh_phone, String tbsp_tel) {
		
		this.tbsp_num = tbsp_num;
		this.tbh_num = tbh_num;
		this.tbh_email = tbh_email;
		this.tbh_phone = tbh_phone;
		this.tbsp_tel = tbsp_tel;
	}

	//?¸ìŠ¤íŠ¸ì •ë³?ê²Œ???¸í„?
	public String getTbsp_num() {
		return tbsp_num;
	}

	public String getTbh_num() {
		return tbh_num;
	}

	public String getTbh_email() {
		return tbh_email;
	}

	public String getTbh_phone() {
		return tbh_phone;
	}

	public String getTbsp_tel() {
		return tbsp_tel;
	}

	public void setTbsp_num(String tbsp_num) {
		this.tbsp_num = tbsp_num;
	}

	public void setTbh_num(String tbh_num) {
		this.tbh_num = tbh_num;
	}

	public void setTbh_email(String tbh_email) {
		this.tbh_email = tbh_email;
	}

	public void setTbh_phone(String tbh_phone) {
		this.tbh_phone = tbh_phone;
	}

	public void setTbsp_tel(String tbsp_tel) {
		this.tbsp_tel = tbsp_tel;
	}
}