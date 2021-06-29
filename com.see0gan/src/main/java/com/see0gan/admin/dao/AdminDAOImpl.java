package com.see0gan.admin.dao;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.see0gan.admin.service.AdminServiceImpl;
import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;
import com.see0gan.mypage.vo.MypageVO;
import com.see0gan.payment.vo.PaymentVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	Logger logger = Logger.getLogger(AdminDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public Integer totalAllguestMember() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("totalAllguestMember");
	}

	@Override
	public Integer totalAllhostMember() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("totalAllhostMember");
	}

	@Override
	public List<GuestVO> guestSelectAll(Map pagingMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("guestSelectAll",pagingMap);
	}

	@Override
	public List<HostVO> hostSelectAll(Map pagingMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("hostSelectAll",pagingMap);
	}


	@Override
	public void guestDeleteAdmin(Map deleteMap) {
		// TODO Auto-generated method stub
		 sqlSession.delete("guestDeleteAdmin",deleteMap);
		
	}

	@Override
	public List<GuestVO> guestSelectadmin(Map selectMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("guestSelectadmin",selectMap);
	}

	@Override
	public void hostDeleteAdmin(Map deleteMap) {
		// TODO Auto-generated method stub
		 sqlSession.delete("hostDeleteAdmin",deleteMap);
		
	}

	@Override
	public List<HostVO> hostSelectadmin(Map selectMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("hostSelectadmin",selectMap);
	}

	@Override
	public int newGuestcnt() {
		// TODO Auto-generated method stub				
		return sqlSession.selectOne("newGuestcnt");
	}

	@Override
	public int newHostcnt() {
		// TODO Auto-generated method stub		
		return sqlSession.selectOne("newHostcnt");
	}

	@Override
	public List<PaymentVO> paymentSelectAllAdmin(Map pagingMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("paymentSelectAllAdmin",pagingMap);
	}

	@Override
	public List<PaymentVO> paymentSelectAdmin(Map selectMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("paymentSelectAdmin",selectMap);
	}

	@Override
	public void paymentUpdateAdmin(Map UpdateMap) {
		// TODO Auto-generated method stub
		sqlSession.update("paymentUpdateAdmin",UpdateMap);
		
	}


	@Override
	public List<Integer> todayTotalPay() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("todayTotalPay");
	}

	@Override
	public List<MypageVO> oneSelectAllAdmin(Map pagingMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("oneSelectAllAdmin",pagingMap);
	}
}
