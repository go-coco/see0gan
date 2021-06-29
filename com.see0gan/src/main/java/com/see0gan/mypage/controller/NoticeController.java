package com.see0gan.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.see0gan.common.service.ChabunService;
import com.see0gan.common.ChabunUtil;
import com.see0gan.common.Paging;
import com.see0gan.mypage.service.NoticeService;
import com.see0gan.mypage.vo.MypageVO;

@Controller
public class NoticeController {
	
	Logger logger = Logger.getLogger(NoticeController.class);
	
	private NoticeService noticeService;
	private ChabunService chabunService;
	
	// 생성자 Autowired
	@Autowired(required=false)	
	public NoticeController( NoticeService noticeService
			               ,ChabunService chabunService) {
		this.noticeService = noticeService;
		this.chabunService = chabunService;
	}
	
//	// 공지사항 : 전체조회
//	@RequestMapping(value="noticeSelectAll", method=RequestMethod.GET)
//	public String noticeSelectAll(NoticeVO mpvo, Model model) {
//		logger.info("NoticeController NoticeSelectAll start ::");
//		
//		List<NoticeVO> listAll = noticeService.NoticeSelectAll(mpvo);
//		logger.info("NoticeController NoticeSelectAll listS.size >>>:: " + listAll.size());
//		
//		if(listAll.size() != 0) {
//			
//			model.addAttribute("listAll", listAll);
//			model.addAttribute("mpvo", mpvo);
//			return "notice/noticeSelectAll";
//			
//		}
//
//		return "notice/noticeForm";
//	}
	
	// 공지사항 : 전체조회 페이징
	@RequestMapping(value="noticeSelectAllPage", method=RequestMethod.GET)
	public String noticeSelectAllPage(MypageVO mpvo, Model model, HttpServletRequest request) {
		logger.info("NoticeController noticeSelectAllPage start ::");
		
		// 페이징
		String totalCnt = "0";
		String cPage = request.getParameter("curPage");
		String pageCtrl = request.getParameter("pageCtrl");
		
		Paging.setPage(mpvo, cPage, pageCtrl);
		
		List<MypageVO> listPage = noticeService.noticeSelectPage(mpvo);
		logger.info("NoticeController NoticeSelectAllPage listPage.size >>>:: " + listPage.size());
		
		if(listPage.size() != 0) {
			
			totalCnt = listPage.get(0).getTotalcount();
			mpvo.setTotalcount(totalCnt);
			
			model.addAttribute("listPage", listPage);
			model.addAttribute("p_mpvo", mpvo);
			
			return "notice/noticeSelectAllPage";
			
		}
		
		return "notice/noticeForm";
	}
	
	// 공지사항 입력 폼
	@RequestMapping(value="noticeForm", method=RequestMethod.GET)
	public String boardForm() {
		return "notice/noticeForm";
	}
	
	// 공지사항 등록 (Insert)
	@RequestMapping(value = "noticeInsert", method = RequestMethod.POST)
	public String noticeInsert(MypageVO mpvo, HttpServletRequest request) {
		
		logger.info("noticeInsert >>> : 시작 ");
		
		// 채번 구하기
		String ntnum = ChabunUtil.getNoticeChabun("D", chabunService.getNoticeChabun().getNtnum());
		logger.info("NoticeController noticeInsert ntnum >>> : " + ntnum);
		
		mpvo.setNtnum(ntnum);
		
		int nCnt = noticeService.noticeInsert(mpvo);
		logger.info("NoticeController NoticeInsert nCnt >>> : " + nCnt);

		if(nCnt > 0) {
			return "notice/noticeInsert";
		}
		
		return "notice/noticeSelectAllPage";
	}
	
	// 공지사항 셀렉트 (Select)
	@RequestMapping(value="noticeSelect",method=RequestMethod.GET)
	public String NoticeSelect(MypageVO mpvo, Model model) {

		logger.info("NoticeController NoticeSelect start :::: ");
		logger.info("NoticeController NoticeSelect mpvo.getNtnum() " + mpvo.getNtnum());

		List<MypageVO> listS = noticeService.noticeSelect(mpvo);
		logger.info("NoticeController noticeSelect listS.size >>>:: " + listS.size());


		if(listS.size() == 1) {
			model.addAttribute("listS", listS);
			return "notice/noticeSelect";
		}

		return "notice/noticeSelectAllPage";

	}
	
	// 공지사항 수정 폼
	@RequestMapping(value="noticeUpdateForm",method=RequestMethod.POST)
	public String NoticeUpdate(MypageVO mpvo ,Model model) {
		logger.info("NoticeController noticeUpdateForm start >> ");

		List<MypageVO> listS = noticeService.noticeSelect(mpvo);
		
		model.addAttribute("listS", listS);

			return "notice/noticeUpdateForm";
	}
	
	// 공지사항 수정(Update)
	@RequestMapping(value="noticeUpdate", method=RequestMethod.POST)
	public String noticeUpdate(MypageVO mpvo, HttpServletRequest request) {		
		logger.info("NoticeController noticeUpdate mpvo.getNtnum() >>> : " + mpvo.getNtnum());
		
		int nCnt = 0;
		String url = "";
		
		logger.info("mpvo >>> : " + mpvo.toString());
		
		nCnt = noticeService.noticeUpdate(mpvo);
		logger.info("noticedUpdate nCnt >>> : " + nCnt);
		
		if(nCnt > 0) {
			return "notice/noticeUpdate";
		}
		
		return "notice/noticeSelectAllPage";
	}
	
	// 공지사항 삭제(Delete)
	@RequestMapping(value="noticeDelete", method=RequestMethod.POST)
	public String noticeDelete(MypageVO mpvo, HttpServletRequest request) {		
		logger.info("NoticeController noticeDelete mpvo.getNtnum() >>> : " + mpvo.getNtnum());
		
		int nCnt = 0;
		String url = "";
		
		logger.info("mpvo >>> : " + mpvo.toString());
		
		nCnt = noticeService.noticeDelete(mpvo);
		logger.info("noticedDelete nCnt >>> : " + nCnt);
		
		if(nCnt > 0) {
			return "notice/noticeDelete";
		}
		
		return "notice/noticeSelectAllPage";
	}
}
