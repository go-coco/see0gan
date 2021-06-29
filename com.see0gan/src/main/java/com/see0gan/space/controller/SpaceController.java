package com.see0gan.space.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

//import com.see0gan.common.FileUploadUtil;
//import com.see0gan.common.UploadFileUtils;
import org.springframework.web.servlet.ModelAndView;

import com.see0gan.booking.vo.BookingVO;
import com.see0gan.common.service.ChabunService;
import com.see0gan.login.vo.HostVO;
import com.see0gan.space.common.ChabunUtil;
import com.see0gan.space.service.SpaceService;
import com.see0gan.space.vo.SP_AccountsInfoVO;
import com.see0gan.space.vo.SP_BasicInfoVO;
import com.see0gan.space.vo.SP_GuideInfoVO;
import com.see0gan.space.vo.SP_HostInfoVO;
import com.see0gan.space.vo.SP_AccountsInfoVO;

@Controller
@RequestMapping(value="/space")
public class SpaceController {

	Logger logger = Logger.getLogger(SpaceController.class);

	private static final String CONTEXT_PATH = "space";
	private SpaceService spaceService;
	private ChabunService chabunService;

	@Autowired(required = false)
	public SpaceController(SpaceService spaceService, ChabunService chabunService) {
		this.spaceService = spaceService;
		this.chabunService = chabunService;
	}
	


	/** file upload - image
	 * 
	 *  	@Resource(name = "uploadPath")
			private String uploadPath;
	 *  
	 *  */
	
	// From 웰컴파일(index.jsp) To 공간 기본정보 입력폼(basicInfo_Insert.jsp)
	@RequestMapping(value = "basicInfo_Form", method = RequestMethod.GET)
	public String spaceBasicForm() {
		return CONTEXT_PATH +"/basicInfo_Form";
	}
	
	//Post 방식 파일 업로드
	@RequestMapping(value ="spaceInsert", method = RequestMethod.POST)
	public String spaceInsert(HttpServletRequest req,
									@RequestParam("tbsp_img1") MultipartFile thumbnail,
									@RequestParam("tbsp_img2") MultipartFile img,
									Model model) {
		
		logger.info("SpaceController basicInfo_Insert 함수 진입 >>> :");

		
		String tbsp_num = ChabunUtil.getBoardChabun("S", chabunService.getSpaceChabun().getTbsp_num());
		logger.info("SpaceController getBoardChabun tbsp_num >>> : " + tbsp_num);

	//	String tbh_num = req.getSession().getAttribute("user");
		
		SP_BasicInfoVO bvo = new SP_BasicInfoVO();
	

		if(thumbnail != null) {
			logger.info(">> thumbnail originalName:" + thumbnail.getOriginalFilename());
			logger.info("size:" + thumbnail.getSize());
			logger.info("ContentType:" + thumbnail.getContentType());
		}
		
		if(img != null) {
			logger.info("img originalName:" + img.getOriginalFilename());
			logger.info("size:" + img.getSize());
			logger.info("ContentType:" + img.getContentType());
		}
		
		 logger.info("SpaceController spaceInsert bvo >>> : " + req.getParameter("tbsp_name"));// bvo.getTbsp_addr2());
		 logger.info("SpaceController spaceInsert bvo >>> : " + req.getParameter("tbsp_type"));
		 logger.info("SpaceController spaceInsert bvo >>> : " + req.getParameter("tbsp_intro1")); 
		 logger.info("SpaceController spaceInsert bvo >>> : "+ req.getParameter("tbsp_capacity"));
			
		 	bvo.setTbsp_num(tbsp_num);
			bvo.setTbsp_name(req.getParameter("tbsp_name"));
			bvo.setTbsp_type(req.getParameter("tbsp_type"));
			bvo.setTbsp_intro1(req.getParameter("tbsp_intro1"));
			bvo.setTbsp_intro2(req.getParameter("tbsp_intro2"));
			bvo.setTbsp_capacity(req.getParameter("tbsp_capacity"));
			bvo.setTbsp_tag1(req.getParameter("tag01"));
			bvo.setTbsp_tag2(req.getParameter("tag02"));
			bvo.setTbsp_tag3(req.getParameter("tag03"));
			bvo.setTbsp_tag4(req.getParameter("tag04"));
			bvo.setTbsp_tag5(req.getParameter("tag05"));
			bvo.setTbsp_guide(req.getParameter("tbsp_guide"));
			bvo.setTbsp_caution(req.getParameter("tbsp_caution"));
			bvo.setTbsp_url(req.getParameter("tbsp_url"));
			bvo.setTbsp_img1(thumbnail.getOriginalFilename());
			bvo.setTbsp_img2(img.getOriginalFilename());
			bvo.setTbsp_addr(req.getParameter("tbsp_addr"));
			bvo.setTbsp_addr2(req.getParameter("tbsp_addr2"));
			bvo.setTbh_num(req.getParameter("tbh_num"));
			
			logger.info("SpaceController spaceInsert() bvo.getTbsp_num() >>> : " + bvo.getTbsp_num());
			logger.info("SpaceController spaceInsert() bvo.getTbsp_name() >>> : " + bvo.getTbsp_name());
			logger.info("SpaceController spaceInsert() bvo.getTbsp_type() >>> : " + bvo.getTbsp_type());
			logger.info("SpaceController spaceInsert() bvo.getTbsp_intro1() >>> : " + bvo.getTbsp_intro1());
			logger.info("SpaceController spaceInsert() bvo.getTbsp_intro2() >>> : " + bvo.getTbsp_intro2());
			logger.info("SpaceController spaceInsert() bvo.getTbsp_capacity() >>> : " + bvo.getTbsp_capacity());
			logger.info("SpaceController spaceInsert() bvo.getTbsp_tag1() >>> : " + bvo.getTbsp_tag1());
			logger.info("SpaceController spaceInsert() bvo.getTbsp_tag2() >>> : " + bvo.getTbsp_tag2());
			logger.info("SpaceController spaceInsert() bvo.getTbsp_tag3() >>> : " + bvo.getTbsp_tag3());
			logger.info("SpaceController spaceInsert() bvo.getTbsp_tag4() >>> : " + bvo.getTbsp_tag4());
			logger.info("SpaceController spaceInsert() bvo.getTbsp_tag5() >>> : " + bvo.getTbsp_tag5());
			logger.info("SpaceController spaceInsert() bvo.getTbsp_guide() >>> : " + bvo.getTbsp_guide());
			logger.info("SpaceController spaceInsert() bvo.getTbsp_caution() >>> : " + bvo.getTbsp_caution());
			logger.info("SpaceController spaceInsert() bvo.getTbsp_url() >>> : " + bvo.getTbsp_url());
			logger.info("SpaceController spaceInsert() bvo.getTbsp_img1() >>> : " + bvo.getTbsp_img1());
			logger.info("SpaceController spaceInsert() bvo.getTbsp_img2() >>> : " + bvo.getTbsp_img2());
			logger.info("SpaceController spaceInsert() bvo.getTbsp_addr() >>> : " + bvo.getTbsp_addr());
			logger.info("SpaceController spaceInsert() bvo.getTbsp_addr2() >>> : " + bvo.getTbsp_addr2());
			logger.info("SpaceController spaceInsert() bvo.getTbh_num() >>> : " + bvo.getTbh_num()); 
		 
		// 공간등록 기본정보 DB 등록

			int nCnt = spaceService.basicInfo_Insert(bvo);
			int nCnt2 = spaceService.basicInfoTag_Insert(bvo);

			logger.info("SpaceController spaceInsert() nCnt >>> :" + nCnt);
			logger.info("SpaceController spaceInsert() nCnt2 >>> :" + nCnt2);

			// SP_HostInfoVO hivo = new SP_HostInfoVO();
			// hivo.setTbsp_num(tbsp_num);

			// 등록 완료가 되면은
			if (nCnt > 0 && nCnt2 > 0) 		{
				
				HttpSession session = req.getSession(true);

				
				session.setAttribute("tbsp_num", bvo.getTbsp_num());
				
			//	model.addAttribute("tbsp_num", bvo.getTbsp_num());
				return CONTEXT_PATH + "/hostInfo_Form";
			}
			

			// 등록 완료 안되면 일루 가겠지?
			return CONTEXT_PATH + "/basicInfo_Insert";

	}
	
	// 호스트정보입력페이지(hostInfo_Insert.jsp) >> 호스트정보 DB입력처리
		@RequestMapping(value = "hostInfo_Insert", method = RequestMethod.POST)
		public String hostInfoInsert(HttpServletRequest req) {
			logger.info("SpaceController hostInfoInsert 함수 진입 >>> :");

			// 채번 구하기
			// String tbh_num= ChabunUtil.getMemChabun("H",
			// chabunService.getHostInfoChabun().getTbh_num());
			// logger.info("SpaceController spaceInsert tbh_num >>> : " + tbh_num);

			// VO셋팅
			SP_HostInfoVO hIVO = new SP_HostInfoVO();

			hIVO.setTbsp_num(req.getParameter("tbsp_num"));
			hIVO.setTbh_num(req.getParameter("tbh_num"));
			hIVO.setTbh_email(req.getParameter("tbh_email"));
			hIVO.setTbh_phone(req.getParameter("tbh_phone"));
			hIVO.setTbsp_tel(req.getParameter("tbsp_tel"));

			logger.info("SpaceController hostInfoInsert() hIVO.getTbh_num() >>> : " + hIVO.getTbsp_num());
			logger.info("SpaceController hostInfoInsert() hIVO.getTbh_num() >>> : " + hIVO.getTbh_num());
			logger.info("SpaceController hostInfoInsert() hIVO.getTbh_email() >>> : " + hIVO.getTbh_email());
			logger.info("SpaceController hostInfoInsert() hIVO.getTbh_phone() >>> : " + hIVO.getTbh_phone());
			logger.info("SpaceController hostInfoInsert() hIVO.getTbsp_tel() >>> : " + hIVO.getTbsp_tel());

			// DB등록
			int nCnt = spaceService.hostInfo_Insert(hIVO);
			logger.info("SpaceController hostInfoInsert() nCnt >>> :" + nCnt);

			// 등록완료 >> guideInfo_Insert.jsp(이용안내)
			if (nCnt > 0) {
				return "space/guideInfo_Form";
			}

			return "space/hostInfo_Insert";
		}
	
//		part 2
		/*
		 * @RequestMapping(value="hostInfo_Select.sgg", method=RequestMethod.GET) public
		 * String hostInfo_Select(SP_HostInfoVO sp_hvo, Model model) {
		 * logger.info("SpaceController basicInfo_Select() 진입 >>> :");
		 * 
		 * List<SP_HostInfoVO> listSP_h = spaceService.hostInfo_Select(sp_hvo);
		 * logger.info("SpaceController basicInfo_Select() listSP_b.size() >>> :" +
		 * listSP_h.size());
		 * 
		 * System.out.println("SpaceController getTbsp_num>>>"+listSP_h.get(0).
		 * getTbsp_num()); sp_hvo.setTbsp_num(listSP_h.get(0).getTbsp_num());
		 * 
		 * if(listSP_h.size() == 1) { model.addAttribute("listSP_h", listSP_h); return
		 * CONTEXT_PATH+"/guideInfo_Form"; } return ""; }
		 */
		
		@RequestMapping(value="guideInfo_Form", method=RequestMethod.GET)
		public String guideInfo_Form(SP_HostInfoVO sp_hvo) {
			return CONTEXT_PATH+"/guideInfo_Form";
		}
		
		@RequestMapping(value = "guideInfo_Insert", method=RequestMethod.POST)
		public String guideInfo_Insert(SP_GuideInfoVO sp_gvo, HttpServletRequest request) {
			
			logger.info("SpaceController guideInfo_Insert()  sp_gvo.getTbsp_num() >>> :" + sp_gvo.getTbsp_num());
			
			// 인서트 1
			int nCnt_guide = spaceService.guideInfo_Insert(sp_gvo);	
			logger.info("SpaceController guideInfo_Insert() nCnt_guide >>> :" + nCnt_guide);
			// 인서트 2		
			int nCnt_dayoff = spaceService.dayoff_Insert(sp_gvo);			
			logger.info("SpaceController guideInfo_Insert() nCnt_dayoff >>> :" + nCnt_dayoff);
			// 인서트 3	
			int nCnt_convenient = spaceService.convenient_Insert(sp_gvo); 
			logger.info("SpaceController guideInfo_Insert() nCnt_convenient >>> :" + nCnt_convenient);
			return CONTEXT_PATH+"/acuntsInfo_Form";
			
		}
		
		@RequestMapping(value="acuntsInfo_Form", method=RequestMethod.GET)
		public String acuntsInfo_Form() {
			return CONTEXT_PATH+"/acuntsInfo_Form";
		}
		
		@RequestMapping(value = "acuntsInfo_Insert", method=RequestMethod.POST)
		public String acuntsInfo_Insert(SP_AccountsInfoVO sp_avo, HttpServletRequest request) {
			
			logger.info("accountsInfo_Insert >>> : 시작 ");
			
			
			
			int nCnt = spaceService.acuntsInfo_Insert(sp_avo);
			logger.info("SpaceController acuntsInfo_Insert nCnt >>> : " + nCnt);

			if(nCnt > 0) {
				return "login/hostCenter";
			}
			
			return "";	

		}
		
	
}
