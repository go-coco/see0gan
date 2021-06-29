package com.see0gan.mypage.service;

import java.util.List;

import com.see0gan.booking.vo.BookingVO;
import com.see0gan.login.vo.GuestVO;

public interface MypageService {
	public List<BookingVO> getBookList(BookingVO bvo);
	public List<BookingVO> getBookdetail(BookingVO bvo);
	
	public List<GuestVO> guestSelectAll(GuestVO gvo);
	public GuestVO guestSelect(String guestId);
}
