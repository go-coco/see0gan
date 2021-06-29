package com.see0gan.one.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.see0gan.mypage.vo.MypageVO;

@Repository
public class OneDAOImpl implements OneDAO {

	Logger logger = Logger.getLogger(OneDAOImpl.class);

	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MypageVO> oneSelectAll(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("oneSelectAll", mpvo);
	}
	
	@Override
	public List<MypageVO> oneSelectAllU(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("oneSelectAllU", mpvo);
	}
	
	@Override
	public List<MypageVO> oneSelect(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("oneSelect", mpvo);
	}

	@Override
	public int oneInsert(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.insert("oneInsert", mpvo);
	}

	@Override
	public int oneUpdate(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("oneUpdate", mpvo);
	}

	@Override
	public int oneDelete(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("oneDelete", mpvo);
	}

}
