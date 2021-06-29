package com.see0gan.payment.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import com.see0gan.booking.vo.BookingVO;
import com.see0gan.common.ChabunUtil;
import com.see0gan.common.service.ChabunService;
import com.see0gan.payment.service.PaymentService;
import com.see0gan.payment.vo.PaymentVO;

@Controller
@RequestMapping(value="/payment")
public class PaymentController {
	Logger logger = Logger.getLogger(PaymentController.class);
	
	private static final String CONTEXT_PATH = "payment";
	
	private PaymentService paymentService;
	private ChabunService chabunService;
	
	@Autowired(required=false)
	public PaymentController(PaymentService paymentService
							,ChabunService chabunService) {
		this.paymentService = paymentService;
		this.chabunService = chabunService;
	}
	
	@RequestMapping(value="/payment", method=RequestMethod.POST)
	public String payment(BookingVO bkvo, Model model, HttpServletRequest request) {
		logger.info("PaymentController payment >>> : ");
		
		model.addAttribute("listBooking",bkvo.getGetBookingVOList());
		
		System.out.println();
		return CONTEXT_PATH + "/payment";
	}
	
	// 결제 정보 등록
	@RequestMapping(value="/paymentInsert", method=RequestMethod.POST)
	public String paymentInsert(PaymentVO pvo) {
		logger.info("PaymentController paymentpaymentInsert >>> : ");
		
		// 채번 구하기
		String tbsp_pay_num = ChabunUtil.getPaymentChabun("P", chabunService.getPaymentChabun().getTbsp_pay_num());
		logger.info("paynum >>> : " + tbsp_pay_num);
		pvo.setTbsp_pay_num(tbsp_pay_num);
		
		logger.info("tbsp_pay_num >>> : " + tbsp_pay_num);
		logger.info("tbsp_pay_amount >>> : " + pvo.getTbsp_pay_amount());
		logger.info("tbsp_pay_method >>> : " + pvo.getTbsp_pay_method());
		logger.info("tbsp_pay_status >>> : " + pvo.getTbsp_pay_status());
		logger.info("tbu_name >>> : " + pvo.getTbu_name());
		logger.info("tbu_phone >>> : " + pvo.getTbu_phone());
		
		int nCnt = paymentService.paymentInsert(pvo);
		
		logger.info("PaymentController paymentpaymentInsert >>> : " + nCnt + "건 입력 되었습니다.");
		
		return CONTEXT_PATH + "/payment_finish";
		
	}
	
	// 결제 완료페이지
	@RequestMapping(value="/payment_finish", method=RequestMethod.GET)
	public String payment_finish() {
		logger.info("PaymentController payment >>> : ");
		return CONTEXT_PATH + "/payment_finish";
	}
	
	
	@RequestMapping(value="/paymentSelect", method=RequestMethod.GET)
	public String paymentshow() {
		logger.info("PaymentController payment >>> : ");
		
		return CONTEXT_PATH + "/paymentSelect";
	}
	
	@RequestMapping(value="/paymentSelectShow", method=RequestMethod.GET)
	public String paymentSelect(PaymentVO pvo, Model model, HttpServletRequest request) {
		logger.info("PaymentController paymentSelect >>> : ");
		
		logger.info("getTbu_name >>> : " + pvo.getTbu_name());
		
		List<PaymentVO> listS = paymentService.paymentSelect(pvo);
		logger.info("PaymentController paymentSelect listS.size() >>> : " + listS.size());
		
		
		model.addAttribute("listS",listS);
		
		
		return CONTEXT_PATH + "/paymentSelectShow";
	}
	 
}
