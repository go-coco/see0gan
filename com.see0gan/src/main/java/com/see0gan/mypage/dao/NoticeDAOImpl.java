package com.see0gan.mypage.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.see0gan.mypage.vo.MypageVO;


@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	Logger logger = Logger.getLogger(NoticeDAOImpl.class);

	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MypageVO> noticeSelectPage(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("NoticeSelectAllPage", mpvo);
	}
	
	@Override
	public List<MypageVO> noticeSelectAll(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("NoticeSelectAll", mpvo);
	}
	
	@Override
	public List<MypageVO> noticeSelect(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("NoticeSelect", mpvo);
	}

	@Override
	public int noticeInsert(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.insert("NoticeInsert", mpvo);
	}

	@Override
	public int noticeUpdate(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("NoticeUpdate", mpvo);
	}

	@Override
	public int noticeDelete(MypageVO mpvo) {
		// TODO Auto-generated method stub
		return (Integer)sqlSession.update("NoticeVIEWS", mpvo);
	}

}
