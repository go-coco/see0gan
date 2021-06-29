package com.see0gan.space.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.see0gan.booking.vo.BookingVO;
import com.see0gan.login.vo.HostVO;
import com.see0gan.space.dao.SpaceDAO;
import com.see0gan.space.vo.SP_AccountsInfoVO;
import com.see0gan.space.vo.SP_BasicInfoVO;
import com.see0gan.space.vo.SP_GuideInfoVO;
import com.see0gan.space.vo.SP_HostInfoVO;

@Service
@Transactional
public class SpaceServiceImpl implements SpaceService {
	Logger logger = Logger.getLogger(SpaceServiceImpl.class);

	private SpaceDAO spaceDAO;

	@Autowired(required = false)
	public SpaceServiceImpl(SpaceDAO spaceDAO) {
		this.spaceDAO = spaceDAO;
	}
	
	//part1
	@Override
	public int basicInfo_Insert(SP_BasicInfoVO bvo) {
		logger.info("SpaceServiceImpl basicInfo_Insert >>> :");
		return spaceDAO.basicInfo_Insert(bvo);
	}

	@Override
	public List<HostVO> hostInfo_Select(HostVO hostVO) {
		logger.info("SpaceServiceImpl hostInfo_Select >>> :");
		return spaceDAO.hostInfo_Select(hostVO);
	}

	@Override
	public int hostInfo_Insert(SP_HostInfoVO hIVO) {
		logger.info("SpaceServiceImpl hostInfo_Insert >>> :");
		return spaceDAO.hostInfo_Insert(hIVO);
	}

	@Override
	public List<SP_BasicInfoVO> spaceInfo_SelectQuery(SP_BasicInfoVO bvo) {
		logger.info("SpaceServiceImpl spaceInfo_Select >>> :");
		return spaceDAO.spaceInfo_SelectQuery(bvo);
	}

	@Override
	public int basicInfoTag_Insert(SP_BasicInfoVO bvo) {
		logger.info("SpaceServiceImpl basicInfoTag_Insert >>> :");
		return spaceDAO.basicInfoTag_Insert(bvo);
	}
	
	//part2
	@Override
	public List<SP_HostInfoVO> hostInfo_Select(SP_HostInfoVO sp_hvo){
		logger.info("SpaceServiceImpl basicInfo_Select >>> :");
		System.out.println("SpaceServiceImpl getTbsp_num >>> " + sp_hvo.getTbsp_num());
		return spaceDAO.hostInfo_Select(sp_hvo);
	}
	@Override
	public int guideInfo_Insert(SP_GuideInfoVO sp_gvo) {
		logger.info("SpaceServiceImpl guideInfo_Insert >>> : 시작 " + sp_gvo.getTbsp_num());
		return (Integer) spaceDAO.guide_Insert(sp_gvo);
	}

	@Override
	public int dayoff_Insert(SP_GuideInfoVO sp_gvo) {
		logger.info("SpaceServiceImpl dayoff_Insert >>> : 시작 " + sp_gvo.getTbsp_num());
		logger.info("SpaceServiceImpl dayoff_Insert>>> " + sp_gvo.getTbsp_r_dayoff());
		return (Integer) spaceDAO.dayoff_Insert(sp_gvo);
	}

	@Override
	public int convenient_Insert(SP_GuideInfoVO sp_gvo) {
		logger.info("SpaceServiceImpl convenient_Insert >>> : 시작 " + sp_gvo.getTbsp_num());
		logger.info("SpaceServiceImpl convenient_Insert>>> " + sp_gvo.getTbsp_convenient1());
		return (Integer) spaceDAO.convenient_Insert(sp_gvo);
	}

	@Override
	public int acuntsInfo_Insert(SP_AccountsInfoVO sp_avo) {
		return (Integer) spaceDAO.acuntsInfo_Insert(sp_avo);
	}
	
	@Override
	public List<SP_BasicInfoVO> spaceInfo_detail(SP_BasicInfoVO svo) {
		// TODO Auto-generated method stub
		logger.info("MypageDAOImpl spaceInfo_detail 진입 >>>");
		return spaceDAO.spaceInfo_detail(svo);
	}

	@Override
	public List<SP_BasicInfoVO> spaceInfo_SelectAll(SP_BasicInfoVO bvo) {
		// TODO Auto-generated method stub
		return spaceDAO.spaceInfo_SelectAll(bvo);
	}

}
