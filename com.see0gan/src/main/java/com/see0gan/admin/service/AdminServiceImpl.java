package com.see0gan.admin.service;


import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.see0gan.admin.dao.AdminDAO;


import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;
import com.see0gan.mypage.vo.MypageVO;
import com.see0gan.payment.vo.PaymentVO;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	Logger logger = Logger.getLogger(AdminServiceImpl.class);
	
	private AdminDAO adminDAO;
	
	@Autowired(required=false)
	public AdminServiceImpl(AdminDAO adminDAO) {		
		this.adminDAO = adminDAO;
	}


	@Override
	public Map<String, Object> guestSelectAll(Map<String, Object> pagingMap) {
		// TODO Auto-generated method stub
		System.out.println("adminServiceImpl//listMembers  함수진입 >>> : ");
		System.out.println("listMembers!!!!!!!!!!!");
		Map<String,Object> membersMap=new HashMap();
		List<GuestVO> guestList = new ArrayList<GuestVO>();
		
		int allguestMember, allhostMember = 0;
		
		if( adminDAO == null)
		{
			System.out.println("adminServiceImpl//adminDAOImpl == null   >>> : ");
		}
		allguestMember = adminDAO.totalAllguestMember();
		allhostMember = adminDAO.totalAllhostMember();		
		guestList = adminDAO.guestSelectAll(pagingMap);	
	
		System.out.println("guestList.size()   >>> : "+ guestList.size());
		if( guestList.size() == 0)
		{
			System.out.println("adminServiceImpl//guestList == null == null   >>> : ");
		}
		System.out.println("listMembers::allguestMember>>> "+ allguestMember);
		System.out.println("listMembers::allhostMember>>> "+ allhostMember);
		System.out.println("listMembers::guestList>>> "+ guestList);
		
		membersMap.put("guestList", guestList);
		membersMap.put("allguestMember",allguestMember);
		membersMap.put("allhostMember",allhostMember);		
		
		System.out.println("listMembers::guestList.get(0);>>> "+ guestList.get(0));
		return membersMap;

	}


	@Override
	public Map<String, Object> hostSelectAll(Map<String, Object> pagingMap) {
		// TODO Auto-generated method stub
		System.out.println("adminServiceImpl//hostSelectAll  함수진입 >>> : ");
		System.out.println("listMehostSelectAllmbers!!!!!!!!!!!");
		Map<String,Object> membersMap=new HashMap();
		List<HostVO> hostList = new ArrayList<HostVO>();
		
		int allguestMember, allhostMember = 0;
		
		if( adminDAO == null)
		{
			System.out.println("adminServiceImpl//adminDAOImpl == null   >>> : ");
		}
		allguestMember = adminDAO.totalAllguestMember();
		allhostMember = adminDAO.totalAllhostMember();		
		hostList = adminDAO.hostSelectAll(pagingMap);
		System.out.println("hostSelectAll/hostList.size()   >>> : "+ hostList.size());
		if( hostList.size() == 0)
		{
			System.out.println("adminServiceImpl//guestList == null == null   >>> : ");
		}
		System.out.println(":allguestMember>>> "+ allguestMember);
		System.out.println("::allhostMember>>> "+ allhostMember);
		System.out.println(":hostList>>> "+ hostList);
		
		membersMap.put("hostList", hostList);
		membersMap.put("allguestMember",allguestMember);
		membersMap.put("allhostMember",allhostMember);		
		
		return membersMap;

	}





	@Override
	public void guestDeleteAdmin(Map deleteMap) {
		// TODO Auto-generated method stub
		System.out.println("adminServiceImpl//guestDeleteAdmin  함수진입 >>> : ");
		
		 adminDAO.guestDeleteAdmin(deleteMap);
		
	}

	@Override
	public List<GuestVO> guestSelectadmin(Map selectMap) {
		// TODO Auto-generated method stub
		System.out.println("adminServiceImpl//guestSelectadmin  함수진입 >>> : ");
		System.out.println("guestSelectadmin guestSelectadmin!!!!!!!!!!!");
		
		List<GuestVO> guestSelect = new ArrayList<GuestVO>();
		
		
		
		if( adminDAO == null)
		{
			System.out.println("adminServiceImpl//gvo.getTBU_GUESTID()== null   >>> : ");
		}
		
	
		guestSelect = adminDAO.guestSelectadmin(selectMap);
		
		System.out.println("guestSelect.size()   >>> : "+ guestSelect.size());
		if( guestSelect.size() == 0)
		{
			System.out.println("adminServiceImpl//guestSelect == null == null   >>> : ");
		}

		System.out.println("listMembers::guestSelect>>> "+ guestSelect);
		
		
		
		return guestSelect;
	}

	@Override
	public void hostDeleteAdmin(Map deleteMap) {
		// TODO Auto-generated method stub
		System.out.println("adminServiceImpl//hostDeleteAdmin  함수진입 >>> : ");
		
		 adminDAO.hostDeleteAdmin(deleteMap);
		
	}

	@Override
	public List<HostVO> hostSelectadmin(Map selectMap) {
		// TODO Auto-generated method stub
		System.out.println("adminServiceImpl//hostSelectadmin  함수진입 >>> : ");
		System.out.println("guestSelectadmin hostSelectadmin!!!!!!!!!!!");
		
		List<HostVO> hostSelect = new ArrayList<HostVO>();
		
		
		
		if( adminDAO == null)
		{
			System.out.println("adminServiceImpl//gvo.getTBH_HOSTID()== null   >>> : ");
		}
		
	
		hostSelect = adminDAO.hostSelectadmin(selectMap);
		
		System.out.println("hostSelect.size()   >>> : "+ hostSelect.size());
		if( hostSelect.size() == 0)
		{
			System.out.println("adminServiceImpl//hostSelect == null == null   >>> : ");
		}

		System.out.println("listMembers::hostSelect>>> "+ hostSelect);
		
		
		
		return hostSelect;
	}


	@Override
	public int newGuestcnt() {
		// TODO Auto-generated method stub
		int newguestcnt = 0;
		
		newguestcnt = adminDAO.newGuestcnt();
		return newguestcnt;
	}


	@Override
	public int newHostcnt() {
		// TODO Auto-generated method stub
		int newhostcnt = 0;
		newhostcnt = adminDAO.newHostcnt();
		
		return newhostcnt;
	}


	@Override
	public Map<String, Object> paymentSelectAllAdmin(Map<String, Object>  pagingMap) {
		// TODO Auto-generated method stub
		System.out.println("adminServiceImpl//paymentSelectAllAdmin  함수진입 >>> : ");
	
		Map<String,Object> paymentMap=new HashMap();
		List<PaymentVO> paymentList = new ArrayList<PaymentVO>();
				
		if( adminDAO == null)
		{
			System.out.println("adminServiceImpl//adminDAOImpl == null   >>> : ");
		}
	
		paymentList = adminDAO.paymentSelectAllAdmin(pagingMap);
		System.out.println("hostSelectAll/paymentList.size()   >>> : "+ paymentList.size());
		if( paymentList.size() == 0)
		{
			System.out.println("adminServiceImpl//paymentList == null == null   >>> : ");
		}

		System.out.println(":paymentList>>> "+ paymentList);
		
		paymentMap.put("paymentList", paymentList);
		
		return paymentMap;

	}


	@Override
	public List<PaymentVO> paymentSelectAdmin(Map selectMap) {
		// TODO Auto-generated method stub
		System.out.println("adminServiceImpl//paymentSelectAdmin  함수진입 >>> : ");
		
		List<PaymentVO> paymentSelect = new ArrayList<PaymentVO>();
		
		
		
		if( adminDAO == null)
		{
			System.out.println("adminServiceImpl//adminDAO== null   >>> : ");
		}
		
	
		paymentSelect = adminDAO.paymentSelectAdmin(selectMap);
		
		System.out.println("paymentSelect.size()   >>> : "+ paymentSelect.size());
		if( paymentSelect.size() == 0)
		{
			System.out.println("adminServiceImpl//paymentSelect.size() == null == null   >>> : ");
		}

		System.out.println("paymentSelectAdmin::paymentSelect>>> "+ paymentSelect);
		
		
		
		return paymentSelect;
	}


	@Override
	public void paymentUpdateAdmin(Map UpdateMap) {
		// TODO Auto-generated method stub
		System.out.println("adminServiceImpl//paymentUpdateAdmin  함수진입 >>> : ");
		
		if( adminDAO == null)
		{
			System.out.println("adminServiceImpl//adminDAO== null   >>> : ");
		}
		
		
		adminDAO.paymentUpdateAdmin(UpdateMap);
		
		
	}


	@Override
	public List<Integer> todayTotalPay() {
		// TODO Auto-generated method stub
		
		if( adminDAO == null)
		{
			System.out.println("adminServiceImpl//adminDAO== null   >>> : ");
		}
		 
		return adminDAO.todayTotalPay();
	}


	@Override
	public Map<String, Object> oneSelectAllAdmin(Map<String, Object> pagingMap) {
		// TODO Auto-generated method stub
		System.out.println("adminServiceImpl//oneSelectAllAdmin  함수진입 >>> : ");
		
		Map<String,Object> boardMap=new HashMap();
		List<MypageVO> boardList = new ArrayList<MypageVO>();
		if( adminDAO == null)
		{
			System.out.println("adminServiceImpl//adminDAO== null   >>> : ");
		}
		boardList =  adminDAO.oneSelectAllAdmin(pagingMap);
		
		System.out.println("boardList.size()   >>> : "+ boardList.size());
		if( boardList.size() == 0)
		{
			System.out.println("adminServiceImpl//boardList.size() == null == null   >>> : ");
		}
		boardMap.put("boardList", boardList);		
		return boardMap;
	}



}
