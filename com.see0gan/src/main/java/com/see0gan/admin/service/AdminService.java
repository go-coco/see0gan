package com.see0gan.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.see0gan.booking.vo.BookingVO;
import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;
import com.see0gan.mypage.vo.MypageVO;
import com.see0gan.payment.vo.PaymentVO;



public interface AdminService {
	
	Map<String,Object> guestSelectAll(Map<String,Object> pagingMap);
	Map<String,Object> hostSelectAll(Map<String,Object> pagingMap);

	
	public void guestDeleteAdmin(Map deleteMap);
	List<GuestVO> guestSelectadmin(Map selectMap);
	
	public void hostDeleteAdmin(Map deleteMap);
	List<HostVO> hostSelectadmin(Map selectMap); 
	
	public int newGuestcnt();
	public int newHostcnt();
	/////////////////////////////////////////
	Map<String, Object> paymentSelectAllAdmin(Map<String, Object>  pagingMap);
	
	List<PaymentVO> paymentSelectAdmin(Map selectMap);
	
	//public void paymentUpdateAdmin(String change_payment_status, String change_tbsp_pay_num);
	//public void paymentUpdateAdmin(@Param("change_payment_status")String change_payment_status, @Param("change_tbsp_pay_num")String change_tbsp_pay_num);
	public void paymentUpdateAdmin(Map UpdateMap);
	
	public List<Integer> todayTotalPay( );
	
	Map<String,Object> oneSelectAllAdmin(Map<String,Object> pagingMap);
}
