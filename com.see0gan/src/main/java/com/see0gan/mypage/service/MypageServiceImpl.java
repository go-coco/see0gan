package com.see0gan.mypage.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.see0gan.mypage.dao.MypageDAO;
import com.see0gan.payment.service.PaymentService;
import com.see0gan.booking.dao.BookingDAO;
import com.see0gan.booking.vo.BookingVO;
import com.see0gan.login.vo.GuestVO;

@Service
@Transactional
public class MypageServiceImpl implements MypageService {

	private Logger logger = Logger.getLogger(MypageServiceImpl.class);
	private MypageDAO mypageDAO;
	
	@Autowired(required=false)
	public MypageServiceImpl(MypageDAO mypageDAO) {
		this.mypageDAO = mypageDAO;
	}
	
	// ���ฮ��Ʈ
	@Override
	public List<BookingVO> getBookList(BookingVO bvo) {
		// TODO Auto-generated method stub
		logger.info("MypageServiceImpl getBookList ���� >>>");
		List<BookingVO> list = new ArrayList<BookingVO>();
		list = mypageDAO.getBookList(bvo);
		return list;
	}
	
	// ���ฮ��Ʈ ����ȸ
	@Override
	public List<BookingVO> getBookdetail(BookingVO bvo) {
		// TODO Auto-generated method stub
		logger.info("MypageServiceImpl getBookdetail ���� >>>");
		List<BookingVO> list = mypageDAO.getBookdetail(bvo);
		return list;
	}
	// �Խ�Ʈ ����Ʈ
	@Override
	public List<GuestVO> guestSelectAll(GuestVO gvo) {
		// TODO Auto-generated method stub
		logger.info("MypageServiceImpl guestSelectAll ���� >>>");
		List<GuestVO> list = new ArrayList<GuestVO>();
		list = mypageDAO.guestSelectAll(gvo);
		return list;
	}
	// �Խ�Ʈ ȸ�� ������ȸ
	@Override
	public GuestVO guestSelect(String guestId) {
		// TODO Auto-generated method stub
		logger.info("MypageServiceImpl guestSelect ���� >>>");
		GuestVO gvo = mypageDAO.guestSelect(guestId);
		return gvo;
	}
}
