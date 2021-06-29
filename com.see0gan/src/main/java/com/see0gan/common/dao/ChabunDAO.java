package com.see0gan.common.dao;

import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;
import com.see0gan.mypage.vo.MypageVO;
import com.see0gan.booking.vo.BookingVO;
import com.see0gan.payment.vo.PaymentVO;
import com.see0gan.space.vo.SP_BasicInfoVO;
import com.see0gan.space.vo.SP_HostInfoVO;

public interface ChabunDAO {
	
	public PaymentVO getPaymentChabun();
	public GuestVO getGuestIdChabun();
	public HostVO getHostNumChabun();
	public BookingVO getBookingChabun();
	public SP_BasicInfoVO getSpaceChabun();

	public SP_HostInfoVO getHostInfoChabun();
	
	public MypageVO getNoticeChabun();
	public MypageVO getReviewChabun();
	public MypageVO getQnaChabun();
	public MypageVO getOneChabun();
}
