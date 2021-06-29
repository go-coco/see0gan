package com.see0gan.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.see0gan.admin.service.AdminService;

import com.see0gan.payment.vo.PaymentVO;

@Controller
@RequestMapping(value = "/admin")
public class OderListController {
	
	Logger logger = Logger.getLogger(OderListController.class);

	private AdminService adminService;
	private PaymentVO paymentvo;

	@Autowired(required = false)
	public OderListController(AdminService adminService, PaymentVO paymentvo) {
		
		this.adminService = adminService;
		this.paymentvo = paymentvo;
	}
	
	@RequestMapping(value = "/oderList", method = {RequestMethod.GET, RequestMethod.POST}) 
	public ModelAndView oderList(HttpServletRequest request, HttpServletResponse response,
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

		System.out.println("keyfilter : "+keyfilter);

		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);
		pagingMap.put("keyword", keyfilter);

		Map paymentMap = adminService.paymentSelectAllAdmin(pagingMap);
		paymentMap.put("section", section);
		paymentMap.put("pageNum", pageNum);
		paymentMap.put("keyword", keyfilter);
		mav.addObject("paymentMap", paymentMap); 
		mav.setViewName("/admin/oderList");
		
		return mav;

	}
	
	@RequestMapping(value="paymentsearch", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView paymentsearch(Model model,@RequestParam(value="keyfilter", required=false) String keyfilter,
			@RequestParam(value="change_payment_status", required=false) String change_payment_status,
			@RequestParam(value="change_tbsp_pay_num", required=false) String change_tbsp_pay_num,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="paymentstate", required=false) String paymentstate) {	
		logger.info("BoardController searchMember 함수 진입 >>> :");		
	
		
		Map<String, Object> selectMap = new HashMap();
		ModelAndView mav=new ModelAndView();
			
		System.out.println("change_payment_status :"+change_payment_status);
		System.out.println("change_tbsp_pay_num :"+change_tbsp_pay_num);
		
	
		
		selectMap.put("change_payment_status", change_payment_status);
		selectMap.put("change_tbsp_pay_num",change_tbsp_pay_num);
		selectMap.put("paymentstate",paymentstate);
		selectMap.put("keyword",keyword);
		selectMap.put("keyfilter",keyfilter);
		
		if(change_payment_status !=null) {			
			adminService.paymentUpdateAdmin(selectMap);
		}

		System.out.println("keyfilter : "+ keyfilter);
		System.out.println("keyword : "+ keyword);
		System.out.println("paymentstate>>"+ paymentstate);
		System.out.println("change_tbsp_pay_num : "+ change_tbsp_pay_num);
		System.out.println("change_payment_status>>"+ change_payment_status);
		List<PaymentVO> paymentMap = adminService.paymentSelectAdmin(selectMap);
		logger.info("paymentController paymentsearch paymentMap.size() >>> : " + paymentMap.size());
		
		
		mav.addObject("paymentMap",paymentMap);
		mav.addObject("selectMap",selectMap);
		mav.addObject("keyword",keyword);
		mav.addObject("paymentstate",paymentstate);
	
		if(paymentMap == null || paymentMap.isEmpty() == true ) {
			System.out.println("controller paymentsearch //null ");
	        model.addAttribute("msg", "검색정보가 일치하지않습니다. 다시 검색해주시길 바랍니다."); 
		}
		mav.setViewName("admin/paymentsearch");
		System.out.println("paymentsearch mav " + mav);
		return mav;		
	
	}
	@RequestMapping(value="paymentupdate", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView paymentupdate(Model model,@RequestParam(value="keyfilter", required=false) String keyfilter,
			@RequestParam(value="change_payment_status", required=false) String change_payment_status,
			@RequestParam(value="change_tbsp_pay_num", required=false) String change_tbsp_pay_num,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="paymentstate", required=false) String paymentstate) {	
		logger.info("BoardController paymentupdate 함수 진입 >>> :");		
	
		
		Map<String, Object> selectMap = new HashMap();
		ModelAndView mav=new ModelAndView();
		
		
		
		//paymentupdate/change_payment_status :state2
		//paymentupdate//change_tbsp_pay_num :P0007
		System.out.println("paymentupdate/change_payment_status :"+change_payment_status);
		System.out.println("paymentupdate//change_tbsp_pay_num :"+change_tbsp_pay_num);
		
		
		
		selectMap.put("change_payment_status", change_payment_status);
		selectMap.put("change_tbsp_pay_num",change_tbsp_pay_num);
		selectMap.put("paymentstate",paymentstate);
		adminService.paymentUpdateAdmin(selectMap);

		System.out.println("paymentupdate/keyfilter : "+ keyfilter);
		System.out.println("paymentupdate/keyword : "+ keyword);
		System.out.println("paymentupdate/paymentstate>>"+ paymentstate);
		System.out.println("change_tbsp_pay_num : "+ change_tbsp_pay_num);
		System.out.println("change_payment_status>>"+ change_payment_status);
	
		mav.addObject("selectMap",selectMap);
	
		mav.addObject("paymentstate",paymentstate);
	
		
		mav.setViewName("admin/paymentsearch");
		System.out.println("paymentsearch mav " + mav);
		return mav;		
	
	}

}