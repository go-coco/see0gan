package com.see0gan.login.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.see0gan.common.ChabunUtil;
import com.see0gan.common.service.ChabunService;
import com.see0gan.login.service.LoginService;
import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;

@Controller
@RequestMapping(value="/host")
public class HostController {
	
	private static final String CONTEXT_PATH = "login";
	private Logger logger = Logger.getLogger(HostController.class);
	
	
	private LoginService loginService;
	private ChabunService chabunService;

	// 占쏙옙占쏙옙占쌘울옙 @Autowired 占쏙옙占쏙옙占쏙옙抉占쏙옙占쏙옙占�  DI (占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹깍옙)
		@Autowired(required=false)
		public HostController(LoginService loginService, ChabunService chabunService) {
			this.loginService = loginService;
			this.chabunService = chabunService;
		}
	
	
	@RequestMapping(value="/hostCenter", method=RequestMethod.GET)
	public String hostCenter() {
		return CONTEXT_PATH + "/hostCenter";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		return CONTEXT_PATH + "/hostJoin";
	}
	
	@RequestMapping(value="/memberInsert", method=RequestMethod.POST)
	public String memberInsert(HostVO hvo) {
		
		logger.info("Login hostInsert >>> : ");
		logger.info("LoginController hvo email >>> : "+hvo.getTBH_EMAIL());
		logger.info("LoginController hvo phone >>> : "+hvo.getTBH_PHONE());
		logger.info("LoginController hvo phone >>> : "+chabunService.getHostNumChabun().getTBH_NUM());

		String hostId = ChabunUtil.getHostNumChabun(hvo.getTBH_EMAIL(), chabunService.getHostNumChabun().getTBH_NUM());
		logger.info("guestId >>> : " + hostId);

		hvo.setTBH_NUM(hostId);
		
		int nCnt = loginService.memberInsert(hvo);
		
		logger.info("HostController memberInsert(host) >>> : " + nCnt + " data successfully inserted");
		
		
		return CONTEXT_PATH + "/hostCenter";
	}
	
	@RequestMapping(value="/hostLogin", method=RequestMethod.GET)
	public String guestLogin() {
		
		return CONTEXT_PATH + "/hostLogin";
	}

	@RequestMapping(value="/loginCheck", method=RequestMethod.POST)
	public String loginCheck(HostVO hvo, Model model, HttpServletRequest req, HttpServletResponse res) {
		
		logger.info("LoginController loginCheck >>> : ");
		logger.info("LoginController gvo email >>> : "+hvo.getTBH_EMAIL());
		logger.info("LoginController gvo pw >>> : "+hvo.getTBH_PASSWORD());
		
		logger.info("LoginController loginCheck HIT>>> : " + loginService.getAccess(hvo));
		
		List<HostVO> alist = loginService.getAccess(hvo);
		if(alist.size()==1) {
		HostVO _hvo = (HostVO) alist.get(0);
		logger.info("LoginController _gvo getTBU_EMAIL >>> : "+_hvo.getTBH_EMAIL());			
		logger.info("LoginController _gvo getTBU_PASSWORD >>> : "+_hvo.getTBH_PASSWORD());
		logger.info("LoginController _gvo getTBU_GUESTID >>> : "+_hvo.getTBH_NUM());
		logger.info("LoginController _gvo getTBU_NICKNAME >>> : "+_hvo.getTBH_NICKNAME());
		HttpSession session = req.getSession(true);
		session.setAttribute("HostVO", _hvo);
		

			logger.info(">> HostController sending hostCenter page");
			return CONTEXT_PATH + "/hostCenter";
			
		
	} else		logger.info(">> HostController login failed ");
	
		return CONTEXT_PATH + "/main";

	
}
	
	@RequestMapping("hostUpdate")
	public String hostUpdate(@ModelAttribute HostVO hvo, Model model, HttpServletRequest req, HttpServletResponse res) {
		logger.info("로그 테스트1 : " + hvo.getTBH_NUM());
		logger.info("로그 테스트2 : " + hvo.getTBH_NICKNAME());
		logger.info("로그 테스트3 : " + hvo.getTBH_PHONE());
		logger.info("로그 테스트4 : " + hvo.getTBH_PASSWORD());
		logger.info("로그 테스트5 : " + hvo.getTBH_EMAIL());
		loginService.hostUpdate(hvo);
		List<HostVO> alist = loginService.getAccess(hvo);
		
		if(alist.size()==1) {
			
			HostVO _hvo = (HostVO) alist.get(0);
			logger.info("LoginController _hvo.getTBH_EMAIL >>> : "+_hvo.getTBH_EMAIL());			
			logger.info("LoginController _hvo.getTBH_PASSWORD >>> : "+_hvo.getTBH_PASSWORD());
			logger.info("LoginController_hvo.getTBH_NUM >>> : "+_hvo.getTBH_NUM());
			logger.info("LoginController _hvo.getTBH_NICKNAME >>> : "+_hvo.getTBH_NICKNAME());
			
			
			HttpSession session = req.getSession(true);
			
			session.setAttribute("HostVO", _hvo);
			
			try {
				res.sendRedirect("/main.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return "/mypage/hostUpdate";
	}
	
	@RequestMapping("hostDelete")
	public String guestDelete(@ModelAttribute HostVO hvo, Model model, HttpServletRequest req, HttpServletResponse res) {
		logger.info("로그 테스트1 : " + hvo.getTBH_NUM());
		logger.info("로그 테스트2 : " + hvo.getTBH_NICKNAME());
		logger.info("로그 테스트3 : " + hvo.getTBH_PHONE());
		logger.info("로그 테스트4 : " + hvo.getTBH_PASSWORD());
		logger.info("로그 테스트5 : " + hvo.getTBH_EMAIL());
		loginService.hostDelete(hvo);
		List<HostVO> alist = loginService.getAccess(hvo);
		
		if(alist.size()==1) {
			
			HostVO _hvo = (HostVO) alist.get(0);
			logger.info("LoginController _hvo.getTBH_EMAIL >>> : "+_hvo.getTBH_EMAIL());			
			logger.info("LoginController _hvo.getTBH_PASSWORD >>> : "+_hvo.getTBH_PASSWORD());
			logger.info("LoginController _hvo.getTBH_NUM >>> : "+_hvo.getTBH_NUM());
			logger.info("LoginController _hvo.getTBH_NICKNAME >>> : "+_hvo.getTBH_NICKNAME());
			
			
			HttpSession session = req.getSession(true);
			
			session.setAttribute("HostVO", _hvo);
			
			try {
				res.sendRedirect("/index.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return "/mypage/hostDelete";
	}
	
	@RequestMapping(value="/pwInquiry", method=RequestMethod.GET)
	public String pwInquiry() {
		
		return CONTEXT_PATH + "/pwInquiry";
	}


}
