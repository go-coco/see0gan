package com.see0gan.qna.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.see0gan.mypage.vo.MypageVO;
import com.see0gan.qna.dao.QnaDAO;

@Service
@Transactional
public class QnaServiceImpl implements QnaService {
	
	Logger logger = Logger.getLogger(QnaServiceImpl.class);
	
	@Autowired
	private QnaDAO qnaDAO;

	@Override
	public List<MypageVO> qnaListAll(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("QnaServiceImpl qnaListAll 시작");
		
		List<MypageVO> list = qnaDAO.qnaListAll(mpvo);
		
		logger.info("QnaServiceImpl qnaListAll 종료 list >>> : " + list);
		
		return list;
	}

	@Override
	public List<MypageVO> qnaList(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("QnaServiceImpl qnaList 시작");
		
		List<MypageVO> list = qnaDAO.qnaList(mpvo);

		logger.info("qnaList 종료 list >>> : " + list);
		
		return list;
	}

	@Override
	public List<MypageVO> qnaSelect(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("qnaSelect 시작");

		List<MypageVO> list = qnaDAO.qnaSelect(mpvo);

		logger.info("qnaSelect 종료 list >>> : " + list);
		
		return list;
	}

	@Override
	public int qnaRootInsert(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("qnaRootInsert 시작 >>> : ");

		int cnt = qnaDAO.qnaRootInsert(mpvo);

		logger.info("qnaRootInsert 종료 cnt >>> : " + cnt);
		return cnt;
	}

	@Override
	public int qnaReInsert(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("qnaReInsert 시작 >>> : ");

		int cnt = qnaDAO.qnaReInsert(mpvo);

		logger.info("qnaReInsert 종료 cnt >>> : " + cnt);
		
		return cnt;
	}

	@Override
	public int qnaUpdate(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("qnaUpdate 시작 >>> : ");

		int cnt = qnaDAO.qnaUpdate(mpvo);

		logger.info("qnaUpdate 종료 cnt >>> : " + cnt);
		
		return cnt;
	}

	@Override
	public int qnaDelete(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("qnaDelete 시작 >>> : ");

		int cnt = qnaDAO.qnaDelete(mpvo);

		logger.info("qnaDelete 종료 cnt >>> : " + cnt);
		
		return cnt;
	}

	@Override
	public int qnaDeleteAdmin(MypageVO mpvo) {
		// TODO Auto-generated method stub
		logger.info("qnaDeleteAdmin 시작 >>> : ");

		int cnt = qnaDAO.qnaDeleteAdmin(mpvo);

		logger.info("qnaDeleteAdmin 종료 cnt >>> : " + cnt);
		
		return cnt;
	}

}
