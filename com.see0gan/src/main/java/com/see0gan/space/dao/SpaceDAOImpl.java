package com.see0gan.space.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.see0gan.booking.vo.BookingVO;
import com.see0gan.login.vo.HostVO;
import com.see0gan.space.vo.SP_AccountsInfoVO;
import com.see0gan.space.vo.SP_BasicInfoVO;
import com.see0gan.space.vo.SP_GuideInfoVO;
import com.see0gan.space.vo.SP_HostInfoVO;

@Repository
public class SpaceDAOImpl implements SpaceDAO {

	Logger logger = Logger.getLogger(SpaceDAOImpl.class);
	
	//SqlSessionTemplate = db연결 다리
	@Autowired(required = false)
	private SqlSessionTemplate sqlSession;
	
	//part1		
		//xml로 정보를 보낼 때 DAO 함수명과 mabatis(space.xml)의 id값을 일치시키는게 중요!
		//리턴값을 적는건 요식행위로 안적어도 된다.
		@Override
		public int basicInfo_Insert(SP_BasicInfoVO bvo) {
			logger.info("SpaceDAOImpl basicInfo_Insert 함수진입성공 >>> : ");
			return sqlSession.insert("basicInfo_Insert");
		}

		@Override
		public List<HostVO> hostInfo_Select(HostVO hostVO) {
			logger.info("SpaceDAOImpl hostInfo_Select 함수진입성공 >>> : ");
			return sqlSession.selectList("hostInfo_Select", hostVO);
		}

		@Override
		public int hostInfo_Insert(SP_HostInfoVO hIVO) {
			logger.info("SpaceDAOImpl hostInfo_Insert 함수진입성공 >>> : ");
			return sqlSession.insert("hostInfo_Insert", hIVO);
		}

		@Override
		public List<SP_BasicInfoVO> spaceInfo_SelectQuery(SP_BasicInfoVO bvo) {
			logger.info("SpaceDAOImpl spaceInfo_Select 함수진입성공 >>> : ");
			return sqlSession.selectList("spaceInfo_SelectQuery", bvo);
		}

		@Override
		public int basicInfoTag_Insert(SP_BasicInfoVO bvo) {
			logger.info("SpaceDAOImpl basicInfoTag_Insert 함수진입성공 >>> : ");
			return sqlSession.insert("basicInfoTag_Insert");
		}
	
	//part2
	@Override
	public List<SP_HostInfoVO> hostInfo_Select(SP_HostInfoVO sp_hvo){
		System.out.println("SpaceDAOImpl getTbsp_num>>>"+sp_hvo.getTbsp_num());
		return sqlSession.selectList("basicInfo_Select", sp_hvo);
	}
	
	@Override
	public int guide_Insert(SP_GuideInfoVO sp_gvo) {
		logger.info("SpaceDAOImpl guideInfo_Insert >>> : 시작 ");
		return (Integer) sqlSession.insert("guide_Insert", sp_gvo);
	}

	@Override
	public int dayoff_Insert(SP_GuideInfoVO sp_gvo) {
		logger.info("SpaceDAOImpl dayoff_insert >>> : 시작 ");
		return (Integer) sqlSession.insert("dayoff_Insert", sp_gvo);
	}

	@Override
	public int convenient_Insert(SP_GuideInfoVO sp_gvo) {
		logger.info("SpaceDAOImpl convenient_Insert >>> : 시작 ");
		return (Integer) sqlSession.insert("convenient_Insert", sp_gvo);
	}
	@Override
	public int acuntsInfo_Insert(SP_AccountsInfoVO sp_avo) {
		return (Integer) sqlSession.insert("acuntsInfo_Insert", sp_avo);
	}
	
	@Override
	public List<SP_BasicInfoVO> spaceInfo_detail(SP_BasicInfoVO bvo) {
		// TODO Auto-generated method stub
		logger.info("MypageDAOImpl spaceInfo_detail 진입 >>>");
		return sqlSession.selectOne("spaceInfo_detail");
	}

	@Override
	public List<SP_BasicInfoVO> spaceInfo_SelectAll(SP_BasicInfoVO bvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("spaceInfo_SelectAll", bvo);
	}

}