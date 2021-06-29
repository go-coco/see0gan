package com.see0gan.booking.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.see0gan.booking.vo.BookingVO;

@Repository
public class BookingDAOImpl implements BookingDAO {

	private Logger logger = Logger.getLogger(BookingDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	// 공간정보 조회
	@Override
	public List<BookingVO> spaceSelect(BookingVO bkvo) {
		return sqlSession.selectOne("spaceSelect",bkvo);
	}

	// 호스트 정보 조회
	@Override
	public List<BookingVO> bokHostSelect(BookingVO bkvo) {
		return sqlSession.selectOne("bokHostSelect",bkvo);
	}

	// 예약 정보 등록
	@Override
	public int bookingInsert(BookingVO bkvo) {
		return (Integer)sqlSession.insert("bookingInsert",bkvo);
	}

	@Override
	public List<BookingVO> timeSelect(BookingVO bkvo) {
		return sqlSession.selectOne("timeSelect",bkvo);
	}

	@Override
	public int bookingTimeUpdate(BookingVO bkvo) {
		return (Integer)sqlSession.update("bookingTimeInsert",bkvo);
	}

	@Override
	public List<BookingVO> bookHisSelect(BookingVO bkvo) {
		return sqlSession.selectList("bookHisSelect",bkvo);
	}

	@Override
	public int bokHisUpdate(BookingVO bkvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("bokHisUpdate",bkvo);
	}
	
}
