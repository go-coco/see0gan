package com.see0gan.booking.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.see0gan.booking.service.BookingService;
import com.see0gan.booking.vo.BookingVO;
import com.see0gan.common.ChabunUtil;
import com.see0gan.common.service.ChabunService;
import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;
import com.see0gan.payment.vo.PaymentVO;

@Controller
@RequestMapping(value="/booking", method=RequestMethod.GET)
public class BookingController {
	
	Logger logger = Logger.getLogger(BookingController.class);
	private static final String CONTEXT_PATH = "booking";
	
	private BookingService bookingService;
	private ChabunService chabunService;
	
	@Autowired(required=false)
	public BookingController(BookingService bookingService
							,ChabunService chabunService) {
		this.bookingService = bookingService;
		this.chabunService = chabunService;
	}
	
	//공간정보 조회
	@RequestMapping(value="/booking", method=RequestMethod.POST)
	public String spaceSelect(BookingVO bkvo, Model model, HttpServletRequest req) {
	logger.info("BookingController spaceSelect 함수 진입 >>> : ");
		logger.info("BookingController spaceSelect bkvo.getTbsp_num >>> : " + req.getParameter("tbsp_num"));
		
		bkvo.setTbsp_num(req.getParameter("tbsp_num"));
		logger.info("tbsp_num >>> : " + bkvo.getTbsp_num());
		List<BookingVO> listS = bookingService.spaceSelect(bkvo);
		
		logger.info("BookingController spaceSelect listS.size() >>> : " + listS.size());
		
		
		model.addAttribute("listS",listS);
		return CONTEXT_PATH + "/bookingSelect";
	}
	
	// 예약시간 조회
		@RequestMapping(value="/boktime", method=RequestMethod.POST)
		@ResponseBody
		public HashMap<String, Object> timeSelect(BookingVO bkvo, HttpServletRequest req) {
			logger.info("BookingController timeSelect >>> : ");
			HashMap<String, Object> result = new HashMap <String,Object>();
			
			bkvo.setTbsp_num(req.getParameter("tbsp_num"));
			bkvo.setTbsp_bok_date(req.getParameter("tbsp_bok_date"));
			List<BookingVO> listS = bookingService.timeSelect(bkvo);
			
			logger.info("BookingController timeSelect listS.size() >>> : " + listS.size());
			
			result.put("data", listS);
			return result;
		}
		
		// 예약시간 조회
		@RequestMapping(value="/bokHostSelect", method=RequestMethod.POST)
		public String bokHostSelect(BookingVO bkvo, Model model, HttpServletRequest req) {
			logger.info("BookingController hostSelect >>> : ");
			
			System.out.println("getBook01() >>> " + bkvo.getGetBookingVOList().get(0).getBook01());
			System.out.println("getBook02() >>> " + bkvo.getGetBookingVOList().get(0).getBook02());
			System.out.println("getBook03() >>> " + bkvo.getGetBookingVOList().get(0).getBook03());
			System.out.println("getBook04() >>> " + bkvo.getGetBookingVOList().get(0).getBook04());
			System.out.println("getBook05() >>> " + bkvo.getGetBookingVOList().get(0).getBook05());
			System.out.println("getBook06() >>> " + bkvo.getGetBookingVOList().get(0).getBook06());
			System.out.println("getBook07() >>> " + bkvo.getGetBookingVOList().get(0).getBook07());
			System.out.println("getBook08() >>> " + bkvo.getGetBookingVOList().get(0).getBook08());
			System.out.println("getBook09() >>> " + bkvo.getGetBookingVOList().get(0).getBook09());
			System.out.println("getBook10() >>> " + bkvo.getGetBookingVOList().get(0).getBook10());
			System.out.println("getBook11() >>> " + bkvo.getGetBookingVOList().get(0).getBook11());
			System.out.println("getBook12() >>> " + bkvo.getGetBookingVOList().get(0).getBook12());
			System.out.println("getBook13() >>> " + bkvo.getGetBookingVOList().get(0).getBook13());
			System.out.println("getBook14() >>> " + bkvo.getGetBookingVOList().get(0).getBook14());
			System.out.println("getBook15() >>> " + bkvo.getGetBookingVOList().get(0).getBook15());
			System.out.println("getBook16() >>> " + bkvo.getGetBookingVOList().get(0).getBook16());
			System.out.println("getBook17() >>> " + bkvo.getGetBookingVOList().get(0).getBook17());
			System.out.println("getBook18() >>> " + bkvo.getGetBookingVOList().get(0).getBook18());
			System.out.println("getBook19() >>> " + bkvo.getGetBookingVOList().get(0).getBook19());
			System.out.println("getBook20() >>> " + bkvo.getGetBookingVOList().get(0).getBook20());
			System.out.println("getBook21() >>> " + bkvo.getGetBookingVOList().get(0).getBook21());
			System.out.println("getBook22() >>> " + bkvo.getGetBookingVOList().get(0).getBook22());
			System.out.println("getBook23() >>> " + bkvo.getGetBookingVOList().get(0).getBook23());
			System.out.println("getBook24() >>> " + bkvo.getGetBookingVOList().get(0).getBook24());
			System.out.println("getTbsp_bok_date() >>> " + bkvo.getGetBookingVOList().get(0).getTbsp_bok_date());
			System.out.println("getTbsp_bok_time_s() >>> " + bkvo.getGetBookingVOList().get(0).getTbsp_bok_time_s());
			System.out.println("getTbsp_bok_time_e() >>> " + bkvo.getGetBookingVOList().get(0).getTbsp_bok_time_e());
			System.out.println("getPayamount() >>> " + bkvo.getGetBookingVOList().get(0).getPayamount());
			System.out.println("getTbsp_bok_person() >>> " + bkvo.getGetBookingVOList().get(0).getTbsp_bok_person());
			System.out.println("getTbsp_num() >>> " + bkvo.getGetBookingVOList().get(0).getTbsp_num());
			System.out.println("getTbsp_capacity() >>> " + bkvo.getGetBookingVOList().get(0).getTbsp_capacity());
			System.out.println("getBook01() >>> " + bkvo.getGetBookingVOList().get(0));
			System.out.println("getTbu_guestid >>> " + bkvo.getGetBookingVOList().get(0).getTbu_guestid());
			
			bkvo.setTbsp_num(bkvo.getGetBookingVOList().get(0).getTbsp_num());
			List<BookingVO> listH = bookingService.bokHostSelect(bkvo);
			logger.info("BookingController bokHostSelect listS.size() >>> : " + listH.size());
			
			model.addAttribute("listBooking",bkvo.getGetBookingVOList());
			model.addAttribute("listH",listH);
			return CONTEXT_PATH + "/bokHostSelect";
		}
		
		
		// 예약 내역 등록
		@RequestMapping(value="/bookingInsert", method=RequestMethod.POST)
		public String bookingInsert(BookingVO bkvo,Model model, HttpServletRequest req) {
			logger.info("BookingController bookingInsert >>> : ");
			
			// 채번 구하기
			String tbsp_bok_num = ChabunUtil.getBookingChabun("BK", chabunService.getBookingChabun().getTbsp_bok_num());
			logger.info("tbsp_bok_num >>> : " + tbsp_bok_num);
			bkvo.getGetBookingVOList().get(0).setTbsp_bok_num(tbsp_bok_num);
			
			logger.info("tbsp_num >>> : " + bkvo.getGetBookingVOList().get(0).getTbsp_num());
			int nCnt = bookingService.bookingInsert(bkvo.getGetBookingVOList().get(0));
			logger.info("tbu_guestid >>> : " + bkvo.getGetBookingVOList().get(0).getTbu_guestid());
			int nCnt2 = bookingService.bookingTimeUpdate(bkvo.getGetBookingVOList().get(0));
			
			logger.info("BookingController bookingInsert >>> : " + nCnt + "건 입력 되었습니다.");
			logger.info("BookingController bookingTimeUpdate >>> : " + nCnt2 + "건 수정 되었습니다.");
			
			return "/payment/payment_finish";
			
		}
		
		@RequestMapping(value="/bookHisSelect", method=RequestMethod.POST)
		public String bookHisSelect(BookingVO bkvo, Model model, HttpServletRequest req) {
			logger.info("BookingController bookHisSelect >>> : ");
			
			HttpSession httpSession = req.getSession(true);
			GuestVO svo = (GuestVO) httpSession.getAttribute("user");
			HostVO hvo = (HostVO) httpSession.getAttribute("HostVO");
			if(hvo != null) return "/booking/booking_history_re";
			System.out.println(svo.getTBU_GUESTID());
			
			bkvo.setTbu_guestid(svo.getTBU_GUESTID());
			
			System.out.println(bkvo.getTbu_guestid());
			List<BookingVO> listAll = bookingService.bookHisSelect(bkvo);
			
			
			model.addAttribute("listAll", listAll);
			
			return "/booking/booking_history";
		}
		
		@RequestMapping(value="/selectDetail", method=RequestMethod.POST)
		public String selectDetail(BookingVO bkvo, Model model, HttpServletRequest req) {
			logger.info("BookingController selectDetail >>> : ");
			System.out.println(req.getParameter("index"));
			int i = Integer.parseInt(req.getParameter("index"));
			
			System.out.println("getTbsp_num >>> :" + bkvo.getGetBookingVOList().get(i).getTbsp_num());
			System.out.println("getTbsp_bok_num >>> :" + bkvo.getGetBookingVOList().get(i).getTbsp_bok_num());
			System.out.println("getTbsp_bok_person >>> : " + bkvo.getGetBookingVOList().get(i).getTbsp_bok_person());
			System.out.println("getTbsp_bok_date >>> : " + bkvo.getGetBookingVOList().get(i).getTbsp_bok_date());
			System.out.println("getTbsp_bok_time_s >>> : " + bkvo.getGetBookingVOList().get(i).getTbsp_bok_time_s());
			System.out.println("getTbsp_bok_time_e >>> :" + bkvo.getGetBookingVOList().get(i).getTbsp_bok_time_e());
			
			BookingVO _bkvo = new BookingVO();
			_bkvo.setTbu_guestid(req.getParameter("tbu_guestid"));
			_bkvo.setTbsp_num(bkvo.getGetBookingVOList().get(i).getTbsp_num());
			_bkvo.setTbsp_bok_num(bkvo.getGetBookingVOList().get(i).getTbsp_bok_num());
			_bkvo.setTbsp_bok_person(bkvo.getGetBookingVOList().get(i).getTbsp_bok_person());
			_bkvo.setTbsp_bok_date(bkvo.getGetBookingVOList().get(i).getTbsp_bok_date());
			_bkvo.setTbsp_bok_time_s(bkvo.getGetBookingVOList().get(i).getTbsp_bok_time_s());
			_bkvo.setTbsp_bok_time_e(bkvo.getGetBookingVOList().get(i).getTbsp_bok_time_e());
			
			System.out.println("getTbu_guestid >>> :" + _bkvo.getTbu_guestid());
			System.out.println("getTbsp_num >>> :" + _bkvo.getTbsp_num());
			System.out.println("getTbsp_bok_num >>> :" + _bkvo.getTbsp_bok_num());
			System.out.println("getTbsp_bok_person >>> : " + _bkvo.getTbsp_bok_person());
			System.out.println("getTbsp_bok_date >>> : " + _bkvo.getTbsp_bok_date());
			System.out.println("getTbsp_bok_time_s >>> : " + _bkvo.getTbsp_bok_time_s());
			System.out.println("getTbsp_bok_time_e >>> :" + _bkvo.getTbsp_bok_time_e());
			
			bkvo.setTbsp_num(bkvo.getGetBookingVOList().get(i).getTbsp_num());
			List<BookingVO> listH = bookingService.bokHostSelect(bkvo);
			
			logger.info("BookingController bokHostSelect listS.size() >>> : " + listH.size());
			
			model.addAttribute("listBooking",_bkvo);
			model.addAttribute("listH",listH);
			return CONTEXT_PATH + "/bookDetail";
		}
		
		@RequestMapping(value="/bookCancel", method=RequestMethod.POST)
		public String bokHisUpdate(BookingVO bkvo, Model model, HttpServletRequest req) {
			logger.info("BookingController bookUpdate >>> : ");
			
			bkvo.setTbsp_bok_num(bkvo.getGetBookingVOList().get(0).getTbsp_bok_num());
			bkvo.setTbsp_num(bkvo.getGetBookingVOList().get(0).getTbsp_num());
			bkvo.setTbu_guestid(bkvo.getGetBookingVOList().get(0).getTbu_guestid());
			System.out.println("guestID >>> : " + bkvo.getTbu_guestid());
			
			int nCnt = bookingService.bokHisUpdate(bkvo);
			logger.info("BookingController bokHostSelect nCnt >>> : " + nCnt + "건 수정 되었습니다");
			
			List<BookingVO> listAll = bookingService.bookHisSelect(bkvo);
			
			

			model.addAttribute("listAll", listAll);
			
			return CONTEXT_PATH + "/booking_history";
		}
		

}
