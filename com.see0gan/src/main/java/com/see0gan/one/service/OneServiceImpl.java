package com.see0gan.one.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.see0gan.mypage.vo.MypageVO;
import com.see0gan.one.dao.OneDAO;

@Service
@Transactional
public class OneServiceImpl implements OneService {

Logger logger = Logger.getLogger(OneServiceImpl.class);
	
	private OneDAO oneDAO;
	
	@Autowired(required=false)
	public OneServiceImpl(OneDAO oneDAO) {
		this.oneDAO = oneDAO;
	}

	@Override
	public List<MypageVO> oneSelectAll(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return oneDAO.oneSelectAll(mpvo);
	}
	
	@Override
	public List<MypageVO> oneSelectAllU(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return oneDAO.oneSelectAllU(mpvo);
	}

	@Override
	public List<MypageVO> oneSelect(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return oneDAO.oneSelect(mpvo);
	}

	@Override
	public int oneInsert(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return oneDAO.oneInsert(mpvo);
	}

	@Override
	public int oneUpdate(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return oneDAO.oneUpdate(mpvo);
	}

	@Override
	public int oneDelete(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return oneDAO.oneDelete(mpvo);
	}

}
