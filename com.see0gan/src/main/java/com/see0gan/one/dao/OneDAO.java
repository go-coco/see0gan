package com.see0gan.one.dao;

import java.util.List;

import com.see0gan.mypage.vo.MypageVO;

public interface OneDAO {
	
	public List<MypageVO> oneSelectAll(MypageVO mpvo);
	public List<MypageVO> oneSelectAllU(MypageVO mpvo);
	public List<MypageVO> oneSelect(MypageVO mpvo);
	
	public int oneInsert(MypageVO mpvo);
	public int oneUpdate(MypageVO mpvo);
	public int oneDelete(MypageVO mpvo);

}
