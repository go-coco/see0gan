package com.see0gan.qna.service;

import java.util.List;

import com.see0gan.mypage.vo.MypageVO;

public interface QnaService {
	
	public List<MypageVO> qnaListAll(MypageVO mpvo);
	public List<MypageVO> qnaList(MypageVO mpvo);
	public List<MypageVO> qnaSelect(MypageVO mpvo);
	public int qnaRootInsert(MypageVO mpvo);
	public int qnaReInsert(MypageVO mpvo);
	public int qnaUpdate(MypageVO mpvo);
	public int qnaDelete(MypageVO mpvo);
	public int qnaDeleteAdmin(MypageVO mpvo);

}
