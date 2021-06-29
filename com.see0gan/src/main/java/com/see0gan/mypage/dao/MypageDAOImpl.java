package com.see0gan.mypage.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.see0gan.booking.vo.BookingVO;
import com.see0gan.login.vo.GuestVO;
import com.see0gan.mypage.service.MypageService;
import com.see0gan.payment.service.PaymentService;

@Repository
public class MypageDAOImpl implements MypageDAO {

	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	private Logger logger = Logger.getLogger(MypageDAOImpl.class);
	// 예약리스트
	@Override
	public List<BookingVO> getBookList(BookingVO bvo) {
		// TODO Auto-generated method stub
		logger.info("MypageDAOImpl getBookList 진입 >>>");
		return sqlSession.selectList("getBookList");
	}
	
	// 예약리스트 상세조회
	@Override
	public List<BookingVO> getBookdetail(BookingVO bvo) {
		// TODO Auto-generated method stub
		logger.info("MypageDAOImpl getBookdetail 진입 >>>");
		return sqlSession.selectOne("getBookdetail");
	}
	// 게스트 리스트
	@Override
	public List<GuestVO> guestSelectAll(GuestVO gvo) {
		// TODO Auto-generated method stub
		logger.info("MypageDAOImpl guestSelectAll 진입 >>>");
		return sqlSession.selectList("guestSelectAll");
	}
	// 게스트 회원 정보조회
	@Override
	public GuestVO guestSelect(String guestId) {
		// TODO Auto-generated method stub
		logger.info("MypageDAOImpl guestSelect 진입 >>>");
		return sqlSession.selectOne("guestSelect");
	}
}