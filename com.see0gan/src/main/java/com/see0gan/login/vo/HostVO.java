package com.see0gan.login.vo;


import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component("HostVO")
@Transactional
public class HostVO {
	
	private String TBH_NUM;
	private String TBH_NICKNAME;
	private String TBH_NAME;
	private String TBH_EMAIL;
	private String TBH_PASSWORD;
	private String TBH_PHONE;
	private String TBH_DELETEYN;
	private String TBH_INSERTDATE;
	private String TBH_UPDATEDATE;
	
	// 검색 구분자 및 검색어 
	private String keyfilter;
	private String keyword;
	private String startdate;
	private String endDate;
	
	
	public HostVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HostVO(String tBH_NUM, String tBH_NICKNAME, String tBH_NAME, String tBH_EMAIL, String tBH_PASSWORD,
			String tBH_PHONE, String tBH_DELETEYN, String tBH_INSERTDATE, String tBH_UPDATEDATE) {
		super();
		TBH_NUM = tBH_NUM;
		TBH_NICKNAME = tBH_NICKNAME;
		TBH_NAME = tBH_NAME;
		TBH_EMAIL = tBH_EMAIL;
		TBH_PASSWORD = tBH_PASSWORD;
		TBH_PHONE = tBH_PHONE;
		TBH_DELETEYN = tBH_DELETEYN;
		TBH_INSERTDATE = tBH_INSERTDATE;
		TBH_UPDATEDATE = tBH_UPDATEDATE;
	}

	public String getTBH_NUM() {
		return TBH_NUM;
	}

	public void setTBH_NUM(String tBH_NUM) {
		TBH_NUM = tBH_NUM;
	}

	public String getTBH_NICKNAME() {
		return TBH_NICKNAME;
	}

	public void setTBH_NICKNAME(String tBH_NICKNAME) {
		TBH_NICKNAME = tBH_NICKNAME;
	}

	public String getTBH_NAME() {
		return TBH_NAME;
	}

	public void setTBH_NAME(String tBH_NAME) {
		TBH_NAME = tBH_NAME;
	}

	public String getTBH_EMAIL() {
		return TBH_EMAIL;
	}

	public void setTBH_EMAIL(String tBH_EMAIL) {
		TBH_EMAIL = tBH_EMAIL;
	}

	public String getTBH_PASSWORD() {
		return TBH_PASSWORD;
	}

	public void setTBH_PASSWORD(String tBH_PASSWORD) {
		TBH_PASSWORD = tBH_PASSWORD;
	}

	public String getTBH_PHONE() {
		return TBH_PHONE;
	}

	public void setTBH_PHONE(String tBH_PHONE) {
		TBH_PHONE = tBH_PHONE;
	}

	public String getTBH_DELETEYN() {
		return TBH_DELETEYN;
	}

	public void setTBH_DELETEYN(String tBH_DELETEYN) {
		TBH_DELETEYN = tBH_DELETEYN;
	}

	public String getTBH_INSERTDATE() {
		return TBH_INSERTDATE;
	}

	public void setTBH_INSERTDATE(String tBH_INSERTDATE) {
		TBH_INSERTDATE = tBH_INSERTDATE;
	}

	public String getTBH_UPDATEDATE() {
		return TBH_UPDATEDATE;
	}

	public void setTBH_UPDATEDATE(String tBH_UPDATEDATE) {
		TBH_UPDATEDATE = tBH_UPDATEDATE;
	}

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
	
}
