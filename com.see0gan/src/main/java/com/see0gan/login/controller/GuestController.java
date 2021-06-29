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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.see0gan.common.ChabunUtil;
import com.see0gan.common.service.ChabunService;
import com.see0gan.login.service.LoginService;
import com.see0gan.login.vo.GuestVO;
import com.see0gan.payment.vo.PaymentVO;

@Controller
@RequestMapping(value="/guest")
public class GuestController {
	
	private static final String CONTEXT_PATH = "login";
	private Logger logger = Logger.getLogger(GuestController.class);
	
	
	private LoginService loginService;
	private ChabunService chabunService;
	
	// 생성자에 @Autowired 어노테이션으로  DI (의존성 주입하기)
	@Autowired(required=false)
	public GuestController(LoginService loginService, ChabunService chabunService) {
		this.loginService = loginService;
		this.chabunService = chabunService;
	}
	
	@RequestMapping(value="/guestLogin", method=RequestMethod.GET)
	public String guestLogin() {
		
		return CONTEXT_PATH + "/guestLogin";
	}

	@RequestMapping(value="/loginCheck", method=RequestMethod.POST)
	public void loginCheck(GuestVO gvo, Model model, HttpServletRequest req, HttpServletResponse res) {
		
		logger.info("LoginController loginCheck >>> : ");
		logger.info("LoginController gvo email >>> : "+gvo.getTBU_EMAIL());
		logger.info("LoginController gvo pw >>> : "+gvo.getTBU_PASSWORD());
		
		logger.info("LoginController loginCheck HIT>>> : " + loginService.getAccess(gvo));
		
		List<GuestVO> alist = loginService.getAccess(gvo);
		HttpSession session = req.getSession(true);
		System.out.println(" page >>> : " + (String)session.getAttribute("backpage"));
		String backpage = (String)session.getAttribute("backpage");
		if(alist.size()==1) {
			
			GuestVO _gvo = (GuestVO) alist.get(0);
			logger.info("LoginController _gvo getTBU_EMAIL >>> : "+_gvo.getTBU_EMAIL());			
			logger.info("LoginController _gvo getTBU_PASSWORD >>> : "+_gvo.getTBU_PASSWORD());
			logger.info("LoginController _gvo getTBU_GUESTID >>> : "+_gvo.getTBU_GUESTID());
			logger.info("LoginController _gvo getTBU_NICKNAME >>> : "+_gvo.getTBU_NICKNAME());
			
			session.setAttribute("user", _gvo);
			if(backpage != null){
				System.out.println("go bakpage");
				try {
					res.sendRedirect(backpage);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			else {
				System.out.println("gohome");
				try {
					res.sendRedirect("/main.jsp");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		}
		else {
			try {
				res.sendRedirect("/test.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		return CONTEXT_PATH + "/guestJoin";
	}
	
	@RequestMapping(value="/memberInsert", method=RequestMethod.POST)
	public String memberInsert(GuestVO gvo) {
		
		logger.info("LoginController guestInsert >>> : ");
		logger.info("LoginController gvo email >>> : "+gvo.getTBU_EMAIL());
		logger.info("LoginController gvo phone >>> : "+gvo.getTBU_PASSWORD());
		

		String guestId = ChabunUtil.getGuestIdChabun(gvo.getTBU_EMAIL(), chabunService.getGuestIdChabun().getTBU_GUESTID());
		logger.info("guestId >>> : " + guestId);
		
		gvo.setTBU_GUESTID(guestId);
		logger.info(">>> : " + gvo.getTBU_GUESTID());
		
		
		int nCnt = loginService.memberInsert(gvo);
		
		logger.info("PaymentController paymentpaymentInsert >>> : " + nCnt + " data have been inserted successfully");
		
		
		return "/space/index_2";
	}
	
	@RequestMapping("guestUpdate")
	public String guestUpdate(@ModelAttribute GuestVO gvo, Model model, HttpServletRequest req, HttpServletResponse res) {
		logger.info("로그 테스트1 : " + gvo.getTBU_GUESTID());
		logger.info("로그 테스트2 : " + gvo.getTBU_NICKNAME());
		logger.info("로그 테스트3 : " + gvo.getTBU_PHONE());
		logger.info("로그 테스트4 : " + gvo.getTBU_PASSWORD());
		logger.info("로그 테스트5 : " + gvo.getTBU_EMAIL());
		loginService.guestUpdate(gvo);
		List<GuestVO> alist = loginService.getAccess(gvo);
		
		if(alist.size()==1) {
			
			GuestVO _gvo = (GuestVO) alist.get(0);
			logger.info("LoginController _gvo getTBU_EMAIL >>> : "+_gvo.getTBU_EMAIL());			
			logger.info("LoginController _gvo getTBU_PASSWORD >>> : "+_gvo.getTBU_PASSWORD());
			logger.info("LoginController _gvo getTBU_GUESTID >>> : "+_gvo.getTBU_GUESTID());
			logger.info("LoginController _gvo getTBU_NICKNAME >>> : "+_gvo.getTBU_NICKNAME());
			
			
			HttpSession session = req.getSession(true);
			
			session.setAttribute("user", _gvo);
			
			try {
				res.sendRedirect("/main.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return "/mypage/guestUpdate";
	}
	
	@RequestMapping("guestDelete")
	public String guestDelete(@ModelAttribute GuestVO gvo, Model model, HttpServletRequest req, HttpServletResponse res) {
		logger.info("로그 테스트1 : " + gvo.getTBU_GUESTID());
		logger.info("로그 테스트2 : " + gvo.getTBU_NICKNAME());
		logger.info("로그 테스트3 : " + gvo.getTBU_PHONE());
		logger.info("로그 테스트4 : " + gvo.getTBU_PASSWORD());
		logger.info("로그 테스트5 : " + gvo.getTBU_EMAIL());
		loginService.guestDelete(gvo);
		List<GuestVO> alist = loginService.getAccess(gvo);
		
		if(alist.size()==1) {
			
			GuestVO _gvo = (GuestVO) alist.get(0);
			logger.info("LoginController _gvo getTBU_EMAIL >>> : "+_gvo.getTBU_EMAIL());			
			logger.info("LoginController _gvo getTBU_PASSWORD >>> : "+_gvo.getTBU_PASSWORD());
			logger.info("LoginController _gvo getTBU_GUESTID >>> : "+_gvo.getTBU_GUESTID());
			logger.info("LoginController _gvo getTBU_NICKNAME >>> : "+_gvo.getTBU_NICKNAME());
			
			
			HttpSession session = req.getSession(true);
			
			session.setAttribute("user", _gvo);
			
			try {
				res.sendRedirect("/index.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return "/mypage/guestDelete";
	}
	@GetMapping("guest/pwInquiry")
	public String searchItem(@RequestParam("receiveMail") String receiver,
	                  Model model){

	 // item searchItem = itemService.search(index, page);
		logger.info("email sent "+receiver);
	
	  return null;
	}

	
	@RequestMapping(value="/pwInquiry", method=RequestMethod.GET)
	public String pwInquiry() {
		
		return CONTEXT_PATH + "/pwInquiry";
	}


	
	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin() {
		return CONTEXT_PATH + "/kakaoLogin";
	}
	
	@RequestMapping(value="/kakaoUser", method=RequestMethod.GET)
	public String kakaoUser() {
		return CONTEXT_PATH + "/kakaoUser";
	}
	
	@RequestMapping(value="/oauth", method=RequestMethod.GET)
	public String oauth() {
		return CONTEXT_PATH + "/oauth";
	}
	

	
	

}
