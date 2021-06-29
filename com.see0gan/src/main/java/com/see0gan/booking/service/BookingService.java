package com.see0gan.booking.service;

import java.util.List;

import com.see0gan.booking.vo.BookingVO;
public interface BookingService {

	// 공간정보 조회
	public List<BookingVO> spaceSelect(BookingVO bkvo);
	
	// 호스트 정보 조회
	public List<BookingVO> bokHostSelect(BookingVO bkvo);
	
	// 해당날짜 예약 조회
	public List<BookingVO> timeSelect(BookingVO bkvo);
	
	// 예약정보 등록
	public int bookingInsert(BookingVO bkvo);
	
	// 예약시간 수정
	public int bookingTimeUpdate(BookingVO bkvo);
	
	// 예약내역 조회
	public List<BookingVO> bookHisSelect(BookingVO bkvo);
	
	// 예약취소
	public int bokHisUpdate(BookingVO bkvo);
}
