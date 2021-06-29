package com.see0gan.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.HttpServletBean;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.see0gan.admin.service.AdminService;
import com.see0gan.booking.vo.BookingVO;
import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/admin")
public class MemberController {
	Logger logger = Logger.getLogger(MemberController.class);

	private AdminService adminService;
	private HostVO hostvo;
	private GuestVO guestvo;

	@Autowired(required = false)
	public MemberController(AdminService adminService, HostVO hostvo, GuestVO guestvo) {
		
		this.adminService = adminService;
		this.hostvo = hostvo;
		this.guestvo = guestvo;
	}

	@RequestMapping(value = "/gu_listmembers", method = {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="keyfilter", required=false) String keyfilter) {
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
		System.out.println("total : " + (String)request.getParameter("total"));
		System.out.println("guestvo.getTBU_GUESTID() : " + guestvo.getTBU_GUESTID());
		
		

		 System.out.println("keyfilter : "+keyfilter);

		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("keyword", keyfilter);

		Map membersMap = adminService.guestSelectAll(pagingMap);
		membersMap.put("section", section);
		membersMap.put("pageNum", pageNum);
		membersMap.put("keyword", keyfilter);
		mav.addObject("membersMap", membersMap); 
		mav.setViewName(viewName);
		
		return mav;

	}
	
	@RequestMapping(value = "/host_listmembers", method = {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView host_listmembers(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="keyfilter", required=false) String keyfilter) {
		HttpSession session = request.getSession();
		System.out.println("host_listmembers :함수진입 ");


		String path = "";
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		String _section = (String) request.getParameter("section"); 
		String _pageNum = (String) request.getParameter("pageNum");
		int section = Integer.parseInt(((_section == null) ? "1" : _section)); 
		int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));
		Map pagingMap = new HashMap();

		System.out.println("host_listmembers/section : " + section);
		System.out.println("host_listmembers/pageNum : " + pageNum);
		System.out.println("host_listmembers/total : " + (String)request.getParameter("total"));
		

		 System.out.println("keyfilter : "+keyfilter);

		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("keyword", keyfilter);

		Map membersMap = adminService.hostSelectAll(pagingMap);

		membersMap.put("section", section);
		membersMap.put("pageNum", pageNum);
		membersMap.put("keyword", keyfilter);
		mav.addObject("membersMap", membersMap); 
		mav.setViewName("admin/host_listmembers");
		
		return mav;

	}
	

	
	@RequestMapping(value="searchMember", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView searchMember(Model model,@RequestParam(value="keyfilter", required=false) String keyfilter,
			@RequestParam(value="keyword", required=false) String keyword) {	
		logger.info("BoardController searchMember 함수 진입 >>> :");		
	
		
		Map<String, Object> selectMap = new HashMap();
		ModelAndView mav=new ModelAndView();
		selectMap.put("keyfilter", keyfilter);
		selectMap.put("keyword",keyword);

		System.out.println("keyfilter : "+ keyfilter);
		System.out.println("keyword : "+ keyword);
		List<GuestVO> membersMap = adminService.guestSelectadmin(selectMap);
		logger.info("BoardController searchMember membersMap.size() >>> : " + membersMap.size());
		
		mav.addObject("membersMap",membersMap);
		mav.addObject("keyfilter",keyfilter);
		mav.addObject("keyword",keyword);
		
		if(membersMap == null || membersMap.isEmpty() == true ) {
			System.out.println("controller searchMember //null ");
	        model.addAttribute("msg", "검색정보가 일치하지않습니다. 다시 검색해주시길 바랍니다."); 
		}
		else { 
		
		mav.setViewName("admin/searchMember");
		System.out.println("deleteId:setViewName mav " + mav);
		}
		return mav;		
	
	}

	@RequestMapping(value="/deleteMember" ,  method = {RequestMethod.GET, RequestMethod.POST})
	public  String  deleteMember(HttpSession  session, GuestVO gvo, HttpServletRequest request) {
		
		Map<String, Object> deleteMap = new HashMap();
		ModelAndView mav=new ModelAndView();			
		String deleteId = request.getParameter("deleteId");
		deleteMap.put("deleteId", deleteId);
		adminService.guestDeleteAdmin(deleteMap);		
		
		System.out.println("deleteId: "+ deleteId);
	
		
      return "/admin/searchMember";	

	}
}
