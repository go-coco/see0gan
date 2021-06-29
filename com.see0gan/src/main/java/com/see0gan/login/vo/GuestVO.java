package com.see0gan.login.vo;


import org.springframework.stereotype.Component;


@Component("GuestVO")
public class GuestVO {
	
	private String TBU_GUESTID;
	private String TBU_NICKNAME;
	private String TBU_NAME;
	private String TBU_EMAIL;
	private String TBU_PHONE;
	private String TBU_PASSWORD;
	private String TBU_DELETEYN;
	private String TBU_INSERTDATE;
	private String TBU_UPDATEDATE;
	
	
	// 검색 구분자 및 검색어 
	private String keyfilter;
	private String keyword;
	private String startdate;
	private String endDate;
	
	
	public GuestVO() {
		
		// TODO Auto-generated constructor stub
	}


	public GuestVO(String tBU_GUESTID, String tBU_NICKNAME, String tBU_NAME, String tBU_EMAIL, String tBU_PHONE,
			String tBU_PASSWORD, String tBU_DELETEYN, String tBU_INSERTDATE, String tBU_UPDATEDATE, String keyfilter,
			String keyword, String startdate, String endDate) {
		super();
		TBU_GUESTID = tBU_GUESTID;
		TBU_NICKNAME = tBU_NICKNAME;
		TBU_NAME = tBU_NAME;
		TBU_EMAIL = tBU_EMAIL;
		TBU_PHONE = tBU_PHONE;
		TBU_PASSWORD = tBU_PASSWORD;
		TBU_DELETEYN = tBU_DELETEYN;
		TBU_INSERTDATE = tBU_INSERTDATE;
		TBU_UPDATEDATE = tBU_UPDATEDATE;
		this.keyfilter = keyfilter;
		this.keyword = keyword;
		this.startdate = startdate;
		this.endDate = endDate;
	}


	public String getTBU_GUESTID() {
		return TBU_GUESTID;
	}


	public String getTBU_NICKNAME() {
		return TBU_NICKNAME;
	}


	public String getTBU_NAME() {
		return TBU_NAME;
	}


	public String getTBU_EMAIL() {
		return TBU_EMAIL;
	}


	public String getTBU_PHONE() {
		return TBU_PHONE;
	}


	public String getTBU_PASSWORD() {
		return TBU_PASSWORD;
	}


	public String getTBU_DELETEYN() {
		return TBU_DELETEYN;
	}


	public String getTBU_INSERTDATE() {
		return TBU_INSERTDATE;
	}


	public String getTBU_UPDATEDATE() {
		return TBU_UPDATEDATE;
	}


	public String getKeyfilter() {
		return keyfilter;
	}


	public String getKeyword() {
		return keyword;
	}


	public String getStartdate() {
		return startdate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setTBU_GUESTID(String tBU_GUESTID) {
		TBU_GUESTID = tBU_GUESTID;
	}


	public void setTBU_NICKNAME(String tBU_NICKNAME) {
		TBU_NICKNAME = tBU_NICKNAME;
	}


	public void setTBU_NAME(String tBU_NAME) {
		TBU_NAME = tBU_NAME;
	}


	public void setTBU_EMAIL(String tBU_EMAIL) {
		TBU_EMAIL = tBU_EMAIL;
	}


	public void setTBU_PHONE(String tBU_PHONE) {
		TBU_PHONE = tBU_PHONE;
	}


	public void setTBU_PASSWORD(String tBU_PASSWORD) {
		TBU_PASSWORD = tBU_PASSWORD;
	}


	public void setTBU_DELETEYN(String tBU_DELETEYN) {
		TBU_DELETEYN = tBU_DELETEYN;
	}


	public void setTBU_INSERTDATE(String tBU_INSERTDATE) {
		TBU_INSERTDATE = tBU_INSERTDATE;
	}


	public void setTBU_UPDATEDATE(String tBU_UPDATEDATE) {
		TBU_UPDATEDATE = tBU_UPDATEDATE;
	}


	public void setKeyfilter(String keyfilter) {
		this.keyfilter = keyfilter;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	
}
