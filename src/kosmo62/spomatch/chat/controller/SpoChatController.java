package kosmo62.spomatch.chat.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosmo62.spomatch.chat.service.SpoChatService;
import kosmo62.spomatch.chat.vo.SpoChatVO;


@Controller
//@RequestMapping("/Chat")
public class SpoChatController {
	private Logger log = Logger.getLogger(SpoChatController.class);
	
	@Autowired
	private SpoChatService spoChatService;
	
	
	@RequestMapping("chat")
	public ModelAndView chat(@ModelAttribute SpoChatVO param, HttpServletRequest request){
		log.info("SpoChatController chat start >>>");
		ModelAndView mav = new ModelAndView();
		// 세션 확인 
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			log.info("SpoMatchController chat smb_no >>>" + smb_no);
			mav.setViewName("/chat/chat");
		}else {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("/login/loginForm");
			return mav;
		}
		log.info("SpoChatController chat end >>>");
		return mav;
	}
	
	// socket을 이용한 채팅 구현 연습 예정
	@RequestMapping("socketChat")
	public ModelAndView socketChat(@ModelAttribute SpoChatVO param){
		log.info("SpoChatController socketChat start >>>");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/chat/socketChat");
		log.info("SpoChatController socketChat end >>>");
		return mav;
	}
	
	
	
	@RequestMapping("listMatchChat")
	@ResponseBody
	public List<SpoChatVO> listMatchChat(@ModelAttribute SpoChatVO param, HttpServletRequest request){
		log.info("SpoChatController listMatchChat start >>>");
		log.info("SpoChatController listMatchChat param >>>" + param);
		ModelAndView mav = new ModelAndView();
		// 세션 확인 
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			log.info("SpoMatchController mypageListMatch smb_no >>>" + smb_no);
			// 접속한 no를 resiver에 set해준다.
			param.setSch_resiver(smb_no);
			mav.setViewName("/chat/chat");
		}else {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("/login/loginForm");
		}
		List<SpoChatVO> svo = spoChatService.listMatchChat(param);
		log.info("SpoChatController listMatchChat end >>>");
		return svo;
	}
	
	@RequestMapping("selectChat")
	@ResponseBody
	public List<SpoChatVO> selectChat(@ModelAttribute SpoChatVO param, HttpServletRequest request) {
		log.info("SpoChatController selectChat start >>>");
		log.info("SpoChatController selectChat param >>>" + param.getSmc_no());
		log.info(">>>>>" + param.getSmc_no());
		ModelAndView mav = new ModelAndView();
		// 세션 확인 
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			log.info("SpoMatchController mypageListMatch smb_no >>>" + smb_no);
			param.setSch_resiver(smb_no);
			mav.setViewName("/chat/chat");
			log.info(">>>>>" + param.getSch_resiver());
		}else {
			mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
			mav.setViewName("/login/loginForm");
			return null;
		}
		int checkCnt = spoChatService.checkChat(param);
		List<SpoChatVO> svo = spoChatService.selectChat(param);
		
		log.info(svo);
		
		log.info("SpoChatController selectChat end >>>");
		return svo;
	}
	
	@RequestMapping("sendChat")
	@ResponseBody
	public String sendChat(@ModelAttribute SpoChatVO param) {
		log.info("SpoChatController sendChat start >>>");
		log.info("SpoChatController sendChat param >>>" + param);
		log.info(">>>>>>>>>"+ param.getSmc_no());
		log.info(">>>>>>>>>"+ param.getSmb_no());
		log.info(">>>>>>>>"+ param.getSch_chat());
		int nCnt =0;
		List<SpoChatVO> list = spoChatService.listMemberChat(param);
		log.info(list);
		log.info("list.size() >>>>>>>>>>>" + list.size());
		for(SpoChatVO svo : list) {
			param.setSch_resiver(svo.getSch_resiver());
			log.info(param.getSch_resiver());
			 int resultSend = spoChatService.sendChat(param);
			 if( resultSend > 0 ) {
				 nCnt ++;
			 }
		}
		String result = "";
		System.out.println("SpoChatController sendChat result >>>" + result);
		if(nCnt >= 1) {
			result = "ok";
		}else {
			result = "fail";
		}
		
		log.info("SpoChatController sendChat result >>>" + result);
		log.info("SpoChatController sendChat end >>>");
		return result;
	}
	
	
	
}
