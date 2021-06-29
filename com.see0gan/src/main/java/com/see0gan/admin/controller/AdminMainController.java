package com.see0gan.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.see0gan.admin.service.AdminService;
import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;

@Controller
@RequestMapping("/admin")
public class AdminMainController {
	
	private AdminService adminService;
	
	@Autowired(required = false)
	public AdminMainController(AdminService adminService, HostVO hostvo, GuestVO guestvo) {
		
		this.adminService = adminService;
	
	}
	
	@RequestMapping(value="/mainForm" , method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mainForm (HttpServletRequest request, HttpServletResponse response) {
		System.out.println("adminMain start!!!!!!!!!!!");
		Map pagingMap = new HashMap();
		int newguestCnt = 0;
		int newhostCnt = 0;
		int todaytotal =0;
		ModelAndView mav=new ModelAndView();

		Map membersMap = adminService.guestSelectAll(pagingMap);
		newguestCnt = adminService.newGuestcnt();
		newhostCnt = adminService.newHostcnt();
		System.out.println("adminMain start//newguestCnt>>>" + newguestCnt);
		List<Integer> totalMoney = adminService.todayTotalPay();		
		for( Integer iter : totalMoney)
		{
			todaytotal =+ iter;
		}		
		System.out.println("adminMain start//todaytotal>>>" + todaytotal);
		mav.addObject("newguestCnt", newguestCnt);
		mav.addObject("newhostCnt", newhostCnt);
		mav.addObject("membersMap", membersMap);
		mav.addObject("todaytotal", todaytotal);
		mav.setViewName("/admin/mainForm");
		return mav;
		
	}
	
	@RequestMapping(value="/see0ganMain" , method = {RequestMethod.GET, RequestMethod.POST})
	public String see0ganMain(){
		return "index_2";
	
	}
	

}
