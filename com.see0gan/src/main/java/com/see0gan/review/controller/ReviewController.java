package com.see0gan.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.see0gan.common.service.ChabunService;
import com.see0gan.login.vo.GuestVO;
import com.see0gan.login.vo.HostVO;
import com.see0gan.common.ChabunUtil;
import com.see0gan.common.CommonUtils;
import com.see0gan.mypage.vo.MypageVO;
import com.see0gan.review.service.ReviewService;

@Controller
public class ReviewController {
	
	Logger logger = Logger.getLogger(ReviewController.class);
	
	private ReviewService reviewService;
	private ChabunService chabunService;
	
	// 생성자 Autowired
	@Autowired(required=false)
	public ReviewController( ReviewService reviewService
			               ,ChabunService chabunService) {
		this.reviewService = reviewService;
		this.chabunService = chabunService;
	}
	
	@RequestMapping("reviewListAll")
	public ModelAndView reviewListAll(@ModelAttribute MypageVO mpvo, HttpServletRequest request) {
		
		logger.info("ReviewController reviewListAll 시작");
		
		ModelAndView mav = new ModelAndView();
		
		
		
		return null;
	}
	
	@RequestMapping("reviewList")
	public ModelAndView reviewList(@ModelAttribute MypageVO mpvo) {
		logger.info("ReviewController reviewList 시작 mpvo >>> : " + mpvo);

		// 공간번호
		if(mpvo != null) {
			String rvspnum = mpvo.getRvspnum();
			System.out.println(">>>" + mpvo.getRvspnum());
			logger.info("rvspnum >>> : " + rvspnum);
		}

		// 리뷰
		List<MypageVO> reviewList = reviewService.reviewList(mpvo);
		logger.info("[i] reviewList >>> : " + reviewList);

		// ModelAndView
		ModelAndView mav = new ModelAndView();
		mav.addObject("reviewList", reviewList);
		mav.setViewName("review/reviewList");

		logger.info("reviewList 종료 mav >>> : " + mav);
		
		return mav;
	}
	
	@RequestMapping("listData")
	public ResponseEntity reviewListData(@ModelAttribute MypageVO mpvo, HttpServletRequest request) {
		logger.info("[reviewListData 시작] mpvo >>> : " + mpvo);

		// 공간번호
		String tbsp_num = request.getParameter("tbsp_num");
		mpvo.setRvspnum(tbsp_num);
		logger.info("[i] tbsp_num >>> : " + tbsp_num);

		// 리뷰
		List<MypageVO> reviewList = reviewService.reviewList(mpvo);
		logger.info("[i] reviewList >>> : " + reviewList);

		// JSON
		JSONObject listData = new JSONObject();
		if(tbsp_num != null && tbsp_num.length() > 0) {
			listData.put("status", "OK");
			listData.put("tbsp_num", tbsp_num);

			JSONArray revArr = new JSONArray();

			if(reviewList != null && reviewList.size() > 0) {
				for(int i = 0; i < reviewList.size(); i++) {
					MypageVO revVO = reviewList.get(i);
					JSONObject revData = new JSONObject();

					String rvnum = revVO.getRvnum();
					String rvspnum = revVO.getRvspnum();
					String rvdeleteyn = revVO.getRvdeleteyn();
					String guestId = null;
					String rating = null;
					String rvcontent = null;
					String rvinsertdate = null;
					String rvupdatedate = null;
					String nickName = null;

					if(rvdeleteyn != null && "N".equals(rvdeleteyn)) {
						guestId = revVO.getGuestId();
						rating = revVO.getRating();
						rvcontent = revVO.getRvcontent();
						rvinsertdate = revVO.getRvinsertdate();
						rvupdatedate = revVO.getRvupdatedate();
						nickName = revVO.getNickName();
					}

					revData.put("rvnum", rvnum);
					revData.put("rvspnum", rvspnum);
					revData.put("guestId", guestId);
					revData.put("rating", rating);
					revData.put("rvcontent", rvcontent);
					revData.put("rvinsertdate", rvinsertdate);
					revData.put("rvupdatedate", rvupdatedate);
					revData.put("rvdeleteyn", rvdeleteyn);
					revData.put("nickName", nickName);

					revArr.add(revData);
				}
			}

			listData.put("reviews", revArr);
		}else {
			listData.put("status", "ERROR");
			listData.put("msg", "파라미터 오류");
		}

		ResponseEntity<String> resData = CommonUtils.responseJSON(listData.toJSONString());
		logger.info("reviewListData 종료 mav >>> : " + resData);
		
		return resData;
	}
	
	/**
	 * 설명
	 * : 리뷰입력 처리 (JSON)
	 * - 공간번호만 있으면 - 최상위 리뷰 작성
	 * - 그룹번호도 같이 있으면 - 대 리뷰 작성
	 * - 그룹번호, 타겟번호도 같이 있으면 - 대 리뷰 작성
	 * 매개변수 : MypageVO mpvo - 공간번호, 그룹번호, 타겟번호, 내용
	 * 반환값 : ResponseEntity<String>
	 */
	// {"status": "OK", "msg": "(메세지)"}
	// {"status": "ERROR", "msg": "(오류 메세지)"}
	@RequestMapping(value = "reviewInsert", method = RequestMethod.POST)
	public ResponseEntity<String> reviewInsertProcess(@ModelAttribute MypageVO mpvo, HttpServletRequest request) {
		logger.info("reviewInsertProcess 시작 mpvo >>> : " + mpvo);

		// 공간번호
		String rvspnum = null;
		
		if(mpvo != null) {
			rvspnum = mpvo.getRvspnum();
		}
		
		logger.info("rvspnum >>> : " + rvspnum);
		
		// 회원번호
		String userNum = null;
		String nickName = null;

		// 세션에서 회원번호 가져오기
		HttpSession httpSession = request.getSession(true);

		GuestVO svo = (GuestVO) httpSession.getAttribute("user");
		HostVO hvo = null;
		if(svo == null)
			hvo = (HostVO) httpSession.getAttribute("HostVO");
			
		String mnum = null;
		String mnick = null;
		if(svo != null) {
			mnum = svo.getTBU_GUESTID();
			mnick = svo.getTBU_NICKNAME();
		} else if(hvo != null){
			mnum = hvo.getTBH_NUM();
			mnick = hvo.getTBH_NICKNAME();
		}
		
		userNum = mnum;
		nickName = mnick;
		
		mpvo.setGuestId(userNum);
		mpvo.setNickName(nickName);
		logger.info("userNum >>> : " + userNum);
		logger.info("nickName >>> : " + nickName);


		// 세션에 회원번호가 없으면 차단하기
//		boolean isAuth = userNum != null && userNum.length() > 0;
		boolean isAuth = true;

		// DB작업
		int cnt = 0;
		
		if(isAuth == true) {
			if(rvspnum != null && rvspnum.length() >= 0) {
				
				logger.info("후기 리뷰");
				
				// 채번 구하기
				String rvnum = ChabunUtil.getReviewChabun("D", chabunService.getReviewChabun().getRvnum());
				logger.info("ReviewController reviewInsert rvnum >>> : " + rvnum);
				
				mpvo.setRvnum(rvnum);
				
				cnt = reviewService.reviewRootInsert(mpvo);
			}
		}
		logger.info("[i] cnt >>> " + cnt);

		String msg = null;
		String status = "ERROR";
		
		if(isAuth == false) {
			msg = "리뷰작성은 로그인한 사용자만 가능합니다.";
		} else {
			if(cnt > 0) {
				status = "OK";
				msg = "리뷰 작성 완료";
			} else {
				msg = "리뷰 작성 실패";
			}
		}

		logger.info("[i] status >>> : " + status);
		logger.info("[i] msg >>> : " + msg);

		JSONObject inData = new JSONObject();
		inData.put("status", status);
		inData.put("msg", msg);

		ResponseEntity<String> resData = CommonUtils.responseJSON(inData.toJSONString());

		logger.info("reviewInsertProcess 종료 resData >>> : " + resData);
		
		return resData;
	}
	
	@RequestMapping(value = "reviewUpdate", method = RequestMethod.GET)
	public ResponseEntity<String> reviewUpdate(@ModelAttribute MypageVO mpvo, HttpServletRequest request) {
		logger.info("reviewUpdate 시작 mpvo >>> : " + mpvo);

		// 후기 번호
		String rvnum = null;
		if(mpvo != null) {
			rvnum = mpvo.getRvnum();
		}
		logger.info("[i] 리뷰번호 >>> : " + rvnum);

		// 회원번호
		String userNum = null;
		String nickName = null;

		// 세션에서 회원번호 가져오기
		HttpSession httpSession = request.getSession(true);

		GuestVO svo = (GuestVO) httpSession.getAttribute("user");
		HostVO hvo = null;
		if(svo == null){
			hvo = (HostVO) httpSession.getAttribute("HostVO");
		}
			
		String mnum = null;
		String mnick = null;
		if(svo != null) {
			mnum = svo.getTBU_GUESTID();
			mnick = svo.getTBU_NICKNAME();
		} else if(hvo != null){
			mnum = hvo.getTBH_NUM();
			mnick = hvo.getTBH_NICKNAME();
		}
		
		userNum = mnum;
		nickName = mnick;
		
		logger.info("[i] userNum >>> : " + userNum);
		logger.info("[i] nickName >>> : " + nickName);

		// 수정권한여부
//		boolean isAuth = false;
		// #################### test ####################
		boolean isAuth = true;

		List<MypageVO> reviewData = null;

		// 회원번호가 있을때만 DB작업하기
		if(userNum != null && userNum.length() > 0) {
			// DB작업 - Update 할 후기정보 가져오기
			reviewData = reviewService.reviewSelect(mpvo);
			logger.info("[i] review >>> : " + reviewData);

			// 회원번호를 대조해서 작성자인지 확인하기
			if(reviewData != null && reviewData.size() > 0) {
				for(int i = 0; i < reviewData.size(); i++) {
					String guestId = reviewData.get(i).getGuestId();

					// 작성자라면 수정권한 True
					if(userNum.equals(guestId)) {
						isAuth = true;
						break;
					}
				}
			}
		}

		JSONObject revData = new JSONObject();

		if(isAuth == true) {
			// 수정권한이 있다면

			if(reviewData != null && reviewData.size() > 0) {
				logger.info("[i] reviewData size >>> : " + reviewData.size());

				JSONObject reviewObj = new JSONObject();

				MypageVO revVO = reviewData.get(0);

				reviewObj.put("rvnum", revVO.getRvnum());
				reviewObj.put("rating", revVO.getRating());
				reviewObj.put("rvcontent", revVO.getRvcontent());
				reviewObj.put("rvspnum", revVO.getRvspnum());

				revData.put("status", "OK");
				revData.put("reviewData", reviewObj);
			}else {
				revData.put("status", "ERROR");
				revData.put("msg", "존재하지 않거나 삭제된 리뷰입니다.");
			}

		}else {
			// 없다면
			revData.put("status", "ERROR");
			revData.put("msg", "리뷰를 수정할 권한이 없습니다.");
		}

		ResponseEntity<String> resData = CommonUtils.responseJSON(revData.toJSONString());

		logger.info("[reviewUpdate 종료] mav >>> : " + resData);
		
		return resData;
	}
	
	/**
	 * 설명
	 * : 리뷰 수정 처리 (JSON)
	 * 매개변수 : MypageVO mpvo - 리뷰번호, 내용, HttpServletRequest request - 세션
	 * 반환값 : ResponseEntity<String>
	 */
	// {"status": "OK", "msg": "(메세지)"}
	// {"status": "ERROR", "msg": "(오류 메세지)"} 
	@RequestMapping(value = "reviewUpdate", method = RequestMethod.POST)
	public ResponseEntity<String> reviewUpdateProcess(@ModelAttribute MypageVO mpvo, HttpServletRequest request) {
		logger.info("[reviewUpdate 시작] mpvo >>> : " + mpvo);

		// 후기번호, 공간번호
		String rNum = null;
		String sspNum = null;
		if(mpvo != null) {
			rNum = mpvo.getRvnum();
			sspNum = mpvo.getRvspnum();
		}
		logger.info("[i] 리뷰번호 >>> : " + rNum);
		logger.info("[i] 공간번호 >>> : " + sspNum);

		// 회원번호
		String userNum = null;
		String nickName = null;

		// 세션에서 회원번호 가져오기
		HttpSession httpSession = request.getSession(true);
		
		GuestVO svo = (GuestVO) httpSession.getAttribute("user");
		HostVO hvo = null;
		if(svo == null)
			hvo = (HostVO) httpSession.getAttribute("HostVO");
			
		String mnum = null;
		String mnick = null;
		if(svo != null) {
			mnum = svo.getTBU_GUESTID();
			mnick = svo.getTBU_NICKNAME();
		} else if(hvo != null){
			mnum = hvo.getTBH_NUM();
			mnick = hvo.getTBH_NICKNAME();
		}
		
		userNum = mnum;
		nickName = mnick;
		
		mpvo.setGuestId(userNum);
		mpvo.setNickName(nickName);
		logger.info("[i] userNum >>> : " + userNum);
		logger.info("[i] nickName >>> : " + nickName);

		// 수정권한
		boolean isAuth = false;

		// 회원번호가 있으면 수정권한주기
		if(userNum != null && userNum.length() > 0) {
			isAuth = true;
		}

		int updateCnt = 0;
		// 수정권한이 있으면
		if(isAuth == true) {
			updateCnt = reviewService.reviewUpdate(mpvo);
		}
		logger.info("[i] updateCnt >>> : " + updateCnt);

		String status = "ERROR";
		String msg = null;

		if(updateCnt > 0) {
			status = "OK";
			msg = "수정 완료";
		}else {
			if(isAuth == false) {
				msg = "수정 실패";
			}else {
				msg = "수정권한이 없습니다.";
			}
		}

		logger.info("[i] status >>> : " + status);
		logger.info("[i] msg >>> : " + msg);

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", status);
		jsonObj.put("msg", msg);

		ResponseEntity<String> resData = CommonUtils.responseJSON(jsonObj.toJSONString());

		logger.info("reviewUpdate 종료 mav >>> : " + resData);
		
		return resData;
	}
	
	@RequestMapping("reviewDelete")
	public ResponseEntity<String> reviewDelete(@ModelAttribute MypageVO mpvo, HttpServletRequest request) {
		logger.info("reviewDelete 시작 mpvo >>> : " + mpvo);
		
		// 리뷰 번호
		String rvnum = null;
		if(mpvo != null) {
			rvnum = mpvo.getRvnum();
		}
		logger.info("[i] 후기번호 >>> : " + rvnum);
		
		// 회원번호
		String userNum = null;
		
		// 관리자여부
		boolean isAdmin = false;
		
		// 세션에서 회원번호 가져오기
		HttpSession hs =request.getSession();
		userNum = (String)hs.getAttribute("guestId");
		// #################### test ####################
		userNum = "Admin";
		logger.info("[i] userNum >>> : " + userNum);

		// 회원번호로 관리자여부 가져오기
		// isAdmin = this.isAdminMem(userNum);
		// #################### test ####################
		isAdmin = true;
		logger.info("[i] isAdmin >>> : " + isAdmin);

		// 수정권한여부
		boolean isAuth = false;

		List<MypageVO> reviewData = null;

		// 공간번호
		String spNum = null;

		// 관리자라면
		if(isAdmin == true) {
			isAuth = true;
		}else if(userNum != null && userNum.length() > 0) {
			// 회원번호가 있을때만 DB작업하기
			// DB작업 - Delete 할 리뷰정보 가져오기
			reviewData = reviewService.reviewSelect(mpvo);
			logger.info("[i] review >>> : " + reviewData);
			
			// 회원번호를 대조해서 작성자인지 확인하기
			if(reviewData != null && reviewData.size() > 0) {
				for(int i = 0; i < reviewData.size(); i++) {
					String guestId = reviewData.get(i).getGuestId();
					spNum = reviewData.get(i).getRvspnum();
					
					// 작성자라면 삭제권한 True
					if(userNum.equals(guestId)) {
						isAuth = true;
						break;
					}
				}
			}
		}

		String status = "ERROR";
		String msg = null;
		
		if(isAuth == true) {
			// 삭제권한 있다면

			// DB작업 - 삭제
			int delCnt = 0;

			if(isAdmin == true) {
				// 관리자
				delCnt = reviewService.reviewDeleteAdmin(mpvo);
			}else {
				// 일반회원
				mpvo.setGuestId(userNum);
				delCnt = reviewService.reviewDelete(mpvo);
			}
			logger.info("[i] delCnt >>> : " + delCnt);


			if(delCnt > 0) {
				status = "OK";
				msg = "삭제완료";
			}else {
				msg = "삭제실패";
			}
		}else {
			// 없다면
			msg = "리뷰가 없거나 삭제할 권한이 없습니다.";
		}

		logger.info("[i] status >>> : " + status);
		logger.info("[i] msg >>> : " + msg);

		// 상태(성공, 실패)와 메세지를 출력
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", status);
		jsonObj.put("msg", msg);

		ResponseEntity<String> resData = CommonUtils.responseJSON(jsonObj.toJSONString());

		logger.info("[reviewDelete 종료] mav >>> : " + resData);
		return resData;
	}

}
