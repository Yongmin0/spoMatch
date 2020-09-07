package kosmo62.spomatch.question.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosmo62.spomatch.answer.service.SpoAnswerService;
import kosmo62.spomatch.answer.vo.SpoAnswerVO;
import kosmo62.spomatch.question.service.SpoQuestionService;
import kosmo62.spomatch.question.vo.SpoQuestionVO;

@Controller
//@RequestMapping(value="question")
public class SpoQuestionController {
	private static Logger log = Logger.getLogger(SpoQuestionController.class);
	
	@Autowired
	private SpoQuestionService spoQuestionService;
	
	@Autowired
	private SpoAnswerService spoAnswerService;
	
	/*전체조회*/
	@RequestMapping("listBoard")
	public ModelAndView listBoard(@ModelAttribute SpoQuestionVO param, HttpServletRequest req) {
		log.info("SpoQuestionController listBoard 시작");
		log.info("SpoQuestionController listBoard param >> : " + param);
		
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
			param.setSmb_no(smb_no);
		}
		
		List<SpoQuestionVO> boardlist = spoQuestionService.listBoard(param);
		log.info("SpoQuestionController listBoard list >> : " + boardlist);
		
		int listCnt = boardlist.size();
		for(int i=0; i < listCnt; i++) {
			SpoQuestionVO svo = (SpoQuestionVO)boardlist.get(i);
			log.info("svo.getSiq_no() >> : " + svo.getSiq_no());
			log.info("svo.getSiq_subject() >> : " + svo.getSiq_subject());
			log.info("svo.getSiq_content() >> : " + svo.getSiq_content());
			log.info("svo.getSiq_deleteyn() >> : " + svo.getSiq_deleteyn());
			log.info("svo.getSiq_insertdate() >> : " + svo.getSiq_insertdate());
			log.info("svo.getSiq_updatedate() >> : " + svo.getSiq_updatedate());
			log.info("svo.getSmb_no() >> : " + svo.getSmb_no());
			log.info("svo.getSpg_tableno() >> : " + svo.getSpg_tableno());
			log.info("svo.getAncnt() >> : " + svo.getAncnt());
			
		}
		
		mav.addObject("listBoard", boardlist);  // == request.setAttribute;
		mav.setViewName("question/listBoard");
		log.info("SpoQuestionController listBoard list mav >> : " + mav);
		log.info("SpoQuestionController listBoard list 끝!");
		return mav;
	}
	
	/*상세 조회*/
	@RequestMapping("detailBoard")
	public ModelAndView detailBoard(@ModelAttribute SpoQuestionVO param, HttpServletRequest req) {
		log.info("SpoQuestionController detailBoard 호출 시작");
		log.info("SpoQuestionController detailBoard param >> : " + param);
		
		log.info("param.getSiq_no() >> : "+param.getSiq_no());
		
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
			param.setSmb_no(smb_no);
		}
		
		List<SpoQuestionVO> detailBoard = spoQuestionService.detailBoard(param);
		int result = detailBoard.size();
		log.info("SpoQuestionController result >> : " + result);
		
		mav.addObject("detailBoard", detailBoard);
		mav.setViewName("question/detailBoard");
		log.info("SpoQuestionController detailBoard mav >> : " + mav);
		log.info("SpoQuestionController detailBoard 끝");
		
		return mav;
	}
	
	/*글쓰기 폼 출력하기*/
	@RequestMapping("writeForm")
	public ModelAndView writeForm() {
		log.info("글쓰기 폼 호출 성공");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("question/writeForm");
		return mav;
	}
	
	
	@RequestMapping("insertBoard")
	public ModelAndView insertBoard(@ModelAttribute SpoQuestionVO param, HttpServletRequest req) {
		log.info("SpoQuestionController insertBoard 호출 시작");
		
		log.info("parma >>> "+param.getSiq_no());
		log.info("parma >>> "+param.getSiq_subject());
		log.info("parma >>> "+param.getSiq_content());
		log.info("parma >>> "+param.getSiq_deleteyn());
		log.info("parma >>> "+param.getSiq_insertdate());
		log.info("parma >>> "+param.getSiq_updatedate());
		
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
			param.setSmb_no(smb_no);
		}
		
		int result = spoQuestionService.insertBoard(param);
		log.info("insertBoard의 result값 >>>> " + result);
		String url = "";
		
		if(result > 0) {
			url = "redirect:listBoard.spo";
		}else {
			url = "redirect:writeForm.spo";
		}
		
		log.info(url);
		mav.setViewName(url);
		
		log.info("SpoQuestionController insertBoard 호출 끝");
		return mav;
	}
	
	/*수정*/
	@RequestMapping("updateBoard")
	public ModelAndView updateBoard(@ModelAttribute SpoQuestionVO param, HttpServletRequest req) {
		log.info("SpoQuestionController updateBoard 호출 시작");
		
		log.info("updateBoard param.getSiq_no() >> : "+param.getSiq_no());
		log.info("updateBoard param.getSiq_subject() >> : "+param.getSiq_subject());
		log.info("updateBoard param.getSiq_content() >> : "+param.getSiq_content());
		log.info("updateBoard param.getSiq_deleteyn() >> : "+param.getSiq_deleteyn());
		log.info("updateBoard param.getSiq_insertdate() >> : "+param.getSiq_insertdate());
		log.info("updateBoard param.getSiq_updatedate() >> : "+param.getSiq_updatedate());
		log.info("updateBoard param.getSmb_no() >> : "+param.getSmb_no());
		log.info("updateBoard param.getSmb_no() >> : "+param.getSmb_id());
		
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
			param.setSmb_no(smb_no);
		}
		
		int result = spoQuestionService.updateBoard(param);
		String url = "";
		log.info("updateBoard의 result 값 >> : " + result);
		
		if(result > 0) {
			url = "redirect:detailBoard.spo?siq_no=" + param.getSiq_no();
		}else {
			url = "redirect:listBoard.spo";
		}
		
		mav.addObject("updateBoard", result);
		mav.setViewName(url);
		return mav;
	}
	/*삭제*/
	@RequestMapping("deleteBoard")
	public ModelAndView deleteBoard(@ModelAttribute SpoQuestionVO param, HttpServletRequest req) {
		log.info("SpoQuestionController deleteBoard 호출 시작");
		
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
			param.setSmb_no(smb_no);
		}
		
		int result = spoQuestionService.deleteBoard(param);
		log.info("deleteBoard의 result 값 >> : " + result);
		String url = "";
		if(result > 0) {
			url = "redirect:detailBoard.spo?siq_no=" + param.getSiq_no();
		}else {
			url = "삭제 과정중에 문제가 발생했습니다.";
		}
		
		mav.addObject("result", url);
		mav.setViewName("result");
		
		return mav;
	}
}
