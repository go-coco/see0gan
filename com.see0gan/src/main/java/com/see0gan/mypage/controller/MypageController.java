package com.see0gan.mypage.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;
import com.see0gan.mypage.service.MypageService;
import com.see0gan.mypage.vo.MypageVO;
import com.see0gan.space.vo.SP_AccountsInfoVO;

@Controller
public class MypageController {
	
	Logger logger = Logger.getLogger(MypageController.class);
	
	private MypageService mypageService;
	
	// 생성자 Autowired 
	@Autowired(required=false)
	public MypageController( MypageService mypageService) {
		this.mypageService = mypageService;
	}
	
	@RequestMapping("/myinfo")
	public ModelAndView memberUpdate(@ModelAttribute GuestVO gvo, @ModelAttribute HostVO hvo,HttpServletRequest req) {
		System.out.println("받아온 게스트 아이디>>> : " + gvo.getTBU_GUESTID());
		HttpSession httpSession = req.getSession(true);
		gvo = (GuestVO) httpSession.getAttribute("user");
		hvo = (HostVO) httpSession.getAttribute("HostVO");
		ModelAndView mav = new ModelAndView();
		if(gvo != null) {
			mav.setViewName("mypage/guestmyinfo");
		}
		else if(hvo != null) {
			mav.setViewName("mypage/hostmyinfo");
		}
		else {
			mav.setViewName("mypage/profilefail");
		}
		return mav;
	}
	@RequestMapping(value="/logOut", method=RequestMethod.GET)
	public String guestLogin(HttpServletRequest req, HttpServletResponse res) {
		HttpSession httpSession = req.getSession(true);
		httpSession.invalidate();

		return "mypage/logout";
	}
	
	// 마이페이지 메인으로 이동
		@RequestMapping("mypage")
		public String mypage() {
			
			return "mypage/mypage";
		}
		
		// 호스트 메인페이지로 이동
		@RequestMapping("mainHost")
		public String mainHost() {
			return "main/mainHost";
		}
		
		// 리뷰, Q&A 테스트 페이지로 이동
		@RequestMapping("spaceSample")
		public ModelAndView spaceSample(@ModelAttribute MypageVO mpvo) {
			logger.info("spaceSample VO test rvspnum >>> : " + mpvo.getRvspnum());
			logger.info("spaceSample VO test qspnum >>> : " + mpvo.getQspnum());
			
			ModelAndView mav = new ModelAndView();
			
			if(mpvo!=null) {
				mav.addObject("mpvo", mpvo);
				mav.setViewName("spaceSample");
				
				return mav;
			}
			mav.setViewName("/index");
			return mav;
		}
		
		// 1:1 문의 페이지로 이동
		@RequestMapping("one")
		public String one() {
			return "one";
		}
}