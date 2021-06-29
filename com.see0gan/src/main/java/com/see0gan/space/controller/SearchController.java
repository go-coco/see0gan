package com.see0gan.space.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.see0gan.space.service.SpaceService;
import com.see0gan.space.vo.SP_BasicInfoVO;

@RestController
public class SearchController {
	
	Logger logger = Logger.getLogger(SearchController.class);

	private static final String CONTEXT_PATH = "search";
	private SpaceService spaceService;

	@Autowired(required = false)
	public SearchController(SpaceService spaceService) {
		this.spaceService = spaceService;

	}
	
	 @GetMapping("/search")
	public ModelAndView serachList(@RequestParam("q") String q) {

		logger.info(q);
		SP_BasicInfoVO svo = new SP_BasicInfoVO();
		svo.setTbsp_type(q);
		List<SP_BasicInfoVO> list = spaceService.spaceInfo_SelectQuery(svo);
		System.out.println("Controller service ���� >>> ");
		if(list.size() > 0) System.out.println("����Ʈ ����");
		else System.out.println("����Ʈ ����");
		ModelAndView mav = new ModelAndView();
		mav.addObject("SpaceList", list);
		mav.setViewName("search/result");
		return mav;

	}
	
	@RequestMapping(value="space_select", method=RequestMethod.GET)
	public ModelAndView list_bok(@ModelAttribute SP_BasicInfoVO svo) {

		logger.info(svo.getTbsp_type());
		List<SP_BasicInfoVO> list = spaceService.spaceInfo_SelectAll(svo);
		System.out.println("list size >>> " + list.size());
		System.out.println("Controller service ���� >>> ");
		if(list.size() > 0) System.out.println("공간있음");
		else System.out.println("공간 없음");
		
		logger.info("list.size() >>> : " + list.size());
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("SpaceList", list);
		mav.setViewName("space/index_2");
		return mav;

	}
	
	@RequestMapping("/space_detail")
	public ModelAndView selectAuction(@ModelAttribute SP_BasicInfoVO svo) {

		System.out.println("space_detail? svo.getTbsp_num() >>> : " + svo.getTbsp_num());
		List<SP_BasicInfoVO> list = spaceService.spaceInfo_detail(svo);
		logger.info("SearchController SP_BasicInfo List >>> : "+list);
		
		ModelAndView mav = new ModelAndView();
		
		if(list!=null&&list.size()>0) {
		
		mav.addObject("Spacedetail",list);
		
		}
		
		
		mav.setViewName("/space/space_detail");
		return mav;
		
	}

}
