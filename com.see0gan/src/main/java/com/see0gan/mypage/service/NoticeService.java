package com.see0gan.mypage.service;

import java.util.List;

import com.see0gan.mypage.vo.MypageVO;


public interface NoticeService {
	
	public List<MypageVO> noticeSelectPage(MypageVO mpvo);
	public List<MypageVO> noticeSelectAll(MypageVO mpvo);
	public List<MypageVO> noticeSelect(MypageVO mpvo);
	
	public int noticeInsert(MypageVO mpvo);
	public int noticeUpdate(MypageVO mpvo);
	public int noticeDelete(MypageVO mpvo);

}
