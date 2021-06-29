package com.see0gan.login.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.see0gan.login.dao.LoginDAO;
import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;

@Service
public class LoginServiceImpl implements LoginService {

	private Logger logger = Logger.getLogger(LoginService.class);
	
	// 컨트롤러에서 서비스 연결 
	private LoginDAO loginDAO;
		
	// 생성자에 @Autowired 어노테이션으로  DI (의존성 주입하기)
	@Autowired(required=false)
	public LoginServiceImpl(LoginDAO loginDAO) {
		this.loginDAO = loginDAO;		
	}
	
	@Override
	public List<GuestVO> guestSelectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GuestVO> getAccess(GuestVO gvo) {
		// TODO Auto-generated method stub
		return loginDAO.getGuestAccess(gvo);
	}

	@Override
	public int memberInsert(GuestVO gvo) {
		// TODO Auto-generated method stub
		return loginDAO.guestInsert(gvo);
	}

	@Override
	public int memberInsert(HostVO hvo) {
		// TODO Auto-generated method stub
		return loginDAO.hostInsert(hvo);
	}

	@Override
	public List<HostVO> getAccess(HostVO hvo) {
		// TODO Auto-generated method stub
		return loginDAO.getHostAccess(hvo);
	}
	
	@Override
	public int guestUpdate(GuestVO gvo) {
		return loginDAO.guestUpdate(gvo);
	}
	
	@Override
	public int hostUpdate(HostVO gvo) {
		return loginDAO.hostUpdate(gvo);
	}
	
	@Override
	public int guestDelete(GuestVO gvo) {
		return loginDAO.guestDelete(gvo);
	}
	
	@Override
	public int hostDelete(HostVO gvo) {
		return loginDAO.hostDelete(gvo);
	}
}
