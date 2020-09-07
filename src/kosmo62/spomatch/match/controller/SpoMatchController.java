package kosmo62.spomatch.match.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosmo62.spomatch.match.service.SpoMatchService;
import kosmo62.spomatch.match.vo.SpoMatchVO;


@Controller
//@RequestMapping(value="/match")
public class SpoMatchController {
	private Logger log = Logger.getLogger(SpoMatchController.class); 
	private int i = 0;
	
	@Autowired
	private SpoMatchService spoMatchService;
	
	
	
	/* ============ Matching 리스트 =============== */
	@RequestMapping("listMatch")
	public ModelAndView listMatch(@ModelAttribute SpoMatchVO param,HttpServletRequest requst) {
		log.info("SpoMatchController listMatch start >>>");
		log.info("SpoMatchController listMatch smvo >>>" + param);
		String curPage = requst.getParameter("spg_curPage");
		if(curPage != null && curPage.length() > 0) {
			log.info("SpoMatchController searchMatch spg_curPage >>>" + curPage);
			param.setSpg_curPage(curPage);
		}else {
			param.setSpg_curPage("1");
		}
		ModelAndView mav = new ModelAndView();
		List<SpoMatchVO> matchList = spoMatchService.listMatch(param);
		mav.addObject("matchList", matchList);
		mav.setViewName("match/listMatch");
		log.info("SpoMatchController listMatch end >>>");
		return mav;
	}
	
	/* ============ Matching 리스트 =============== */
	@RequestMapping("searchMatch")
	@ResponseBody 
	public List<SpoMatchVO> searchMatch(@ModelAttribute SpoMatchVO param,HttpServletRequest requst) {
		log.info("SpoMatchController searchMatch start >>>");
		log.info("SpoMatchController searchMatch smvo >>>" + param);
		
		String curPage = requst.getParameter("spg_curPage");
		if(curPage != null && curPage.length() > 0) {
			log.info("SpoMatchController searchMatch spg_curPage >>>" + curPage);
			param.setSpg_curPage(curPage);
		}else {
			param.setSpg_curPage("1");
		}
		ModelAndView mav = new ModelAndView();
		List<SpoMatchVO> matchList = spoMatchService.listMatch(param);
		requst.setAttribute("matchList", matchList);
		log.info("SpoMatchController searchMatch end >>>");
		return matchList;
	}
	
	/* ============ mypage 내가 등록한 매칭 리스트 =============== */
	@RequestMapping("mypageListMatch")
	@ResponseBody
	public ModelAndView mypageListMatch(@ModelAttribute SpoMatchVO param,HttpServletRequest req) {
		log.info("SpoMatchController mypageListMatch start >>>");
		log.info("SpoMatchController mypageListMatch smvo >>>" + param);
		ModelAndView mav = new ModelAndView();
		
		//Session
		HttpSession session = req.getSession(false);
		if(session == null) {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("login/loginForm");
			return mav;
		}else {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			log.info(smb_no);
			param.setSmb_no(smb_no);
		}
		
		String curPage = req.getParameter("spg_curPage");
		if(curPage != null && curPage.length() > 0) {
			log.info("SpoMatchController mypageListMatch spg_curPage >>>" + curPage);
			param.setSpg_curPage(curPage);
		}else {
			param.setSpg_curPage("1");
		}
		 
		List<SpoMatchVO> matchList = spoMatchService.mypageListMatch(param);
		mav.addObject("matchList",matchList);
		mav.setViewName("myPage/mypageListMatch");
		return mav;
	}
	/* ============ mypage 내가 신청한 매칭 리스트 =============== */
	@RequestMapping("mypageListApply")
	@ResponseBody
	public ModelAndView mypageListApply(@ModelAttribute SpoMatchVO param, HttpServletRequest req) {
		log.info("SpoMatchController mypageListApply start >>>");
		log.info("SpoMatchController mypageListApply smvo >>>" + param);
		
		ModelAndView mav = new ModelAndView();
		
		//Session
		HttpSession session = req.getSession(false);
		if(session == null) {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("login/loginForm");
			return mav;
		}else {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			log.info(smb_no);
			param.setSmb_no(smb_no);
		}
		
		if(req.getParameter("spg_curPage") != null && req.getParameter("spg_curPage").length() > 0) {
			log.info("SpoMatchController mypageListMatch spg_curPage >>>" + req.getParameter("spg_curPage"));
			param.setSpg_curPage(req.getParameter("spg_curPage"));
		}else {
			param.setSpg_curPage("1");
		}
		List<SpoMatchVO> applyList = spoMatchService.mypageListApply(param);
		mav.addObject("applyList",applyList);
		mav.setViewName("/myPage/mypageListApply");
	
		return mav;
	}
	
	/* ============ Matching 상세보기 =============== */
	@RequestMapping("viewMatch")
	public ModelAndView viewMatch(@ModelAttribute SpoMatchVO param, HttpServletRequest req) {
		log.info("SpoMatchController viewMatch start >>>");
		log.info("SpoMatchController viewMatch smvo.getSmc_no >>>" + param.getSmc_no());
		ModelAndView mav = new ModelAndView();
		// 세션 확인 
		HttpSession session = req.getSession(false);
		
		if(session != null) {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			log.info("SpoMatchController mypageListMatch smb_no >>>" + smb_no);
			mav.addObject("session_member", smb_no);
			mav.setViewName("match/viewMatch");
		}else {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("login/loginForm");
			return mav;
		}
		String smc_no = param.getSmc_no();
		
		mav.addObject("SpoMatchVO", spoMatchService.viewMatch(param));
		log.info("SpoMatchController viewMatch end >>>");
		return mav;
	}
	@RequestMapping("insertFormMatch")
	public ModelAndView insertFormMatch(@ModelAttribute SpoMatchVO param, HttpServletRequest req) {
		log.info("SpoMatchController insertFormMatch start >>>");
		log.info("SpoMatchController insertFormMatch param >>>" + param);
		ModelAndView mav = new ModelAndView();
		// 세션 확인 
		HttpSession session = req.getSession(false);
		
		if(session != null) {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			log.info("SpoMatchController mypageListMatch smb_no >>>" + smb_no);
			mav.addObject("session_member", smb_no);
			mav.setViewName("match/match");
		}else {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("login/loginForm");
			return mav;
		}
		
		log.info("SpoMatchController insertFormMatch end >>>");
		return mav;
	}
	/* ============ Maching 글 입력 구현  ============ */
	@RequestMapping("insertMatch")
	public ModelAndView insertMatch(@ModelAttribute SpoMatchVO param, HttpServletRequest req) {
		log.info("SpoMatchController insertMatch start >>>");
		log.info("SpoMatchController insertMatch param >>>" + param);
		log.info( " >>>>>>>>" + param.getSmc_no());
		ModelAndView mav = new ModelAndView();
		int nCnt = 0;
		
		String resultStr = "";
		String returnPage = "";
		
		// 세션 확인 
		HttpSession session = req.getSession(false);
		
		if(session != null) {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			log.info("SpoMatchController mypageListMatch smb_no >>>" + smb_no);
			param.setSmb_no(smb_no);
		}else {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("login/loginForm");
			return mav;
		}
		
		try {
			log.info( " >>>>>>>>" + param.getSmc_no());
			nCnt = spoMatchService.insertMatch(param);
			log.info( " >>>>>>>>" + param.getSmc_no());
			if(nCnt > 0) {
				
				resultStr = "등록이 완료되었습니다.";
				mav.addObject("isudResult", spoMatchService.viewMatch(param));
				returnPage = "/match/result";
				
			}
		} catch (Exception e) {
			resultStr = "등록에 문제가 있어 실패하였습니다.";
			returnPage = "match/listMatch";
		}
		
		
		mav.addObject("result", resultStr);
		mav.setViewName(returnPage);
		
			
		
		return mav;
	}
	 /*  ============ Match 수정 영역  ============ */
	@RequestMapping("updateMatch")
	public ModelAndView updateMatch(@ModelAttribute SpoMatchVO param, HttpServletRequest req) {
		log.info("SpoMatchController updateMatch start >>>");
		log.info("SpoMatchController updateMatch param >>>" + param);
		ModelAndView mav = new ModelAndView();
		int nCnt = 0;
		String resultStr = "";
		String returnPage = "";
		String smb_no = "";
		System.out.println(param.getSmc_subject());
		
		/// 세션 확인 
		HttpSession session = req.getSession(false);
		log.info("SpoApplyController applyMatch session >>> " + session);
		if(session != null) {
			smb_no = String.valueOf(session.getAttribute("smb_no"));
			log.info("SpoMatchController mypageListMatch smb_no >>>" + smb_no);
			param.setSmb_no(smb_no);
		}else {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("login/loginForm");
			return mav;
		}
				
		if(param.getSmc_subject() == null) {
			mav.addObject("SpoMatchVO", spoMatchService.viewMatch(param));
			returnPage="match/updateMatch";
		}else {
			try {
				nCnt = spoMatchService.updateMatch(param);
				if(nCnt > 0) {
					resultStr = "수정이 완료되었습니다.";
					returnPage = "/match/result";
					mav.addObject("session_member", smb_no);
					mav.addObject("isudResult", spoMatchService.viewMatch(param));
				}
			} catch (Exception e) {
				log.info("SpoMatchController updateMatch error >>>" +  e.getMessage());
				resultStr = "수정에 문제가 있어 실패하였습니다.";
				returnPage = "match/updateMatch";
				mav.addObject("SpoMatchVO", spoMatchService.viewMatch(param));
			}
		}
		mav.addObject("result", resultStr);
		mav.setViewName(returnPage);
		return mav;
	}
	
	@RequestMapping("updateFormMatch")
	   public ModelAndView updateFormMatch(@ModelAttribute SpoMatchVO param, HttpServletRequest req) {
	      log.info("SpoMatchController updateMatch start >>>");
	      log.info("SpoMatchController updateMatch param >>>" + param);
	      ModelAndView mav = new ModelAndView();
	      int nCnt = 0;
	      String resultStr = "";
	      String returnPage = "";
	      String smb_no = "";
	      System.out.println(param.getSmc_subject());
	      
	      /// 세션 확인 
	      HttpSession session = req.getSession(false);
	      log.info("SpoApplyController applyMatch session >>> " + session);
	      if(session != null) {
	         smb_no = String.valueOf(session.getAttribute("smb_no"));
	         log.info("SpoMatchController mypageListMatch smb_no >>>" + smb_no);
	         param.setSmb_no(smb_no);
	      }else {
	         mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
	         mav.setViewName("login/loginForm");
	         return mav;
	      }
	      
	      mav.addObject("match", spoMatchService.viewMatch(param));
	      mav.setViewName("match/updateMatch");
	      return mav;
	}
	
	 /*  ============ Match 삭제 영역  ============ */
	@RequestMapping("deleteMatch")
	public ModelAndView deleteMatch(@ModelAttribute SpoMatchVO param, HttpServletRequest req) {
		log.info("SpoMatchController deleteMatch start >>>");
		log.info("SpoMatchController deleteMatch param >>>" + param);
		ModelAndView mav = new ModelAndView();
		int nCnt = 0;
		String resultStr = "";
		String returnPage = "";
		// 세션 확인 
		HttpSession session = req.getSession(false);
		String smb_no = "";
		if(session == null) {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("/login/loginForm");
			return mav;
		}else {
			smb_no = String.valueOf(session.getAttribute("smb_no"));
			param.setSmb_no(smb_no);
		}
		try {
			nCnt = spoMatchService.deleteMatch(param);
			if(nCnt > 0) {
				resultStr = "삭제가 완료되었습니다.";
				mav.addObject("matchList", spoMatchService.mypageListMatch(param));
				returnPage = "/myPage/mypageListMatch";
			}
		} catch (Exception e) {
			resultStr = "삭제에 문제가 있어 실패하였습니다.";
			mav.addObject("SpoMatchVO", spoMatchService.viewMatch(param));
			returnPage = "/match/viewMatch";
		}
		mav.addObject("result", resultStr);
		mav.setViewName(returnPage);
	
		return mav;
	}
}
