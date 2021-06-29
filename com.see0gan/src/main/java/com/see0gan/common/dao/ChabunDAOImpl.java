package com.see0gan.common.dao;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;
import com.see0gan.mypage.vo.MypageVO;
import com.see0gan.booking.vo.BookingVO;
import com.see0gan.payment.vo.PaymentVO;
import com.see0gan.space.vo.SP_BasicInfoVO;
import com.see0gan.space.vo.SP_HostInfoVO;

@Repository
public class ChabunDAOImpl implements ChabunDAO {
	private Logger logger = Logger.getLogger(ChabunDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public PaymentVO getPaymentChabun() {
		return sqlSession.selectOne("getPaymentChabun");
	}

	@Override
	public GuestVO getGuestIdChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getGuestIdChabun");
	}

	@Override
	public HostVO getHostNumChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getGuestIdChabun");
	}
	public BookingVO getBookingChabun() {
		return sqlSession.selectOne("getBookingChabun");

	}

	@Override
	public SP_BasicInfoVO getSpaceChabun() {
		
		return sqlSession.selectOne("getSpaceChabun");
	}

	@Override
	public SP_HostInfoVO getHostInfoChabun() {
		
		return sqlSession.selectOne("getHostInfoChabun");
	}
	
	@Override
	public MypageVO getNoticeChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getNoticeChabun");
	}

	@Override
	public MypageVO getReviewChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getReviewChabun");
	}

	@Override
	public MypageVO getQnaChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getQnaChabun");
	}

	@Override
	public MypageVO getOneChabun() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getOneChabun");
	}
}
