package com.see0gan.review.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.see0gan.mypage.vo.MypageVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	Logger logger = Logger.getLogger(ReviewDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MypageVO> reviewListAll(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("reviewAllList() 실행 >>> : ");

		List<MypageVO> list = sqlSession.selectList("reviewAllList", mpvo);

		logger.info("reviewAllList() 종료 list >>> : " + list);
		
		return list;
	}

	@Override
	public List<MypageVO> reviewList(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("reviewList() 실행 mpvo >>> : " + mpvo);

		List<MypageVO> list = sqlSession.selectList("reviewList");

		logger.info("reviewList() 종료 list >>> : " + list);
		
		return list;
	}

	@Override
	public List<MypageVO> reviewSelect(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("reviewSelect() 실행 >>> : ");

		List<MypageVO> list = sqlSession.selectList("reviewSelect", mpvo);

		logger.info("reviewSelect() 종료 list >>> : " + list);
		
		return list;
	}

	@Override
	public int reviewRootInsert(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("reviewRootInsert() 실행 >>> : ");

		int cnt = sqlSession.insert("reviewRootInsert", mpvo);

		logger.info("reviewRootInsert() 종료 list >>> : " + cnt);
		
		return cnt;
	}

	@Override
	public int reviewReInsert(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("reviewReInsert() 실행 >>> : ");

		int cnt = sqlSession.insert("reviewReInsert", mpvo);

		logger.info("reviewReInsert() 종료 list >>> : " + cnt);
		
		return cnt;
	}

	@Override
	public int reviewUpdate(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("reviewUpdate() 실행 >>> : ");

		int cnt = sqlSession.update("reviewUpdate", mpvo);

		logger.info("reviewUpdate() 종료 list >>> : " + cnt);
		
		return cnt;
	}

	@Override
	public int reviewDelete(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("reviewDelete() 실행 >>> : ");

		int cnt = sqlSession.update("reviewDelete", mpvo);

		logger.info("reviewDelete() 종료 list >>> : " + cnt);
		
		return cnt;
	}

	@Override
	public int reviewDeleteAdmin(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("reviewDeleteAdmin() 실행 >>> : ");

		int cnt = sqlSession.update("reviewDeleteAdmin", mpvo);

		logger.info("reviewDeleteAdmin() 종료 list >>> : " + cnt);
		
		return cnt;
	}

}
