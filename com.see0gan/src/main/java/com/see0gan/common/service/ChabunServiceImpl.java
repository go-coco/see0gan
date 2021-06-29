package com.see0gan.common.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.see0gan.booking.vo.BookingVO;
import com.see0gan.common.dao.ChabunDAO;
import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;
import com.see0gan.mypage.vo.MypageVO;
import com.see0gan.payment.vo.PaymentVO;
import com.see0gan.space.vo.SP_BasicInfoVO;
import com.see0gan.space.vo.SP_HostInfoVO;

@Service
@Transactional
public class ChabunServiceImpl implements ChabunService {

	private Logger logger = Logger.getLogger(ChabunServiceImpl.class);
	
	private ChabunDAO chabunDAO;
	
	@Autowired(required=false)
	public ChabunServiceImpl(ChabunDAO chabunDAO) {
		this.chabunDAO = chabunDAO;
	}
	
	@Override
	public PaymentVO getPaymentChabun() {
		logger.info("채번로직 구하기");
		return chabunDAO.getPaymentChabun();
	}

	@Override

	public GuestVO getGuestIdChabun() {
		// TODO Auto-generated method stub
		return chabunDAO.getGuestIdChabun();
	}

	@Override
	public HostVO getHostNumChabun() {
		// TODO Auto-generated method stub
		return chabunDAO.getHostNumChabun();
	}
	public BookingVO getBookingChabun() {
		return chabunDAO.getBookingChabun();

	}
	
	@Override
	public SP_BasicInfoVO getSpaceChabun() {
		
		return chabunDAO.getSpaceChabun();
	}

	@Override
	public SP_HostInfoVO getHostInfoChabun() {
		
		return chabunDAO.getHostInfoChabun();
	}
	
	@Override
	public MypageVO getNoticeChabun() {
		// TODO Auto-generated method stub
		
		return chabunDAO.getNoticeChabun();
	}

	@Override
	public MypageVO getReviewChabun() {
		// TODO Auto-generated method stub
		
		return chabunDAO.getReviewChabun();
	}

	@Override
	public MypageVO getQnaChabun() {
		// TODO Auto-generated method stub
		return chabunDAO.getQnaChabun();
	}

	@Override
	public MypageVO getOneChabun() {
		// TODO Auto-generated method stub
		return chabunDAO.getOneChabun();
	}

}
