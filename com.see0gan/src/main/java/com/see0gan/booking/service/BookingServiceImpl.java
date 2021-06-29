package com.see0gan.booking.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.see0gan.booking.dao.BookingDAO;
import com.see0gan.booking.vo.BookingVO;

@Service
public class BookingServiceImpl implements BookingService {
	
	private Logger logger = Logger.getLogger(BookingService.class);
	
	private BookingDAO bookingDAO;
	
	@Autowired(required=false)
	public BookingServiceImpl(BookingDAO bookingDAO) {
		this.bookingDAO = bookingDAO;
	}

	@Override
	public List<BookingVO> spaceSelect(BookingVO bkvo) {
		
		logger.info("BookingServiceImpl  spaceSelect 함수 진입 >>> : ");
		return bookingDAO.spaceSelect(bkvo);
	}

	@Override
	public List<BookingVO> bokHostSelect(BookingVO bkvo) {
		

		logger.info("BookingServiceImpl  bokHostSelect 함수 진입 >>> : ");
		return bookingDAO.bokHostSelect(bkvo);

	}

	@Override
	public int bookingInsert(BookingVO bkvo) {
		
		logger.info("BookingServiceImpl  bookingInsert �븿�닔 吏꾩엯 >>> : ");
		return bookingDAO.bookingInsert(bkvo);
	}

	@Override
	public List<BookingVO> timeSelect(BookingVO bkvo) {
		return bookingDAO.timeSelect(bkvo);
	}

	@Override
	public int bookingTimeUpdate(BookingVO bkvo) {
		logger.info("BookingServiceImpl  bookingTimeUpdate 함수 진입 >>> : ");
		return bookingDAO.bookingTimeUpdate(bkvo);
	}

	@Override
	public List<BookingVO> bookHisSelect(BookingVO bkvo) {
		
		logger.info("BookingServiceImpl  bookHisSelect 함수 진입 >>> : ");
		return bookingDAO.bookHisSelect(bkvo);
	}

	@Override
	public int bokHisUpdate(BookingVO bkvo) {
		return bookingDAO.bokHisUpdate(bkvo);
	}
}
