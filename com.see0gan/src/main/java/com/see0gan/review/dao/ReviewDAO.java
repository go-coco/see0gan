package com.see0gan.review.dao;

import java.util.List;

import com.see0gan.mypage.vo.MypageVO;

public interface ReviewDAO {
	
	public List<MypageVO> reviewListAll(MypageVO mpvo);
	public List<MypageVO> reviewList(MypageVO mpvo);
	public List<MypageVO> reviewSelect(MypageVO mpvo);
	public int reviewRootInsert(MypageVO mpvo);
	public int reviewReInsert(MypageVO mpvo);
	public int reviewUpdate(MypageVO mpvo);
	public int reviewDelete(MypageVO mpvo);
	public int reviewDeleteAdmin(MypageVO mpvo);

}
