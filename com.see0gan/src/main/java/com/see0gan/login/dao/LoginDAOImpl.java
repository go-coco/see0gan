package com.see0gan.login.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	private Logger logger = Logger.getLogger(LoginDAOImpl.class);
	
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	
	@Override
	public List<GuestVO> guestSelectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int guestInsert(GuestVO gvo) {
		
		return sqlSession.insert("guestInsert", gvo);
	}

	@Override
	public List<GuestVO> getGuestAccess(GuestVO gvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getGuestAccess");
	}

	@Override
	public int hostInsert(HostVO hvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("hostInsert", hvo);
	}

	@Override
	public List<HostVO> getHostAccess(HostVO hvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getHostAccess");
	}

	@Override
	public int guestUpdate(GuestVO gvo) {
		return sqlSession.update("guestUpdate", gvo);
	}
	
	@Override
	public int hostUpdate(HostVO gvo) {
		return sqlSession.update("hostUpdate", gvo);
	}
	
	@Override
	public int guestDelete(GuestVO gvo) {
		return sqlSession.update("guestDelte", gvo);
	}
	
	@Override
	public int hostDelete(HostVO gvo) {
		return sqlSession.update("hostDelete", gvo);
	}
}
