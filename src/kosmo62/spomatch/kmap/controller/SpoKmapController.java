package kosmo62.spomatch.kmap.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosmo62.spomatch.kmap.service.SpoKmapService;
import kosmo62.spomatch.kmap.vo.SpoKmapVO;


//@Controller
@Controller
public class SpoKmapController {

	private static Logger log = Logger.getLogger("SpoKmapController.class");

	@Autowired
	private SpoKmapService spoKmapService;
	
		/*******************************************************************************
			
		*******************************************************************************/
		@RequestMapping(value="goMapTotal")
		public ModelAndView goTotalPage(@ModelAttribute SpoKmapVO param, HttpServletRequest request) {
		
		log.info("goMapTotal >>> : ");
		String message = "";
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession(false);
		if(session != null) {
		mav.setViewName("map/totalMapPage2");
		}else{
			message =  "세션이 만료되었습니다. 로그인을 해주세요.";
			mav.addObject("message",message);
			mav.setViewName("login/loginForm");
		}
		return mav;
		}

		
	// =======================================
	@RequestMapping("kakaoMapData")
	@ResponseBody
	public ArrayList<HashMap<String, String>> kakaoMapData(@ModelAttribute("param") SpoKmapVO param) {
		log.info("SpoKmapController kakaoMapData>>> : ");
		
		SpoKmapVO searchVO = new SpoKmapVO();
		searchVO.setSearchFilter(param.getSearchFilter());
		searchVO.setKeyword(param.getKeyword());

		List<SpoKmapVO> list = spoKmapService.kakaoMapData(param);
		log.info(param.getKeyword());
		log.info(param.getSearchFilter());
	
		ArrayList aList = new ArrayList();
		log.info("if>>> ");
		if (list != null && list.size() > 0) {
			
			for (int i = 0; i < list.size(); i++) {
				SpoKmapVO kvo = (SpoKmapVO) list.get(i);
				String content = kvo.getSmp_content();
				String no = kvo.getSmp_no();
				String name = kvo.getSmp_name();
				String addr = kvo.getSmp_addr();
				String hp = kvo.getSmp_hp();
				String x = kvo.getSmp_x();
				String y = kvo.getSmp_y();
				
				try {
					HashMap m = new HashMap();
					m.put("id", no);
					m.put("content", content);
					m.put("hp", hp);
					m.put("name",name);
					m.put("x", x);
					m.put("y", y);

					aList.add(m);
					

				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}else {
			log.info("List<SpoKmapVO> list = spoKmapService.kakaoMapData(param) null!!! ");
		}
		log.info("SpoKmapController kakaoMapData end >>> : ");
		return aList;

	}// end of kakaoMapData
	
	@RequestMapping(value="goMapPage2", method = RequestMethod.POST)
	public String memberPage2(@ModelAttribute SpoKmapVO param, HttpServletRequest req) {
	
	log.info("goMapPage2 >> :");
	
	
	return "map/searchMap";
	}
	
	@RequestMapping(value="goMapPage3", method = RequestMethod.POST)
	public String memberPage3(@ModelAttribute SpoKmapVO param, HttpServletRequest req) {
	
	log.info("goMapPage3 >> : ");
	
	
	return "map/findNearBy";
	}
	

}
