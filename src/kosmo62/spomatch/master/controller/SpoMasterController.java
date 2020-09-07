package kosmo62.spomatch.master.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosmo62.spomatch.master.service.SpoMasterService;
import kosmo62.spomatch.master.vo.SpoMasterVO;
import kosmo62.spomatch.notice.vo.SpoNoticeVO;

import org.apache.log4j.Logger;

@Controller
public class SpoMasterController {
	private static Logger log = Logger.getLogger(SpoMasterController.class);

	@Autowired
	private SpoMasterService spoMasterService;
	
		/*******************************************************************************
										토탈 페이지로 가기
		 *******************************************************************************/
		@RequestMapping(value="goTotalPage")
		public ModelAndView goTotalPage(@ModelAttribute SpoMasterVO param, HttpServletRequest request) {
			
			log.info("goMemberPage 접근 >>> : ");
			
			ModelAndView mav = new ModelAndView();
			String message = "";
			HttpSession session = request.getSession(false);
			if(session != null) {
			mav.setViewName("master/spoTotalPage");
			}else {
				message =  "세션이 만료되었습니다. 로그인을 해주세요.";
				mav.addObject("message",message);
				mav.setViewName("login/loginForm");
			}
			return mav;
		 }
		
		/*******************************************************************************
											회원 목록 페이지
		 *******************************************************************************/
		@RequestMapping(value="goMemberPage2", method = RequestMethod.POST)
		public ModelAndView memberPage2(@ModelAttribute SpoMasterVO param, HttpServletRequest request) {
		
		log.info("goMemberPage >> : 회원목록창2 고고싱");
		
		if(request.getParameter("spg_curPage")!= null && request.getParameter("spg_curPage").length() >0) {
			log.info("spomatchController listNotice spg_curPage >>> : " + request.getParameter("spg_curPage"));
			param.setSpg_curPage(request.getParameter("spg_curPage"));
		}else {
			param.setSpg_curPage("1");
		}
		SpoMasterVO searchVO = new SpoMasterVO();
		
		searchVO.setSearchFilter(param.getSearchFilter());
		searchVO.setKeyword(param.getKeyword());
		
		ModelAndView mav = new ModelAndView();
		
		String message = "";
		HttpSession session = request.getSession(false);
		if(session != null) {
		List<SpoMasterVO> matchCountToday = spoMasterService.getMatchCountToday(param);
		List<SpoMasterVO> newMemberToday = spoMasterService.getNewMemberToday(param);
		List<SpoMasterVO> list = spoMasterService.listSpoMember(param);
		mav.addObject("memberList",list);
		mav.addObject("searchVO",searchVO);
		mav.addObject("newCount", matchCountToday);
		mav.addObject("newMember", newMemberToday);
		log.info(param.getSmb_no());
		log.info(param.getSmb_insertdate());
		mav.setViewName("master/spoMemberPage");
		}else {
			message =  "세션이 만료되었습니다. 로그인을 해주세요.";
			mav.addObject("message",message);
			mav.setViewName("login/loginForm");
		}
		return mav;
		}
		
		/*******************************************************************************
										매칭건수 페이지
		******************************************************************************/
		/*
		 * @RequestMapping(value="goMCountPage", method = RequestMethod.POST) public
		 * ModelAndView goMCountPage(@ModelAttribute SpoMasterVO param,
		 * HttpServletRequest request) {
		 * 
		 * log.info("goMCountPage >> : "); //log.info(param.getSmc_count());
		 * 
		 * ModelAndView mav = new ModelAndView(); String message = ""; HttpSession
		 * session = request.getSession(false); if(session != null) { List<SpoMasterVO>
		 * matchCountToday = spoMasterService.getMatchCountToday(param);
		 * List<SpoMasterVO> newMemberToday = spoMasterService.getNewMemberToday(param);
		 * log.info(param.getSmc_count()); log.info(param.getSmb_insertdate());
		 * mav.addObject("newCount", matchCountToday); mav.addObject("newMember",
		 * newMemberToday); mav.setViewName("master/spoMemberPage"); }else { message =
		 * "세션이 만료되었습니다. 로그인을 해주세요."; mav.addObject("message",message);
		 * mav.setViewName("login/loginForm"); } return mav;
		 * 
		 * }
		 * 
		 */
		/*******************************************************************************
						매칭건수 페이지(ajax통신용)
		******************************************************************************/
		@ResponseBody
		@RequestMapping(value="goMCountPage3", method = RequestMethod.POST)
		public ArrayList<HashMap<String, String>> goMCountPage3(@ModelAttribute SpoMasterVO param, Model model) {
		
		List<SpoMasterVO> listAlldate = spoMasterService.getMatchCountAll(param);
		ArrayList<HashMap<String, String>> allList = new ArrayList<HashMap<String, String>>();
		
		
		for(int i=0; i<listAlldate.size(); i++) {
				SpoMasterVO smvo = (SpoMasterVO)listAlldate.get(i);
				String allDate = smvo.getSmc_date();
				String allCount = smvo.getSmc_count();
				HashMap<String, String> m = new HashMap<String, String>();
				if(allDate == null) {
					allDate = "";
				}
				m.put("date", allDate);
				m.put("count", allCount);
				
				allList.add(m);
			}
				  return allList;
		}
//		/*******************************************************************************
//				매칭건수 페이지(ajax통신용)
//		******************************************************************************/
//		@RequestMapping(value="goMCountPage4", method = RequestMethod.POST)
//		public ModelAndView goMCountPage4(@ModelAttribute SpoMasterVO param, HttpServletRequest request) {
//		
//		log.info("goMCountPage >> : 매칭 검색 ");
//		
//		ModelAndView mav = new ModelAndView();
//		List<SpoMasterVO> matchCountToday = spoMasterService.getMatchCountToday(param);
//		List<SpoMasterVO> newMemberToday = spoMasterService.getNewMemberToday(param);
//		log.info(param.getSmc_count());
//		log.info(param.getSmb_insertdate());
//		mav.addObject("newCount", matchCountToday);
//		mav.addObject("newMember", newMemberToday);
//		mav.setViewName("master/spoCountGraph");
//		return mav;
//		}
		/*******************************************************************************
				매칭건수 페이지(ajax통신용)
		******************************************************************************/
		@ResponseBody
		@RequestMapping(value="goMCountPage5", method = RequestMethod.POST)
		public ArrayList<HashMap<String, String>> goMCountPage4(@ModelAttribute SpoMasterVO param, Model model) {
		//	listAllMemberdata
		List<SpoMasterVO> listAlldate = spoMasterService.getNewMemberCountAll(param);
		ArrayList<HashMap<String, String>> allList = new ArrayList<HashMap<String, String>>();
		
		
		for(int i=0; i<listAlldate.size(); i++) {
		SpoMasterVO smvo = (SpoMasterVO)listAlldate.get(i);
		String allDate = smvo.getSmb_date();
		String allCount = smvo.getSmb_count();
		log.info("선택한 기간 >>> : " + smvo.getSmb_date());
		log.info("선택한 기간동안의 회원가입건수 >>> : " + smvo.getSmb_count());
		HashMap<String, String> m = new HashMap<String, String>();
		//빈 그래프를 보여줄때 x축이 null값이 못뜨게 하기 위해 처리
		if(allDate == null) {
			allDate = "";
		}
		m.put("date", allDate);
		m.put("count", allCount);
		
		allList.add(m);
		}log.info("마지막 확인"+allList);
		  return allList;
		}
			
}