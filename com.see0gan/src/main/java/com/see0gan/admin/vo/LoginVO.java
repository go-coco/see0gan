package com.see0gan.admin.vo;

public class LoginVO {
	
	 private String id;
	  
	    private String pw;
	    private boolean rememberId;
	    
	    public String getId() {
	    	
	        return id;
	    }
	    public void setId(String id) {
	        this.id = id;
	    }
	    public String getPw() {
	        return pw;
	    }
	    public void setPw(String pw) {
	        this.pw = pw;
	    }
	    public boolean isRememberId() {
	        return rememberId;
	    }
	    public void setRememberId(boolean rememberId) {
	        this.rememberId = rememberId;

	    }     
}
