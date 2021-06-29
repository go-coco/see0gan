package com.see0gan.common;

import com.see0gan.mypage.vo.MypageVO;

public class Paging {
	
	public static void setPage(MypageVO nvo, String curpage, String sizeCtrl) {
		
		if(curpage == null) nvo.setCurpage("1");
		
		if(curpage!=null){
			nvo.setCurpage(curpage);
		}
		
		nvo.setGroupsize("5");
		
		if(sizeCtrl==null) nvo.setPagesize("5");
		if(sizeCtrl!=null){
			nvo.setPagesize(sizeCtrl);
		}
	}

}
