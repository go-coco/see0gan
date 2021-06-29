package com.see0gan.qna.controller;

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
import com.see0gan.qna.service.QnaService;


@Controller
public class QnaController {
	
	Logger logger = Logger.getLogger(QnaController.class);
	
	private QnaService qnaService;
	private ChabunService chabunService;
	
	// 생성자 Autowired
	@Autowired(required=false)	
	public QnaController(QnaService qnaService
			               ,ChabunService chabunService) {
		this.qnaService = qnaService;
		this.chabunService = chabunService;
	}
	
	@RequestMapping("qnaListAll")
	public ModelAndView qnaAllList(@ModelAttribute MypageVO mpvo, HttpServletRequest request) {
		logger.info("qnaAllList 시작 mpvo >>> : " + mpvo);

		// 관리자여부
		boolean isAdmin = false;

		// 세션에서 회원번호 가져오기
		HttpSession hs =request.getSession();
		String memNum = (String)hs.getAttribute("mnum");
		logger.info("[i] memNum >>> : " + memNum);

		// 회원번호로 관리자여부 가져오기
		isAdmin = this.isAdminMem(memNum);
		logger.info("[i] isAdmin >>> : " + isAdmin);

		// ModelAndView
		ModelAndView mav = new ModelAndView();

		
		//관리자일때만 실행
		if(isAdmin == true) {
			// 페이징
			String groupSize = "10";
			String pageSize = "10";

			String curpage = "1";
	
			// 상품번호
			if(mpvo != null) {
				String crpage = mpvo.getCurpage();
				logger.info("[i] crpage >>> : " + crpage);
	
				if(crpage != null && crpage.length() > 0) {
					curpage = crpage;
				}
			}
			logger.info("[i] curpage >>> : " + curpage);

			MypageVO cmvo = new MypageVO();

			cmvo.setGroupsize(groupSize);
			cmvo.setPagesize(pageSize);
			cmvo.setCurpage(curpage);
			cmvo.setQcontents(mpvo.getQcontents());

			// Q&A
			List<MypageVO> qnaList = qnaService.qnaListAll(cmvo);
			logger.info("[i] qnaList >>> : " + qnaList);

			// ModelAndView 설정
			mav.addObject("qnaList", qnaList);
			mav.addObject("cmvo", cmvo);
			mav.setViewName("listAll");
		}else {
			// 관리자가 아니면
			mav.setViewName("common/noAuth");
		}

		logger.info("qnaAllList 종료 mav >>> : " + mav);
		
		return mav;
	}
	
	/**
	 * 설명
	 * : (상품번호로) 선택한 상품의 Q&A목록
	 * 매개변수 : MypageVO mpvo - 상품번호
	 * 반환값 : ModelAndView
	 */
	@RequestMapping("qnaList")
	public ModelAndView qnaList(@ModelAttribute MypageVO mpvo) {
		logger.info("QnaController qnaList 시작 mpvo >>> : " + mpvo);

		// 상품번호
		if(mpvo != null) {
			String spnum = mpvo.getQspnum();
			logger.info("[i] spnum >>> : " + spnum);
		}

		// Q&A
		List<MypageVO> qnaList = qnaService.qnaList(mpvo);
		logger.info("[i] qnaList >>> : " + qnaList);

		// ModelAndView
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaList", qnaList);
		mav.setViewName("/qna/qnaList");

		logger.info("qnaList 종료 mav >>> : " + mav);
		
		return mav;
	}

	/**
	 * 설명
	 * : (상품번호로) 선택한 상품의 Q&A데이터 (JSON)
	 * 매개변수 : MypageVO mpvo - 상품번호
	 * 반환값 : ResponseEntity<String>
	 */
	// {"status": "OK", "pnum" : "(상품번호)", "qnas": [{(VO 데이터)}, ...]}
	// 오류 {"status": "ERROR", "msg": "(오류메세지)"}
	@RequestMapping("listQData")
	public ResponseEntity qnaListData(@ModelAttribute MypageVO mpvo, HttpServletRequest reqeust) {
		logger.info("qnaListData 시작 mpvo >>> : " + mpvo);
		String tbsp_num = reqeust.getParameter("tbsp_num");
		logger.info("tbsp_num >>> " + tbsp_num);
		
		// 공간번호
		String spnum = tbsp_num;
		mpvo.setQspnum(spnum);

		// Q&A
		List<MypageVO> qnaList = qnaService.qnaList(mpvo);
		logger.info("[i] qnaList >>> : " + qnaList);

		// JSON
		JSONObject listData = new JSONObject();
		if(spnum != null && spnum.length() > 0) {
			listData.put("status", "OK");
			listData.put("spnum", spnum);

			JSONArray qnaArr = new JSONArray();

			if(qnaList != null && qnaList.size() > 0) {
				for(int i = 0; i < qnaList.size(); i++) {
					MypageVO qnaVO = qnaList.get(i);
					JSONObject qnaData = new JSONObject();

					String qnum = qnaVO.getQnum();
					String qspnum = qnaVO.getQspnum();
					String qgroupnum = qnaVO.getQgroupnum();
					String qtargetnum = qnaVO.getQtargetnum();
					String qdelyn = qnaVO.getQdelyn();
					String qcontents = null;
					String qindate = null;
					String mnum = null;
					String mnick = null;
					String tarname = null;

					if(qdelyn != null && "N".equals(qdelyn)) {
						qcontents = qnaVO.getQcontents();
						qindate = qnaVO.getQindate();
						mnum = qnaVO.getMnum();
						mnick = qnaVO.getMnick();
						tarname = qnaVO.getTarnick();
					}

					qnaData.put("qnum", qnum);
					qnaData.put("qcontents", qcontents);
					qnaData.put("qspnum", qspnum);
					qnaData.put("qgroupnum", qgroupnum);
					qnaData.put("qtargetnum", qtargetnum);
					qnaData.put("qdelyn", qdelyn);
					qnaData.put("qindate", qindate);
					qnaData.put("mnum", mnum);
					qnaData.put("mnick", mnick);
					qnaData.put("tarname", tarname);

					qnaArr.add(qnaData);
				}
			}

			listData.put("qnas", qnaArr);
		}else {
			listData.put("status", "ERROR");
			listData.put("msg", "파라미터 오류");
		}

		ResponseEntity<String> resData = CommonUtils.responseJSON(listData.toJSONString());
		logger.info("qnaListData 종료 mav >>> : " + resData);
		
		return resData;
	}

	/**
	 * 설명
	 * : Q&A입력 처리 (JSON)
	 * - 상품번호만 있으면 - 최상위 Q&A 작성
	 * - 그룹번호도 같이 있으면 - 대 Q&A 작성
	 * - 그룹번호, 타겟번호도 같이 있으면 - 대 Q&A 작성
	 * 매개변수 : MypageVO mpvo - 상품번호, 그룹번호, 타겟번호, 내용
	 * 반환값 : ResponseEntity<String>
	 */
	// {"status": "OK", "msg": "(메세지)"}
	// {"status": "ERROR", "msg": "(오류 메세지)"}
	@RequestMapping(value = "qnaInsert", method = RequestMethod.POST)
	public ResponseEntity<String> qnaInsertProcess(@ModelAttribute MypageVO mpvo, HttpServletRequest request) {
		logger.info("qnaInsertProcess 시작 mpvo >>> : " + mpvo);

		// 상품번호/그룹번호/타겟번호
		String qspnum = null;
		String qgroupnum = null;
		String qtargetnum = null;
		
		if(mpvo != null) {
			qspnum = mpvo.getQspnum();
			qgroupnum = mpvo.getQgroupnum();
			qtargetnum = mpvo.getQtargetnum();
		}
		logger.info("[i] qspnum      >>> : " + qspnum);
		logger.info("[i] qgroupnum  >>> : " + qgroupnum);
		logger.info("[i] qtargetnum >>> : " + qtargetnum);

		// 회원번호
		String memNum = null;
		String memNick = null;

		// 세션에서 회원번호, 닉네임 가져오기
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
		
		memNum = mnum;
		memNick = mnick;
		
		mpvo.setMnum(memNum);
		mpvo.setMnick(memNick);
		logger.info("[i] memNum >>> : " + memNum);
		logger.info("[i] memNick >>> : " + memNick);

		// 세션에 회원번호가 없으면 차단하기
		boolean isAuth = memNum != null && memNum.length() > 0;

		// DB작업
		int cnt = 0;
		if(isAuth == true) {
			if(qspnum != null && qspnum.length() >= 0) {
				if(qgroupnum != null && qgroupnum.length() > 0) {
					// Q&A 답변글
					logger.info("[i] Q&A 답변글");
	
					if(!(qtargetnum != null && qtargetnum.length() >= 0) ) {
						mpvo.setQtargetnum(qgroupnum);
					}
					
					// 채번 구하기
					String qnum = ChabunUtil.getQnaChabun("D", chabunService.getQnaChabun().getQnum());
					logger.info("QnaController qnaInsert qnum >>> : " + qnum);
					
					mpvo.setQnum(qnum);
	
					cnt = qnaService.qnaReInsert(mpvo);
				}else {
					// 최상위Q&A
					logger.info("[i] 최상위 Q&A");
					
					// 채번 구하기
					String qnum = ChabunUtil.getQnaChabun("D", chabunService.getQnaChabun().getQnum());
					logger.info("QnaController qnaInsert qnum >>> : " + qnum);
					
					mpvo.setQnum(qnum);
	
					cnt = qnaService.qnaRootInsert(mpvo);
				}
			}
		}
		logger.info("[i] cnt >>> : " + cnt);

		/*
		// 알림을 보내기위해 알림을 보낼 사람의 회원번호 가져오기
		List<MypageVO> notiList = null;
		if(cnt > 0) {
			MypageVO cNotiVO = new MypageVO();

			if(mpvo != null) {
				logger.info("[i] qnum >>> : " + mpvo.getQnum());
				cNotiVO.setCnum(mpvo.getQnum());

				notiList = qnaService.qnaSelectNoti(cNotiVO);
			}

		}
		logger.info("[i] notiList >>> : " + notiList);

		// 알림 보내기
		if(notiList != null && notiList.size() > 0) {
			logger.info("[ 알림 정보 ]");
			for(int i = 0; i < notiList.size(); i++) {
				MypageVO cnvo = notiList.get(i);
				logger.info("[i] Q&A 번호           >>> : " + cnvo.getQnum());
				logger.info("[i] 상품 번호           >>> : " + cnvo.getQspnum());
				logger.info("[i] 회원번호(상품)      >>> : " + cnvo.getPmnum());
				logger.info("[i] 회원번호(상위 Q&A) >>> : " + cnvo.getQmnum());
				
			}
		}
		*/

		String msg = null;
		String status = "ERROR";
		
		if(isAuth == false) {
			msg = "Q&A작성은 로그인한 사용자만 가능합니다.";
		}else {
			if(cnt > 0) {
				status = "OK";
				msg = "Q&A 작성 완료";
			}else {
				msg = "Q&A 작성 실패";
			}
		}

		logger.info("[i] status >>> : " + status);
		logger.info("[i] msg >>> : " + msg);

		JSONObject inData = new JSONObject();
		inData.put("status", status);
		inData.put("msg", msg);

		ResponseEntity<String> resData = CommonUtils.responseJSON(inData.toJSONString());

		logger.info("qnaInsertProcess 종료 resData >>> : " + resData);
		
		return resData;
	}

	/**
	 * 설명
	 * : 수정을 위해 Q&A 하나를 Select해서 가져옴 (작성자 본인만 Select) (JSON)
	 * 매개변수 : MypageVO mpvo - Q&A 번호, HttpServletRequest request - 세션
	 * 반환값 : ResponseEntity<String>
	 */
	// {"status": "OK", "qnaData": {(VO데이터)}}
	// {"status": "ERROR", "msg": "(오류 메세지)"}
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.GET)
	public ResponseEntity<String> qnaUpdate(@ModelAttribute MypageVO mpvo, HttpServletRequest request) {
		logger.info("qnaUpdate 시작 mpvo >>> : " + mpvo);

		// Q&A 번호
		String qnum = null;
		if(mpvo != null) {
			qnum = mpvo.getQnum();
		}
		logger.info("[i] Q&A번호 >>> : " + qnum);

		// 회원번호
		String memNum = null;

		// 세션에서 회원번호 가져오기
		HttpSession httpSession = request.getSession(true);

		GuestVO svo = (GuestVO) httpSession.getAttribute("user");
		HostVO hvo = null;
		if(svo == null){
			hvo = (HostVO) httpSession.getAttribute("HostVO");
		}
			
		String qmnum = null;
		String mnick = null;
		if(svo != null) {
			qmnum = svo.getTBU_GUESTID();
			mnick = svo.getTBU_NICKNAME();
		} else if(hvo != null){
			qmnum = hvo.getTBH_NUM();
			mnick = hvo.getTBH_NICKNAME();
		}
		
		memNum = qmnum;
		logger.info("[i] memNum >>> : " + memNum);

		// 수정권한여부
		boolean isAuth = false;

		List<MypageVO> qnaData = null;

		// 회원번호가 있을때만 DB작업하기
		if(memNum != null && memNum.length() > 0) {
			// DB작업 - Update 할 Q&A정보 가져오기
			qnaData = qnaService.qnaSelect(mpvo);
			logger.info("[i] qna >>> : " + qnaData);

			// 회원번호를 대조해서 작성자인지 확인하기
			if(qnaData != null && qnaData.size() > 0) {
				for(int i = 0; i < qnaData.size(); i++) {
					String mnum = qnaData.get(i).getMnum();

					// 작성자라면 수정권한 True
					if(memNum.equals(mnum)) {
						isAuth = true;
						break;
					}
				}
			}
		}

		JSONObject qData = new JSONObject();

		if(isAuth == true) {
			// 수정권한이 있다면

			if(qnaData != null && qnaData.size() > 0) {
				logger.info("[i] qnaData size >>> : " + qnaData.size());

				JSONObject qnaObj = new JSONObject();

				MypageVO qVO = qnaData.get(0);

				qnaObj.put("qnum", qVO.getQnum());
				qnaObj.put("qcontents", qVO.getQcontents());
				qnaObj.put("qspnum", qVO.getQspnum());

				qData.put("status", "OK");
				qData.put("qnaData", qnaObj);
			}else {
				qData.put("status", "ERROR");
				qData.put("msg", "존재하지 않거나 삭제된 Q&A입니다.");
			}

		}else {
			// 없다면
			qData.put("status", "ERROR");
			qData.put("msg", "Q&A을 수정할 권한이 없습니다.");
		}

		ResponseEntity<String> resData = CommonUtils.responseJSON(qData.toJSONString());

		logger.info("[qnaUpdate 종료] mav >>> : " + resData);
		return resData;
	}

	/**
	 * 설명
	 * : Q&A 수정 처리 (JSON)
	 * 매개변수 : MypageVO mpvo - Q&A번호, 내용, HttpServletRequest request - 세션
	 * 반환값 : ResponseEntity<String>
	 */
	// {"status": "OK", "msg": "(메세지)"}
	// {"status": "ERROR", "msg": "(오류 메세지)"} 
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.POST)
	public ResponseEntity<String> qnaUpdateProcess(@ModelAttribute MypageVO mpvo, HttpServletRequest request) {
		logger.info("qnaUpdate 시작 mpvo >>> : " + mpvo);

		// Q&A번호, 상품번호
		String qNum = null;
		String spNum = null;
		if(mpvo != null) {
			qNum = mpvo.getQnum();
			spNum = mpvo.getQspnum();
		}
		logger.info("[i] Q&A번호 >>> : " + qNum);
		logger.info("[i] 상품번호 >>> : " + spNum);

		// 회원번호
		String memNum = null;

		// 세션에서 회원번호 가져오기
		HttpSession httpSession = request.getSession(true);

		GuestVO svo = (GuestVO) httpSession.getAttribute("user");
		HostVO hvo = null;
		if(svo == null){
			hvo = (HostVO) httpSession.getAttribute("HostVO");
		}
			
		String qmnum = null;
		String mnick = null;
		if(svo != null) {
			qmnum = svo.getTBU_GUESTID();
			mnick = svo.getTBU_NICKNAME();
		} else if(hvo != null){
			qmnum = hvo.getTBH_NUM();
			mnick = hvo.getTBH_NICKNAME();
		}
		memNum = qmnum;
		mpvo.setMnum(memNum);
		logger.info("[i] memNum >>> : " + memNum);

		// 수정권한
		boolean isAuth = false;

		// 회원번호가 있으면 수정권한주기
		if(memNum != null && memNum.length() > 0) {
			isAuth = true;
		}

		int updateCnt = 0;
		// 수정권한이 있으면
		if(isAuth == true) {
			updateCnt = qnaService.qnaUpdate(mpvo);
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

		logger.info("qnaUpdate 종료 mav >>> : " + resData);
		
		return resData;
	}

	/**
	 * 설명
	 * : Q&A 삭제 처리 (JSON)
	 * 매개변수 : MypageVO mpvo - Q&A 번호, HttpServletRequest request - 세션
	 * 반환값 : ResponseEntity<String>
	 */
	// {"status": "OK", "msg": "(메세지)"}
	// {"status": "ERROR", "msg": "(오류 메세지)"}
	@RequestMapping("qnaDelete")
	public ResponseEntity<String> qnaDelete(@ModelAttribute MypageVO mpvo, HttpServletRequest request) {
		logger.info("qnaDelete 시작 mpvo >>> : " + mpvo);
		
		// Q&A 번호
		String qnum = null;
		if(mpvo != null) {
			qnum = mpvo.getQnum();
		}
		logger.info("[i] Q&A번호 >>> : " + qnum);
		
		// 회원번호
		String memNum = null;
		
		// 관리자여부
		boolean isAdmin = false;
		
		// 세션에서 회원번호 가져오기
		HttpSession httpSession = request.getSession(true);

		GuestVO svo = (GuestVO) httpSession.getAttribute("user");
		HostVO hvo = null;
		if(svo == null){
			hvo = (HostVO) httpSession.getAttribute("HostVO");
		}
			
		String qmnum = null;
		String mnick = null;
		if(svo != null) {
			qmnum = svo.getTBU_GUESTID();
			mnick = svo.getTBU_NICKNAME();
		} else if(hvo != null){
			qmnum = hvo.getTBH_NUM();
			mnick = hvo.getTBH_NICKNAME();
		}
		memNum = qmnum;
		logger.info("[i] memNum >>> : " + memNum);

		// 회원번호로 관리자여부 가져오기
		isAdmin = this.isAdminMem(memNum);
		logger.info("[i] isAdmin >>> : " + isAdmin);

		// 수정권한여부
		boolean isAuth = false;

		List<MypageVO> qnaData = null;

		// 상품번호
		String spNum = null;

		// 관리자라면
		if(isAdmin == true) {
			isAuth = true;
		}else if(memNum != null && memNum.length() > 0) {
			// 회원번호가 있을때만 DB작업하기
			// DB작업 - Delete 할 Q&A정보 가져오기
			qnaData = qnaService.qnaSelect(mpvo);
			logger.info("[i] qna >>> : " + qnaData);
			
			// 회원번호를 대조해서 작성자인지 확인하기
			if(qnaData != null && qnaData.size() > 0) {
				for(int i = 0; i < qnaData.size(); i++) {
					String mnum = qnaData.get(i).getMnum();
					spNum = qnaData.get(i).getQspnum();
					
					// 작성자라면 삭제권한 True
					if(memNum.equals(mnum)) {
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
				delCnt = qnaService.qnaDeleteAdmin(mpvo);
			}else {
				// 일반회원
				mpvo.setMnum(memNum);
				delCnt = qnaService.qnaDelete(mpvo);
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
			msg = "Q&A가 없거나 삭제할 권한이 없습니다.";
		}

		logger.info("[i] status >>> : " + status);
		logger.info("[i] msg >>> : " + msg);

		// 상태(성공, 실패)와 메세지를 출력
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("status", status);
		jsonObj.put("msg", msg);

		ResponseEntity<String> resData = CommonUtils.responseJSON(jsonObj.toJSONString());

		logger.info("qnaDelete 종료 mav >>> : " + resData);
		
		return resData;
	}

	/**
	 * 설명
	 * : 관리자 여부 확인
	 * 매개변수 : String memno 회원번호
	 * 반환값 : boolean (true - 관리자)
	 */
	private boolean isAdminMem(String mnum) {
		return "M202106050001".equals(mnum);
	}

}
