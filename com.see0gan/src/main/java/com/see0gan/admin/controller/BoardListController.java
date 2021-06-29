package com.see0gan.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.see0gan.admin.service.AdminService;
import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;
import com.see0gan.mypage.vo.MypageVO;

@Controller
@RequestMapping("/admin")
public class BoardListController {
	Logger logger = Logger.getLogger(MemberController.class);

	private AdminService adminService;
	private MypageVO mypagevo;


	@Autowired(required = false)
	public BoardListController(AdminService adminService, MypageVO mypagevo) {
		
		this.adminService = adminService;
		this.mypagevo = mypagevo;
	}

	@RequestMapping(value = "/boardList", method = {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView boardList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
	
		String path = "";
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		String _section = (String) request.getParameter("section"); 
		String _pageNum = (String) request.getParameter("pageNum");
		int section = Integer.parseInt(((_section == null) ? "1" : _section)); 
		int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));
		Map pagingMap = new HashMap();

		System.out.println("section : " + section);
		System.out.println("pageNum : " + pageNum);

	

		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);

		Map boardMap = adminService.oneSelectAllAdmin(pagingMap);
		boardMap.put("section", section);
		boardMap.put("pageNum", pageNum);
	
		mav.addObject("boardMap", boardMap); 
		mav.setViewName("/admin/boardList");
		
		return mav;

	}
	
	

}