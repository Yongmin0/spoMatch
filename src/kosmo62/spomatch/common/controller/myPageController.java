package kosmo62.spomatch.common.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kosmo62.spomatch.member.service.SpoMemberService;
import kosmo62.spomatch.member.vo.SpoMemberVO;

@Controller
public class myPageController {
	private Logger log = Logger.getLogger(myPageController.class);
	
	@Autowired
	private SpoMemberService spoMemberService;
	
	@RequestMapping("myPage")
	public String myPage(@ModelAttribute SpoMemberVO param) {
		log.info("myPageController myPage start");
		log.info("myPageController myPage param" + param);
		log.info("myPageController myPage end");
		return "/myPage/myPage";
	}
	
}
