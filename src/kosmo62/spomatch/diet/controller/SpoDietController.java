package kosmo62.spomatch.diet.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosmo62.spomatch.diet.vo.SpoDietVO;
import kosmo62.spomatch.common.ReadJson;
import kosmo62.spomatch.diet.service.SpoDietService;

@Controller
public class SpoDietController {
	private static Logger log = Logger.getLogger(SpoDietController.class);
	@Autowired
	private SpoDietService spoDietService;
	
	//=====================================================================================================
	// 2020/09/01 itemInfo dailycal 값 전달코드 수정
	//=====================================================================================================
	
// ========================================회원정보에 키,몸무게 정보가 없을 때========================================
	
	// ==================== 회원데이터에 체중입력여부 조회 ====================
	@RequestMapping("selectInfoDiet")
	public ModelAndView selectInfo(@ModelAttribute("param") SpoDietVO param, HttpServletRequest req) {
		log.info("SpoDietController selectInfo start");
		
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
		
		//회원테이블에 체중데이터 조회
		List<SpoDietVO> list = spoDietService.selectInfo(param);
		
		mav.addObject("weightList",list);
		mav.setViewName("diet/weightInsertDiet");
		
		log.info("SpoDietController selectInfo end");
		return mav;
	}//End of selectInfo

	// ==================== 체중데이터 입력 ====================
	@RequestMapping("insertWeightDiet")
	public ModelAndView insertWeight(@ModelAttribute("param") SpoDietVO param) {
		log.info("SpoDietController insertWeight start");
		
		log.info(" >>>> "+param.getSmb_no());
		log.info(" >>>> "+param.getSmb_height());
		log.info(" >>>> "+param.getSmb_weight());
		log.info(" >>>> "+param.getSmb_g_weight());
		log.info(" >>>> "+param.getSmb_activity());
		log.info(" >>>> "+param.getSmb_dailycal());
		
		ModelAndView mav = new ModelAndView();
		
		//체중과 활동지수로 일일 칼로리 권장량을 계산
		BigDecimal hei = new BigDecimal(param.getSmb_height());
		BigDecimal act = new BigDecimal(param.getSmb_activity());
		String dailycal =  String.valueOf(hei.subtract(new BigDecimal("100")).multiply(new BigDecimal("0.9")).multiply(act));
		log.info(dailycal);
		param.setSmb_dailycal(dailycal);
		
		int result = spoDietService.insertWeight(param);
		String url = "";
		if(result > 0) {
			log.info("입력성공");
			url = "redirect:listDiet.spo?";
		}else {
			log.info("입력실패");
			mav.addObject("result","체중 입력에 오류가 있습니다");
			mav.setViewName("diet/weightInsert");
		}
		log.info(url);
		mav.setViewName(url);
		
		log.info("SpoDietController insertWeight end");
		return mav;
	}//End of insertWeight
	
// ========================================회원정보에 키,몸무게 정보가 있을 때========================================

	// ==================== 오늘 날짜 식단데이터 조회  ====================
	@RequestMapping("listDiet")
	public ModelAndView listDiet(@ModelAttribute("param") SpoDietVO param, HttpServletRequest req) {
		log.info("SpoDietController listDiet start");
		
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
			List<SpoDietVO> memberList = spoDietService.memberInfo(param);
			if(memberList != null && memberList.size() > 0) {
				for(int i=0; i<memberList.size(); i++) {
					SpoDietVO sd = (SpoDietVO)memberList.get(i);
					String no = sd.getSmb_no();
					String id = sd.getSmb_id();
					String cal = sd.getSmb_dailycal();
					log.info(no);
					log.info(id);
					log.info(cal);
					param.setSmb_no(no);
					param.setSmb_id(id);
					param.setSmb_dailycal(cal);
				}
			}
		}	
		
		//오늘날짜데이터 이동
		Date today = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		String date = format.format(today);
		log.info(date);
		param.setSdi_dietdate(date);
		
		List<SpoDietVO> list = spoDietService.listDiet(param);
		log.info(list);
		if(list != null && list.size() > 0) {
			//식단 데이터 전달
			mav.addObject("list",list);
		}else {
			//오늘 날짜에 식단데이터가 없으면 날짜 데이터 전달
			mav.addObject("date",param);
		}
		mav.setViewName("/diet/dietList");
		
		log.info("SpoDietController listDiet end");
		return mav;
	}//End of listDiet
	
	// ==================== 날짜 검색 식단데이터 조회  ====================
	@RequestMapping("selectDiet")
	public ModelAndView selectDiet(@ModelAttribute("param") SpoDietVO param, HttpServletRequest req) {
		log.info("SpoDietController selectDiet start");
		
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
			List<SpoDietVO> memberList = spoDietService.memberInfo(param);
			if(memberList != null && memberList.size() > 0) {
				for(int i=0; i<memberList.size(); i++) {
					SpoDietVO sd = (SpoDietVO)memberList.get(i);
					String no = sd.getSmb_no();
					String id = sd.getSmb_id();
					String cal = sd.getSmb_dailycal();
					log.info(no);
					log.info(id);
					log.info(cal);
					param.setSmb_no(no);
					param.setSmb_id(id);
					param.setSmb_dailycal(cal);
				}
			}
		}	
		
		log.info(param.getSdi_dietdate());
		List<SpoDietVO> list = spoDietService.selectDiet(param);
		if(list != null && list.size() > 0) {
			//식단 데이터 전달
			mav.addObject("list",list);
		}else {
			//오늘 날짜에 식단데이터가 없으면 날짜 데이터 전달
			mav.addObject("date",param);
		}
		mav.setViewName("/diet/dietList");
		
		log.info("SpoDietController selectDiet end");
		return mav;
	}//End of selectDiet
	
	// ==================== 식단데이터 입력폼  ====================
	@RequestMapping("insertDietForm")
	public ModelAndView insertDietForm(@ModelAttribute("param") SpoDietVO param, HttpServletRequest req) {
		log.info("SpoDietController insertDietForm start");
		
		log.info("req.getSdi_dietdate() >>> "+req.getParameter("_sdi_dietdate"));
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
			List<SpoDietVO> memberList = spoDietService.memberInfo(param);
			if(memberList != null && memberList.size() > 0) {
				for(int i=0; i<memberList.size(); i++) {
					SpoDietVO sd = (SpoDietVO)memberList.get(i);
					String no = sd.getSmb_no();
					String id = sd.getSmb_id();
					String cal = sd.getSmb_dailycal();
					log.info(no);
					log.info(id);
					log.info(cal);
					param.setSmb_no(no);
					param.setSmb_id(id);
					param.setSmb_dailycal(cal);
				}
			}
		}	
		param.setSdi_dietdate(req.getParameter("_sdi_dietdate"));
		
		mav.addObject("date",param);
		mav.setViewName("diet/dietInsertForm");
		
		
		log.info("SpoDietController insertDietForm end");
		return mav;
	}//End of insertDietForm
	
	// ==================== 식단데이터 입력  ====================
	@RequestMapping("insertDiet")
	public ModelAndView insertDiet(@ModelAttribute("param") SpoDietVO param, HttpServletRequest req) {
		log.info("SpoDietController insertDiet start");
		
		log.info("param.getSdi_breakfast >>> "+param.getSdi_breakfast());
		log.info("param.getSdi_lunch >>> "+param.getSdi_lunch());
		log.info("param.getSdi_dinner >>> "+param.getSdi_dinner());
		log.info("param.getSdi_cal >>> "+param.getSdi_cal());
		log.info("param.getSdi_tan >>> "+param.getSdi_tan());
		log.info("param.getSdi_dan >>> "+param.getSdi_dan());
		log.info("param.getSdi_fat >>> "+param.getSdi_fat());
		log.info("param.getSdi_sugar >>> "+param.getSdi_sugar());
		log.info("param.getSdi_salt >>> "+param.getSdi_salt());
		log.info("param.getSdi_salt >>> "+param.getSdi_col());
		log.info("param.getSdi_salt >>> "+param.getSdi_fatacid());
		log.info("param.getSdi_salt >>> "+param.getSdi_trans());
		log.info("param.getParameter(\"_sdi_dietdate\")>>> "+req.getParameter("_sdi_dietdate"));
		param.setSdi_dietdate(req.getParameter("_sdi_dietdate"));
		//Session
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
			List<SpoDietVO> memberList = spoDietService.memberInfo(param);
			if(memberList != null && memberList.size() > 0) {
				for(int i=0; i<memberList.size(); i++) {
					SpoDietVO sd = (SpoDietVO)memberList.get(i);
					String no = sd.getSmb_no();
					String id = sd.getSmb_id();
					String cal = sd.getSmb_dailycal();
					log.info(no);
					log.info(id);
					log.info(cal);
					param.setSmb_no(no);
					param.setSmb_id(id);
					param.setSmb_dailycal(cal);
				}
			}
		}	
		int result = spoDietService.insertDiet(param);
		mav.addObject("Insert",result);
		mav.addObject("date",param);
		mav.setViewName("diet/result");
		
		log.info("SpoDietController insertDiet end");
		return mav;
	}//End of insertDiet
	
	
	
	// ==================== 식단데이터 삭제  ====================
	@RequestMapping("deleteDiet")
	public ModelAndView deleteDiet(@ModelAttribute("param") SpoDietVO param, HttpServletRequest req) {
		log.info("SpoDietController deleteDiet start");
		
		log.info("param data >>> "+param.getSdi_dietdate());
		log.info("req data >>> "+req.getParameter("u_sdi_dietdate"));

		//Session
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
			List<SpoDietVO> memberList = spoDietService.memberInfo(param);
			if(memberList != null && memberList.size() > 0) {
				for(int i=0; i<memberList.size(); i++) {
					SpoDietVO sd = (SpoDietVO)memberList.get(i);
					String no = sd.getSmb_no();
					String id = sd.getSmb_id();
					String cal = sd.getSmb_dailycal();
					log.info(no);
					log.info(id);
					log.info(cal);
					param.setSmb_no(no);
					param.setSmb_id(id);
					param.setSmb_dailycal(cal);
				}
			}
		}	
		param.setSdi_dietdate(req.getParameter("u_sdi_dietdate"));
		
		int result = spoDietService.deleteDiet(param);
		String url = "";
		if(result > 0) {
			url = "redirect:selectDiet.spo?sdi_dietdate="+param.getSdi_dietdate();
		}else {
			url = "삭제가 실패했습니다";
		}
		mav.addObject("result",url);
		mav.setViewName(url);
		log.info("SpoDietController deleteDiet end");
		return mav;
	}//End of deleteDiet
	
	// ==================== 식품정보 검색창으로 이동  ====================
	@RequestMapping("itemInfo")
	public ModelAndView itemInfo(@ModelAttribute("param") SpoDietVO param, HttpServletRequest req) {
		log.info("SpoDietController itemInfo start");
		
		log.info(param.getSmb_dailycal());
		log.info(req.getParameter("_sdi_dietdate"));
		log.info(req.getParameter("mealFlag"));
		String mealFlag = req.getParameter("mealFlag");
		ModelAndView mav = new ModelAndView();
		mav.addObject("flag", mealFlag);
		mav.addObject("dailycal", param.getSmb_dailycal());
		mav.setViewName("diet/itemInfo");
		
		log.info("SpoDietController itemInfo end");
		return mav;
	}//End of itemInfo
	
	// ==================== JSON Data Read ====================
	@RequestMapping(value="readJSON", produces="application/text; charset=UTF-8")
	@ResponseBody
	public String ajaxJSONRead(@ModelAttribute("param") SpoDietVO param, HttpServletRequest req, HttpServletResponse res) {
		log.info("SpoDietController ajaxJSONRead start");
		res.setContentType("text/html; charset=UTF-8");
		
		log.info("ajax data >>> "+ req.getParameter("url"));
		log.info("ajax data >>> "+ req.getParameter("item"));
		
		//ajax에서 넘어온 data
		String url = req.getParameter("url");
		String itemName = req.getParameter("item");
		
		//선택한 항목으로 검색할때 공백을 빼고 공백앞의 값만 가져옴
		String itemSearch[] = itemName.split(" ");
		for(int i=0; i<itemSearch.length; i++) {
			log.info("item 배열크기 >>> "+itemSearch[i]);
		}
		String searchUrl = url + itemSearch[0];
		
		//결과 값을 넣을 변수
		JSONObject resultData = null;
		
		//common.util의 ReadJson class로 URL을 jsondata로 변환
		String jsonData = ReadJson.readJsonUrl(searchUrl);
		log.info("json 변환 >>> "+jsonData);
		
		try {
			//JSONparser 참조변수
			JSONParser parser = new JSONParser();
			//문자열로 변환한 JSON데이터를 JSON형식으로 파싱 
			Object obj = parser.parse(jsonData);
			JSONObject jsonObj = (JSONObject)obj;
			
			//JSON데이터의 key값이 I2790인 리터럴객체 데이터를 찾음
			JSONObject i2790 = (JSONObject)jsonObj.get("I2790");
			log.info("i2790 >>>>>>> "+i2790);
			//JSON데이터의 key값이 row인 객체배열 데이터를 찾음
			JSONArray row = (JSONArray)i2790.get("row");
			log.info("row >>>>>>> "+row);
			
			for(int i=0; i<row.size(); i++){
				//JSON데이터의 key값이 row[i]인 리터럴객체  데이터를 찾음
				JSONObject rowIdx = (JSONObject)row.get(i);
				log.info("rowIdx >>>>>>> "+rowIdx);
				//JSON데이터의 key값이 DESC_KOR인 value값을 찾음
				String item = (String)rowIdx.get("DESC_KOR");
				log.info(item);
				//선택한 항목의 이름값과 검색된 객체의 이름값이 같으면 
				//해당 객체를 resultData에 대입
				if(itemName.equals(item)) {
					resultData = rowIdx;
				}
			}
			log.info("resultData >>> "+resultData);
		}catch(Exception e) {
			System.out.println("error >>> "+e.getMessage());
		}
		/*
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", resultData.toJSONString());
		mav.setViewName("diet/itemInfo");
		log.info(mav);
		 */
		 
		log.info("SpoDietController ajaxJSONRead end");
		return resultData.toJSONString();
	}//End of ajaxJsonRead
	
}
