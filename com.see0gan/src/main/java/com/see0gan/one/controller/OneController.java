package com.see0gan.one.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.see0gan.common.service.ChabunService;
import com.see0gan.common.ChabunUtil;
import com.see0gan.mypage.vo.MypageVO;
import com.see0gan.one.service.OneService;

@Controller
public class OneController {
	
	Logger logger = Logger.getLogger(OneController.class);
	
	private OneService oneService;
	private ChabunService chabunService;
	
	// 생성자 Autowired
	@Autowired(required=false)	
	public OneController( OneService oneService
			               ,ChabunService chabunService) {
		this.oneService = oneService;
		this.chabunService = chabunService;
	}
	
	// 문의 : 전체조회
	@RequestMapping(value="oneSelectAll", method=RequestMethod.GET)
	public String oneSelectAll(MypageVO mpvo, Model model) {
		logger.info("OneController OneSelectAll start >>> :");
		
		List<MypageVO> listAll = oneService.oneSelectAll(mpvo);
		logger.info("OneController OneSelectAll listS.size >>> : " + listAll.size());
		
		if(listAll.size() != 0) {
			
			model.addAttribute("listAll", listAll);
			model.addAttribute("mpvo", mpvo);
			
			return "one/oneSelectAll";
			
		}

		return "one/oneEmpty";
	}
	
	// 문의 : 유저별 전체조회
	@RequestMapping(value="oneSelectAllU", method=RequestMethod.GET)
	public String oneSelectAllU(MypageVO mpvo, Model model) {
		logger.info("OneController OneSelectAllU start >>> :");
		
		List<MypageVO> listAll = oneService.oneSelectAllU(mpvo);
		logger.info("OneController OneSelectAllU listS.size >>> : " + listAll.size());
		
		model.addAttribute("listAll", listAll);
		model.addAttribute("mpvo", mpvo);
		
		return "one/oneSelectAllU";
			
	}
	
	// 문의 입력 폼
	@RequestMapping(value="oneForm", method=RequestMethod.GET)
	public String boardForm() {
		return "one/oneForm";
	}
	
	// 문의 등록 (Insert)
	@RequestMapping(value = "oneInsert", method = RequestMethod.POST)
	public ModelAndView oneInsert(MypageVO mpvo, HttpServletRequest request) {
		
		logger.info("oneInsert >>> : 시작 ");
		
		// 채번 구하기
		String onenum = ChabunUtil.getOneChabun("D", chabunService.getOneChabun().getOnenum());
		logger.info("OneController oneInsert onenum >>> : " + onenum);
		
		mpvo.setOnenum(onenum);
		
		int nCnt = oneService.oneInsert(mpvo);
		logger.info("OneController OneInsert nCnt >>> : " + nCnt);

		ModelAndView mav = new ModelAndView();
		
		if(nCnt > 0) {
			mav.addObject("onemnum", mpvo.getOnemnum());
			logger.info("OneController OneInsert onemnum >>> : " + mpvo.getOnemnum());
			mav.setViewName("one/oneInsert");
			
			return mav;
		}
		
		mav.setViewName("one/oneForm");
		
		return mav;
	}
	
	// 문의 셀렉트 (Select)
	@RequestMapping(value="oneSelect",method=RequestMethod.GET)
	public String OneSelect(MypageVO mpvo, Model model) {

		logger.info("OneController OneSelect start >>> : ");
		logger.info("OneController OneSelect mpvo.getOnenum() " + mpvo.getOnenum());

		List<MypageVO> listS = oneService.oneSelect(mpvo);
		logger.info("OneController oneSelect listS.size >>>:: " + listS.size());


		if(listS.size() > 0) {
			model.addAttribute("listS", listS);
			return "one/oneSelect";
		}

		return "one/oneSelectAll";

	}
	
	// 문의 수정 폼
	@RequestMapping(value="oneUpdateForm",method=RequestMethod.POST)
	public String OneUpdate(MypageVO mpvo ,Model model) {
		logger.info("OneController oneUpdateForm start >> ");

		List<MypageVO> listS = oneService.oneSelect(mpvo);
		
		model.addAttribute("listS", listS);

			return "one/oneUpdateForm";
	}
	
	// 문의 수정(Update)
	@RequestMapping(value="oneUpdate", method=RequestMethod.POST)
	public ModelAndView oneUpdate(MypageVO mpvo, HttpServletRequest request) {		
		logger.info("OneController oneUpdate mpvo.getOnenum() >>> : " + mpvo.getOnemnum());
		
		int nCnt = 0;
		
		logger.info("mpvo >>> : " + mpvo.toString());
		
		nCnt = oneService.oneUpdate(mpvo);
		logger.info("onedUpdate nCnt >>> : " + nCnt);
		
		ModelAndView mav = new ModelAndView();
		
		if(nCnt > 0) {
			mav.addObject("onemnum", mpvo.getOnemnum());
			logger.info("onedUpdate onemnum >>> : " + mpvo.getOnemnum());
			mav.setViewName("one/oneUpdate");
			
			return mav;
		}
		mav.addObject("onemnum", mpvo.getOnemnum());
		mav.setViewName("one/oneSelectAllU");
		
		return mav;
	}
	
	// 문의 삭제(Delete)
	@RequestMapping(value="oneDelete", method=RequestMethod.POST)
	public ModelAndView oneDelete(MypageVO mpvo, HttpServletRequest request) {		
		
		String onemnum =  mpvo.getOnemnum();
		logger.info("onemnum >>> : " + onemnum);
		logger.info("OneController oneDelete mpvo.getOnenum() >>> : " + mpvo.getOnenum());
		ModelAndView mav = new ModelAndView();
		mav.addObject("onemnum", onemnum);
		logger.info("onedDelete mpvo.getOnemnum() >>> : " + mpvo.getOnemnum());
		
		int nCnt = 0;
		
		logger.info("mpvo >>> : " + mpvo.toString());
		
		nCnt = oneService.oneDelete(mpvo);
		logger.info("onedDelete nCnt >>> : " + nCnt);
		
		
		
		
		if(nCnt > 0) {
			mav.setViewName("one/oneDelete");
			
			return mav;
		}
		mav.setViewName("one/oneSelectAllU");
		
		return mav;
	}
}
