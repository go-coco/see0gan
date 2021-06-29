package com.see0gan.mypage.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.see0gan.mypage.dao.NoticeDAO;
import com.see0gan.mypage.vo.MypageVO;


@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {
	
	Logger logger = Logger.getLogger(NoticeServiceImpl.class);
	
	private NoticeDAO noticeDAO;
	
	@Autowired(required=false)
	public NoticeServiceImpl(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	@Override
	public List<MypageVO> noticeSelectPage(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return noticeDAO.noticeSelectPage(mpvo);
	}
	
	@Override
	public List<MypageVO> noticeSelectAll(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return noticeDAO.noticeSelectAll(mpvo);
	}

	@Override
	public List<MypageVO> noticeSelect(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return noticeDAO.noticeSelect(mpvo);
	}

	@Override
	public int noticeInsert(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return noticeDAO.noticeInsert(mpvo);
	}

	@Override
	public int noticeUpdate(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return noticeDAO.noticeUpdate(mpvo);
	}

	@Override
	public int noticeDelete(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return noticeDAO.noticeDelete(mpvo);
	}

}
