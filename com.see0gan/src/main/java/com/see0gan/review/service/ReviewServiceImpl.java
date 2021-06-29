package com.see0gan.review.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.see0gan.mypage.vo.MypageVO;
import com.see0gan.review.dao.ReviewDAO;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService {
	
	Logger logger = Logger.getLogger(ReviewServiceImpl.class);
	
	@Autowired
	private ReviewDAO reviewDAO;


	@Override
	public List<MypageVO> reviewListAll(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("ReviewServiceImpl reviewAllList 시작");
		
		List<MypageVO> list = reviewDAO.reviewListAll(mpvo);
		
		logger.info("reviewListAll 종료 list >>> : " + list);
		
		return list;
	}

	@Override
	public List<MypageVO> reviewList(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("reviewList 시작");

		List<MypageVO> list = reviewDAO.reviewList(mpvo);

		logger.info("reviewList 종료 list >>> : " + list);
		
		return list;
	}
	

	@Override
	public List<MypageVO> reviewSelect(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("reviewSelect 시작");

		List<MypageVO> list = reviewDAO.reviewSelect(mpvo);

		logger.info("reviewSelect 종료 list >>> : " + list);
		
		return list;
	}

	@Override
	public int reviewRootInsert(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("reviewRootInsert 시작 >>> : ");

		int cnt = reviewDAO.reviewRootInsert(mpvo);

		logger.info("reviewRootInsert 종료 cnt >>> : " + cnt);
		return cnt;
	}

	@Override
	public int reviewReInsert(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("reviewReInsert 시작 >>> : ");

		int cnt = reviewDAO.reviewReInsert(mpvo);

		logger.info("reviewReInsert 종료 cnt >>> : " + cnt);
		
		return cnt;
	}

	@Override
	public int reviewUpdate(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("reviewUpdate 시작 >>> : ");

		int cnt = reviewDAO.reviewUpdate(mpvo);

		logger.info("reviewUpdate 종료 cnt >>> : " + cnt);
		
		return cnt;
	}

	@Override
	public int reviewDelete(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("reviewDelete 시작 >>> : ");

		int cnt = reviewDAO.reviewDelete(mpvo);

		logger.info("reviewDelete 종료 cnt >>> : " + cnt);
		
		return cnt;
	}

	@Override
	public int reviewDeleteAdmin(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("reviewDeleteAdmin 시작 >>> : ");

		int cnt = reviewDAO.reviewDeleteAdmin(mpvo);

		logger.info("reviewDeleteAdmin 종료 cnt >>> : " + cnt);
		
		return cnt;
	}

}
