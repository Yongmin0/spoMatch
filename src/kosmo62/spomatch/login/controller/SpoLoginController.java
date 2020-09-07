package kosmo62.spomatch.login.controller;

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

import kosmo62.spomatch.common.SessionUtil;
import kosmo62.spomatch.login.service.SpoLoginService;
import kosmo62.spomatch.login.vo.SpoLoginVO;


@Controller	
public class SpoLoginController {
	
	private static Logger log = Logger.getLogger(SpoLoginController.class);
	
	@Autowired
	private SpoLoginService spoLoginService;
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		
		log.info("SpoLoginController loginForm >>> ");
		return "login/loginForm";
	}
	
	@RequestMapping("/mainPage")
	public String mainPage(Model m) {
		return "common/main";
	}
	
	@RequestMapping("/login")
	public ModelAndView login(@ModelAttribute SpoLoginVO param, HttpServletRequest request, Model model) {
		
		log.info("SpoLoginController login >>> ");
		log.info("SpoLoginController login param >>> " + param);
		log.info("SpoLoginController login id >>>" + param.getSmb_id());//받아오는값
		log.info("SpoLoginController login pw >>>" + param.getSmb_pw());//받아오는값
		String message = "";
		
		ModelAndView mav = new ModelAndView();
		List<SpoLoginVO> login = spoLoginService.login(param);
		int nCnt = login.size();
		log.info("SpoLoginController nCnt >>> " + nCnt);
		
		// 로우 카운트는 건수를 체크하는 것 
		// 건수가 있어도 컬럼은 null 일 수 가 있다. 
		if(nCnt > 0) {
			String smb_no = login.get(0).getSmb_no();
			String smb_id = login.get(0).getSmb_id();
			String smb_mf = login.get(0).getSmb_mf();
			String smb_approval_key = login.get(0).getSmb_approval_key(); 			
			
			if (smb_no != null && smb_no.length() > 0) {
			
				boolean bool = SessionUtil.newSession( request
						                              ,smb_no
						                              ,smb_mf);
				log.info("bool >>> " + bool);
				if (bool) {
					
					if("Y".equals(smb_approval_key.toUpperCase())) {
					// bool : true 이면 세션 부여
					message = "로그인 성공했습니다";
					mav.setViewName("common/main");
					mav.addObject("info", login);
				}else {
				
					message = "회원인증을 해주세요!";
					mav.addObject("message", message);
					mav.setViewName("login/logincheck");
				}
			}else {
				// 세션 이 있는 것 
				message = "이미 로그인 중인 아이디입니다";
				mav.setViewName("common/main");
				mav.addObject("info", login);	
			}	
		  }
	}else {
			message = "아이디 혹은 패스워드가 틀렸습니다.";
			mav.addObject("message", message);
			mav.setViewName("login/logincheck");	
		}
	
		
//	//	1. nCnt 가  1  인경우 and  SMB_APPROVAL_KEY 가 Y 
//		if(nCnt == 1 && smb_approval_key)
//	//		1.1 id  값으로 getSession을 이용해서 세션 여부 체크 
//	//		    없으면 세션 부여 
//	//		  있으면 로그인 중 
//	//	2. nCnt 가    1 이 아닌 경우 
//		
//		
//		
//		String message = "";
//		
//		//로그인 성공
//		if(nCnt > 0) {
//			SpoLoginVO slvo = login.get(0);
//			Boolean bool = SessionUtil.newSession(request, slvo.getSmb_no(), slvo.getSmb_mf());
//			if(bool) {
//				if(login != null && login.size() > 0) {
//					SpoLoginVO  = (SpoLoginVO)login;
//					String
//				}
//				message = "로그인 성공했습니다";
//				mav.setViewName("login/loginOK");
//				mav.addObject("info", login);
//			}else {
//				message = "이미 로그인 중인 아이디입니다";
//				mav.setViewName("login/loginOK");
//				mav.addObject("info", login);
//			}
//		//로그인 실패 DB값 없음
//		}else {
//			message = "아이디 혹은 패스워드가 틀렸습니다.";
//			mav.addObject("message", message);
//			mav.setViewName("login/logincheck");		
//		}
		
		log.info("SpoLoginController message >>> " + message);
		mav.addObject("login",login);
		return mav;
	}//end of login
	
	@RequestMapping("/logout")
	public ModelAndView logout(@ModelAttribute SpoLoginVO param, HttpServletRequest request){
		
		log.info("SpoLoginController logout >>> ");
		
		ModelAndView mav = new ModelAndView();
		Boolean bool = SessionUtil.killSession(request);
		if(bool) {
			//로그아웃 성공
			String message = "로그아웃 했습니다.";
			mav.addObject("message", message);
			mav.setViewName("login/logoutOK");
		}else {
			//로그아웃 실패
			String message = "세션이 만료되어 자동으로 로그아웃 되었습니다";
			mav.addObject("message", message);
			mav.setViewName("login/logoutOK");
		}
		return mav;
	}
	
	@RequestMapping("/findidForm")
	public ModelAndView findidForm(@ModelAttribute SpoLoginVO param) {
		
		log.info("SpoLoginController findidForm >>> ");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/findidForm");
		return mav;
	}
	
	@RequestMapping("/findid")
	public ModelAndView findid(@ModelAttribute SpoLoginVO param) {
		
		log.info("SpoLoginController findid >>> ");
		
		ModelAndView mav = new ModelAndView();
		List<SpoLoginVO> findid = spoLoginService.findid(param);
		mav.addObject("findid",findid);
		mav.setViewName("login/findid");
		return mav;
	}
	
	@RequestMapping("/findpwForm")
	public ModelAndView findpwForm(@ModelAttribute SpoLoginVO param) {
		
		log.info("SpoLoginController findpwForm >>> ");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/findpwForm");
		return mav;
	}
	
}
