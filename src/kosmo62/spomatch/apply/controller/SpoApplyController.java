package kosmo62.spomatch.apply.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosmo62.spomatch.apply.service.SpoApplyService;
import kosmo62.spomatch.match.service.SpoMatchService;
import kosmo62.spomatch.apply.vo.SpoApplyVO;
import kosmo62.spomatch.chat.service.SpoChatService;
import kosmo62.spomatch.chat.vo.SpoChatVO;
import kosmo62.spomatch.match.vo.SpoMatchVO;


@Controller
//@RequestMapping("/Apply")
public class SpoApplyController {
	private Logger log = Logger.getLogger(SpoApplyController.class);

	@Autowired
	private SpoApplyService spoApplyService;
	
	@Autowired
	private SpoMatchService spoMatchService;
	
	@Autowired
	private SpoChatService spoChatService;
	
	
	
	/* ======= 신청 리스트 불러오기(전체) -> 관리자 권한(?) ======== */
	@RequestMapping("listApply")
	public ModelAndView listApply(@ModelAttribute SpoApplyVO param,HttpServletRequest req) {
		log.info("SpoApplyController listApply start >>> ");
		log.info("SpoApplyController listApply param >>> " + param);
		
		String curPage = req.getParameter("spg_curPage");
		log.info("SpoApplyController listApply curPage >>> " + curPage);
		if(curPage != null && curPage.length() > 0) {
			param.setSpg_curPage(curPage);
		}else {
			param.setSpg_curPage("1");
		}
		
		List<SpoApplyVO> list = spoApplyService.listApply(param);
		log.info("SpoApplyController listApply list >>> " + list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("applyList",list);
		mav.setViewName("/apply/viewApplyMatch");
		log.info("SpoApplyController listApply end >>> ");
		return mav;
	}
	
	/* ============================== 마이페이지 내가등록한 글에 신청한 리스트  불러오기 =========================== */
	@RequestMapping("viewApplyMatch")
	public ModelAndView viewApplyMatch(@ModelAttribute SpoApplyVO param,HttpServletRequest req) {
		log.info("SpoApplyController viewApplyMatch start >>> ");
		log.info("SpoApplyController viewApplyMatch param >>> " + param);
		ModelAndView mav = new ModelAndView();
		
		//Session
		HttpSession session = req.getSession(false);
		if(session == null) {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("/login/loginForm");
			return mav;
		}else {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			log.info(smb_no);
			param.setMatch_writer(smb_no);
			
		}
				
		String curPage = req.getParameter("spg_curPage");
		log.info("SpoApplyController viewApplyMatch curPage >>> " + curPage);
		if(curPage != null && curPage.length() > 0) {
			param.setSpg_curPage(curPage);
		}else {
			param.setSpg_curPage("1");
		}
		
		log.info(param.getSmb_no());
		log.info(param.getSmc_no());
		
		mav.addObject("applyList",spoApplyService.viewApplyMatch(param));
		mav.setViewName("/myPage/viewApplyMatch");
		log.info("SpoApplyController viewApplyMatch end >>> ");
		return mav;
	}
	
	/* ================================== 신청 상세보기 구현 ========================= */
	@RequestMapping("viewApply")
	public ModelAndView viewApply(@ModelAttribute SpoApplyVO param, HttpServletRequest req) {
		log.info("SpoApplyController viewApply start >>> ");
		log.info("SpoApplyController viewApply param >>> " + param);
		log.info(">>>>>>>>>>>"+param.getSmb_no());
		log.info(">>>>>>>>>>>"+param.getSmc_no());
		log.info(">>>>>>>>>>>"+param.getSap_no());
		log.info(" >>>>>>>>>>>>>>"+param.getMatch_writer());
		
		
		ModelAndView mav = new ModelAndView();
		
		//Session
		HttpSession session = req.getSession(false);
		if(session == null) {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("/login/loginForm");
		}else {
			log.info("SpoApplyController viewApply smb_no >>> " + param.getSmb_no());
			
			mav.addObject("spoApplyVO",spoApplyService.viewApply(param));
			mav.setViewName("/apply/viewApply");
		}
		
		log.info("SpoApplyController viewApply end >>> ");
		return mav;
	}
	
	/* ===================================== 신청 form 구현 ============================ */
	@RequestMapping("applyMatchForm")
	public ModelAndView applyMatchForm(@ModelAttribute SpoApplyVO param, HttpServletRequest req) {
		log.info("SpoApplyController applyMatchForm start >>> ");
		log.info("SpoApplyController applyMatchForm param >>> " + param);
		
		ModelAndView mav = new ModelAndView();
		// 세션 확인 
		HttpSession session = req.getSession(false);
		
		String smb_no = "";
		log.info("SpoMatchController mypageListMatch smb_no >>>" + smb_no);
		if(session != null) {
			smb_no = String.valueOf(session.getAttribute("smb_no"));
			param.setSmb_no(smb_no);
			//이미 신청한 매칭일 경우
			List<SpoApplyVO> list = spoApplyService.applyCheckMatch(param);
			log.info(">>>>>>>>>>>>>>>>>>>>>>>>>>> list.size()" + list.size());
			if(list.size() > 0 && list != null) {
				mav.addObject("result", "이미 신청한 매칭입니다.");
				SpoMatchVO smVO = new SpoMatchVO();
				smVO.setSmb_no(smb_no);
				mav.addObject("applyList",spoMatchService.mypageListApply(smVO));
				mav.setViewName("/myPage/mypageListApply");
				return mav;
			}
		}else {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("/login/loginForm");
			return mav;
		}
		
		String smc_no = param.getSmc_no();
		mav.setViewName("/apply/apply");
		log.info("SpoApplyController applyMatchForm smc_no >>> " + smc_no);
		log.info("SpoApplyController applyMatchForm end >>> ");
		return mav;
	}
	
	/* ================================ 신청 하기 구현 ==================================== */
	@RequestMapping("applyMatch")
	public ModelAndView applyMatch(@ModelAttribute SpoApplyVO param, HttpServletRequest req) {
		log.info("SpoApplyController applyMatch start >>> ");
		log.info("SpoApplyController applyMatch param >>> " + param);
		String smb_no = "";
		String result = "";
		String resultPage = "";
		
		ModelAndView mav = new ModelAndView();
		// 세션 확인 
		HttpSession session = req.getSession(false);
		log.info("SpoApplyController applyMatch session >>> " + session);
		
		if(session != null) {
			smb_no = String.valueOf(session.getAttribute("smb_no"));
			param.setSmb_no(smb_no);
			log.info("SpoMatchController mypageListMatch smb_no >>>" + smb_no);
			
		}else {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("/login/loginForm");
			return mav;
		}
		
		try {
			int nCnt = spoApplyService.applyMatch(param);
			log.info("SpoApplyController applyMatch nCnt >>> " + nCnt);
			if(nCnt > 0) {
				//신청 성공 시 뷰페이지에 객체를 넘겨준다.
				result = "신청에 성공하였습니다.";
				mav.addObject("spoApplyVO",spoApplyService.viewApply(param));
				resultPage = "/apply/viewApply";
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			result = "신청에 문제가 있어 실패하였습니다.";
			resultPage = "forward:/applyMatchForm.spo";
			log.info("SpoApplyController applyMatch smc_no >>> " + param.getSmc_no());
		}
		mav.addObject("result", result);
		mav.setViewName(resultPage);
		log.info("SpoApplyController applyMatch end >>> ");
		return mav;
	}
	/* =================================== 신청서 수정Form 구현 =============================== */
	@RequestMapping("updateFormApply")
	public ModelAndView updateFormApply(@ModelAttribute SpoApplyVO param,HttpServletRequest req) {
		log.info("SpoApplyController updateFormApply start >>> ");
		log.info("SpoApplyController updateFormApply param >>> " + param);
		
		ModelAndView mav = new ModelAndView();
		
		// 세션 확인 
		HttpSession session = req.getSession(false);
		log.info("SpoApplyController applyMatch session >>> " + session);
		
		if(session != null) {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			log.info("SpoMatchController mypageListMatch smb_no >>>" + smb_no);
			param.setSmb_no(smb_no);
			
		}else {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("/login/loginForm");
			return mav;
		}
				
		param = spoApplyService.viewApply(param);
		mav.addObject("spoApplyVO", param);
		mav.setViewName("/apply/updateApply");
		log.info("SpoApplyController updateApply end >>> ");
		return mav;
	}
	
	/* ==================================== 신청서 수정 구현 ================================== */
	@RequestMapping("updateApply")
	public ModelAndView updateApply(@ModelAttribute SpoApplyVO param, HttpServletRequest req) {
		log.info("SpoApplyController updateApply start >>> ");
		log.info("SpoApplyController updateApply param >>> " + param);
		log.info("SpoApplyController updateApply param.getSmb_no >>> " + param.getSmb_no());
		log.info("SpoApplyController updateApply param.getSmc_no >>> " + param.getSmc_no());
		log.info("SpoApplyController updateApply param.getSap_no >>> " + param.getSap_no());
		
		ModelAndView mav = new ModelAndView();

		String result = "";
		String resultPage = "";
		
		// 세션 확인 
		HttpSession session = req.getSession(false);
		
		if(session != null) {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			log.info("SpoMatchController updateApply smb_no >>>" + smb_no);
			param.setSmb_no(smb_no);
		}else {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("/login/loginForm");
			return mav;
		}
		
		try {
			int nCnt = spoApplyService.updateApply(param);
			log.info("SpoApplyController updateApply nCnt >>> " + nCnt);
			if(nCnt > 0) {
				result = "수정에 성공하였습니다.";
				resultPage = "/apply/result";
				mav.addObject("isudResult",spoApplyService.viewApply(param));
			}
		} catch (Exception e) {
			System.out.println("SpoApplyController updateApply 오류 >>> " + e.getMessage());
			param = spoApplyService.viewApply(param);
			result = "수정에 문제가 있어 실패하였습니다.";
			resultPage = "redirect:/updateFormApply.spo";
			log.info("SpoApplyController updateApply smc_no >>> " + param.getSmc_no());
		}
		mav.addObject("result", result);
		mav.setViewName(resultPage);
		log.info("SpoApplyController updateApply end >>> ");
		return mav;
	}
	
	
	/* =============================== 신청 취소 구현 ================================ */
	@RequestMapping("deleteApply")
	public ModelAndView deleteApply(@ModelAttribute SpoApplyVO param, HttpServletRequest req) {
		log.info("SpoApplyController deleteApply start >>> ");
		log.info("SpoApplyController deleteApply param >>> " + param);
		
		ModelAndView mav = new ModelAndView();
		// 세션 확인 
		HttpSession session = req.getSession(false);
		String smb_no = "";
		if(session != null) {
			smb_no = String.valueOf(session.getAttribute("smb_no"));
			log.info("SpoMatchController mypageListMatch smb_no >>>" + smb_no);
			mav.addObject("session_member", smb_no);
		}else {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("/login/loginForm");
			return mav;
		}
		
		String result = "";
		String resultPage = "";
		try {
			int nCnt = spoApplyService.deleteApply(param);
			log.info("SpoApplyController deleteApply nCnt >>> " + nCnt);
			if(nCnt > 0) {
				result = "삭제에 성공하였습니다.";
				SpoMatchVO smVO = new SpoMatchVO();
				smVO.setSmb_no(smb_no);
				mav.addObject("applyList",spoMatchService.mypageListApply(smVO));
				resultPage = "/myPage/mypageListApply";
			}
		} catch (Exception e) {
			result = "삭제에 문제가 있어 실패하였습니다.";
			param.setSmb_no(smb_no);
			mav.addObject("spoApplyVO",spoApplyService.viewApply(param));
			resultPage = "/apply/viewApply";
		}
		SpoMatchVO smVO = new SpoMatchVO();
		smVO.setSmc_no(param.getSmc_no());
		int updatenCnt = spoMatchService.updateApplyMatch(smVO);
		log.info("updatenCnt>>>>>>>>>>>>>>>>>>>>>>>>>>>"+ updatenCnt);
		mav.addObject("result", result);
		mav.setViewName(resultPage);
		log.info("SpoApplyController updateApply end >>> ");
		return mav;
	}
	
	/* ================== ============ 신청 수락 및 거절 구현 ============= ===================== */
	@RequestMapping("acceptApply")
	public ModelAndView acceptApply(@ModelAttribute SpoApplyVO param, HttpServletRequest req) {
		log.info("SpoApplyController acceptApply start >>> ");
		log.info("SpoApplyController acceptApply param >>> " + param);
		log.info("SpoApplyController acceptApply param >>> " + param.getSmb_no());
		log.info("SpoApplyController acceptApply param >>> " + param.getSmc_no());
		log.info("SpoApplyController acceptApply param >>> " + param.getSap_no());
		log.info(">>>>>>>>>>>"+param.getSpg_curPage());
		String curPage = param.getSpg_curPage();
		if(curPage == null) {
			curPage = "1";
			param.setSpg_curPage(curPage);
		}
		ModelAndView mav = new ModelAndView();
		
		// 세션 확인 
		HttpSession session = req.getSession(false);
		
		if(session == null) {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("/login/loginForm");
			return mav;
		}else {
			String session_no = String.valueOf(session.getAttribute("smb_no"));
			log.info("SpoMatchController mypageListMatch smb_no >>>" + session_no);
			
			log.info(param.getSap_acceptyn());
			log.info(param.getSap_no());
				
			String result = "";
			String resultPage = "";
			String acceptRs = param.getSap_acceptyn().equals("Y")?"수락":"거절";
			try {
				int nCnt = spoApplyService.acceptApply(param);
				log.info("SpoApplyController acceptApply nCnt >>> " + nCnt);
				if(nCnt > 0) {
					result = "신청 "+ acceptRs + "에 성공하였습니다.";
					param.setMatch_writer(session_no);
					mav.addObject("applyList",spoApplyService.viewApplyMatch(param));
					resultPage = "/myPage/viewApplyMatch";
					
					log.info(param.getSmb_no());
					log.info(param.getSmc_no());
					
					// 수락 시 수행 할 조건
					if(acceptRs.equals("수락")){
						SpoMatchVO svo = new SpoMatchVO();
						svo.setSmc_no(param.getSmc_no());
						spoMatchService.updateApplyMatch(svo);
						// 수락시 자동으로 수락 완료 메세지 전송 
						SpoChatVO chatVO = new SpoChatVO();
						chatVO.setSmb_no(session_no);//1
						chatVO.setSch_resiver(param.getSmb_no());//4
						chatVO.setSmc_no(param.getSmc_no());//mc00048
						spoChatService.acceptMatchChat(chatVO);
						log.info("SpoApplyController acceptApply meseege success>>> ");
					}else {
						SpoMatchVO svo = new SpoMatchVO();
						svo.setSmc_no(param.getSmc_no());
						spoMatchService.updateApplyMatch(svo);
					}
				}
			} catch (Exception e) {
				log.info(">>>>>>>>>>>>>>>>>>" + e.getMessage());
				//신청 실패 시 신청서 보기 페이지로 이동
				result = "신청 "+ acceptRs + "에 문제가 있어 실패하였습니다.";
				mav.addObject("spoApplyVO",spoApplyService.viewApply(param));
				resultPage = "/apply/viewApply";
			}
			
			mav.addObject("result", result);
			mav.setViewName(resultPage);
		}
		log.info("SpoApplyController acceptApply end >>> ");
		return mav;
	}
	
}
