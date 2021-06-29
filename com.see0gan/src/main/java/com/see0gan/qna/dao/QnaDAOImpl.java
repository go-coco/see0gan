package com.see0gan.qna.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.see0gan.mypage.vo.MypageVO;

@Repository
public class QnaDAOImpl implements QnaDAO {
	
	Logger logger = Logger.getLogger(QnaDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MypageVO> qnaListAll(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("qnaListAll() 실행 >>> : ");
		
		List<MypageVO> list = sqlSession.selectList("qnaListAll", mpvo);
		
		logger.info("qnaListAll() 종료 list >>> : " + list);
		
		return list;
	}

	@Override
	public List<MypageVO> qnaList(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("QnaDAOImpl qnaList() 실행 mpvo >>> : " + mpvo);

		List<MypageVO> list = sqlSession.selectList("qnaList");

		logger.info("QnaDAOImpl qnaList() 종료 list >>> : " + list);
		
		return list;
	}

	@Override
	public List<MypageVO> qnaSelect(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("qnaSelect() 실행 >>> : ");

		List<MypageVO> list = sqlSession.selectList("qnaSelect", mpvo);

		logger.info("qnaSelect() 종료 list >>> : " + list);
		
		return list;
	}

	@Override
	public int qnaRootInsert(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("qnaRootInsert() 실행 >>> : ");

		int cnt = sqlSession.insert("qnaRootInsert", mpvo);

		logger.info("qnaRootInsert() 종료 list >>> : " + cnt);
		
		return cnt;
	}

	@Override
	public int qnaReInsert(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("qnaReInsert() 실행 >>> : ");

		int cnt = sqlSession.insert("qnaReInsert", mpvo);

		logger.info("qnaReInsert() 종료 list >>> : " + cnt);
		
		return cnt;
	}

	@Override
	public int qnaUpdate(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("qnaUpdate() 실행 >>> : ");

		int cnt = sqlSession.update("qnaUpdate", mpvo);

		logger.info("qnaUpdate() 종료 list >>> : " + cnt);
		
		return cnt;
	}

	@Override
	public int qnaDelete(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("qnaDelete() 실행 >>> : ");

		int cnt = sqlSession.update("qnaDelete", mpvo);

		logger.info("qnaDelete() 종료 list >>> : " + cnt);
		
		return cnt;
	}

	@Override
	public int qnaDeleteAdmin(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("qnaDeleteAdmin() 실행 >>> : ");

		int cnt = sqlSession.update("qnaDeleteAdmin", mpvo);

		logger.info("qnaDeleteAdmin() 종료 list >>> : " + cnt);
		
		return cnt;
	}

}
