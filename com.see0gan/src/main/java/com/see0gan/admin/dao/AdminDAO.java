package com.see0gan.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.see0gan.booking.vo.BookingVO;
import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;
import com.see0gan.mypage.vo.MypageVO;
import com.see0gan.payment.vo.PaymentVO;


public interface AdminDAO {
	
	Integer totalAllguestMember();
	Integer totalAllhostMember();

	List<GuestVO> guestSelectAll(Map pagingMap);
	List<HostVO> hostSelectAll(Map pagingMap);
	
	public void hostDeleteAdmin(Map deleteMap);
	public void  guestDeleteAdmin(Map deleteMap);
	
	List<GuestVO>guestSelectadmin(Map selectMap);
	List<HostVO>hostSelectadmin(Map selectMap);
	
	public int newGuestcnt( );
	public int newHostcnt( );
	public List<Integer> todayTotalPay( );
	
/////////////////////////////////////////////////////////////
	
	List<PaymentVO> paymentSelectAllAdmin(Map pagingMap);
		
	List<PaymentVO> paymentSelectAdmin(Map selectMap);
	
	//void paymentUpdateAdmin(String change_payment_status, String change_tbsp_pay_num);
	//public void paymentUpdateAdmin(@Param("change_payment_status")String change_payment_status, @Param("change_tbsp_pay_num")String change_tbsp_pay_num);
	public void paymentUpdateAdmin(Map UpdateMap);
	
	List<MypageVO> oneSelectAllAdmin(Map pagingMap);

	

}
