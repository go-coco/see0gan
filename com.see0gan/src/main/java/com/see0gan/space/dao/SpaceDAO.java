package com.see0gan.space.dao;

import java.util.List;

import com.see0gan.login.vo.HostVO;
import com.see0gan.space.vo.SP_AccountsInfoVO;
import com.see0gan.space.vo.SP_BasicInfoVO;
import com.see0gan.space.vo.SP_GuideInfoVO;
import com.see0gan.space.vo.SP_HostInfoVO;

public interface SpaceDAO {
	
	//part1
	//�뒪�봽留곸뿉�꽑 DAO�� xml�쓽 �뿰寃곗쓣 �쐞�빐�꽌 DAO�븿�닔紐�(basicInfo_Insert)怨� mybatis xml�뙆�씪�쓽 id媛믪씠 �씪移섑빐�빞 �븳�떎!!
		public int basicInfo_Insert(SP_BasicInfoVO bvo);

		public List<HostVO> hostInfo_Select(HostVO hostVO);

		public int hostInfo_Insert(SP_HostInfoVO hIVO);

		public List<SP_BasicInfoVO> spaceInfo_SelectQuery(SP_BasicInfoVO bvo);
		
		public List<SP_BasicInfoVO> spaceInfo_SelectAll(SP_BasicInfoVO bvo);

		public int basicInfoTag_Insert(SP_BasicInfoVO bvo);
	
	//part2
	public List<SP_HostInfoVO> hostInfo_Select(SP_HostInfoVO sp_hvo);
	public int guide_Insert(SP_GuideInfoVO sp_gvo); 
	public int dayoff_Insert(SP_GuideInfoVO sp_gvo);
	public int convenient_Insert(SP_GuideInfoVO sp_gvo);
	public int acuntsInfo_Insert(SP_AccountsInfoVO sp_avo);
	public List<SP_BasicInfoVO> spaceInfo_detail(SP_BasicInfoVO svo);
}