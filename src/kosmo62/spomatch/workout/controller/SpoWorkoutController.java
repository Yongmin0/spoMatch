package kosmo62.spomatch.workout.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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

import kosmo62.spomatch.diet.service.SpoDietService;
import kosmo62.spomatch.diet.vo.SpoDietVO;
import kosmo62.spomatch.workout.service.SpoWorkoutService;
import kosmo62.spomatch.workout.vo.SpoWorkoutVO;


@Controller
public class SpoWorkoutController {
	private static Logger log = Logger.getLogger(SpoWorkoutController.class);
	@Autowired
	SpoWorkoutService spoWorkoutService;
	
	@Autowired
	SpoDietService spoDietService;
	
	//=====================================================================================================
	// 2020/09/01 workout 체중데이터 입력 코드 추가	
	//=====================================================================================================
	
	// ==================== 회원데이터에 체중입력여부 조회 ====================
	@RequestMapping("selectInfoWorkout")
	public ModelAndView selectInfo(@ModelAttribute("param") SpoDietVO param, HttpServletRequest req) {
		log.info("SpoWorkoutController selectInfo start");
		
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
		mav.setViewName("workout/weightInsertWorkout");
		
		log.info("SpoWorkoutController selectInfo end");
		return mav;
	}//End of selectInfo
		
	// ==================== 체중데이터 입력 ====================
	@RequestMapping("insertWeightWorkout")
	public ModelAndView insertWeightWorkout(@ModelAttribute("param") SpoDietVO param) {
		log.info("SpoWorkoutController insertWeightWorkout start");
		
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
			url = "redirect:workOutMain.spo?";
		}else {
			log.info("입력실패");
			mav.addObject("result","체중 입력에 오류가 있습니다");
			mav.setViewName("workout/workoutMain");
		}
		log.info(url);
		mav.setViewName(url);
		
		log.info("SpoWorkoutController insertWeightWorkout end");
		return mav;
	}//End of insertWeight

	// ==================== exersize 메인 페이지 ====================
	@RequestMapping("exerciseMain")
	public ModelAndView exerciseMain(@ModelAttribute("param") SpoWorkoutVO param, HttpServletRequest req) {
		log.info("SpoWorkoutController exerciseMain start");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("workout/exerciseMain");
		
		log.info("SpoWorkoutController exerciseMain end");
		return mav;
	}
	
	// ==================== 각 부위의 운동 조회 ====================
	@RequestMapping("selectExercise")
	public ModelAndView selectExercise(@ModelAttribute("param") SpoWorkoutVO param) {
		log.info("SpoWorkoutController selectExercise start");
		
		log.info("param.getSes_no() >>> "+param.getSes_no());
		List<SpoWorkoutVO> list = spoWorkoutService.selectExercise(param);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("workout/targetExercise");
		mav.addObject("exercise", list);
		log.info("SpoWorkoutController selectExercise end");
		return mav;
	}
	
	// ==================== 운동 상세정보 조회 ====================
	@RequestMapping("exerciseInfo")
	public ModelAndView exerciseInfo(@ModelAttribute("param") SpoWorkoutVO param) {
		log.info("SpoWorkoutController exerciseInfo start");
		
		log.info(param.getSes_name());
		List<SpoWorkoutVO> list = spoWorkoutService.exerciseInfo(param);
		log.info(list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("exerciseInfo",list);
		mav.setViewName("workout/exerciseInfo");
		log.info("SpoWorkoutController exerciseInfo end");
		return mav;
	}
	
	// ==================== 운동 루틴 입력 ====================
	@RequestMapping("insertWorkout")
	public ModelAndView insertWorkout(@ModelAttribute("param") SpoWorkoutVO param, HttpServletRequest req) {
		log.info("SpoWorkoutController insertWorkout start");
		
		log.info("insertWorkout param data >>> "+param.getSwo_name());
		log.info("insertWorkout param data >>> "+param.getSwo_weight());
		log.info("insertWorkout param data >>> "+param.getSwo_sets());
		log.info("insertWorkout param data >>> "+param.getSwo_count());
		log.info("insertWorkout param data >>> "+param.getSwo_workoutdate());
		
		ModelAndView mav = new ModelAndView();
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
		
		int result = spoWorkoutService.insertWorkout(param);
		String url = "";
		if(result >0){
			url = "workout/workoutCalendar";
			mav.setViewName(url);
		}else {
			mav.addObject("result", "입력 실패");
			mav.setViewName("diet/");
		}
		
		
		log.info("SpoWorkoutController insertWorkout end");
		return mav;
	}
	
	// ==================== workout Calendar 메인 페이지 ====================
	@RequestMapping("workoutMain")
	public ModelAndView workoutMain(@ModelAttribute("param") SpoWorkoutVO param, HttpServletRequest req) {
		log.info("SpoWorkoutController workoutMain start");
		
		//Session
		ModelAndView mav = new ModelAndView();
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
		List<SpoWorkoutVO> list = spoWorkoutService.selectCurWeight(param);
		log.info(list);
		
		if(list != null && list.size() > 0) {
			mav.setViewName("workout/workoutCalendar");
		}else {
			//오늘 체중 입력하지않으면 입력페이지로 이동
			mav.setViewName("workout/insertCurWeight");
		}
		
		log.info("SpoWorkoutController workoutMain end");
		return mav;
	}
	
	// ==================== 현재 체중 입력 ====================
	@RequestMapping("insertCurWeight")
	public ModelAndView insertCurWeight(@ModelAttribute("param") SpoWorkoutVO param, HttpServletRequest req) {
		log.info("SpoWorkoutController insertCurWeight start");
		
		
		log.info(param.getScw_curweight());
		ModelAndView mav = new ModelAndView();
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
		
		int result = spoWorkoutService.insertCurweight(param);
		String url = "";
		if(result > 0) {
			url = "redirect:workoutMain.spo";
		}else {
			url = "입력에 실패 했습니다";
		}
		mav.setViewName(url);
		log.info("SpoWorkoutController insertCurWeight end");
		return mav;
	}
	
	// ==================== workout 일정 삭제  ====================
	@RequestMapping("deleteWorkout")
	public ModelAndView deleteWorkout(@ModelAttribute("param") SpoWorkoutVO param) {
		log.info("SpoWorkoutController deleteWorkout start");

		log.info(param.getSwo_no());
		int result = spoWorkoutService.deleteWorkout(param);
		log.info("delete 결과 >>> "+result);
		String url = "";
		if(result > 0) {
			url = "workout/workoutCalendar";
		}else {
			url = "삭제에 실패했습니다";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(url);
		log.info("SpoWorkoutController deleteWorkout end");
		return mav;
	}
	
	// ==================== Ajax Calendar 이벤트 객체생성 ====================
	@RequestMapping("eventsWorkout")
	@ResponseBody
	public ArrayList<HashMap<String,String>> eventsWorkout(@ModelAttribute("param") SpoWorkoutVO param, HttpServletRequest req) {
		log.info("SpoWorkoutController eventsWorkout start");
		
		log.info(param.getSmb_no());
		
		List<SpoWorkoutVO> list = spoWorkoutService.eventsWorkout(param);
		System.out.println(list);
		
		// 배열객체 만들기
		ArrayList aList = new ArrayList();
		
		if(list != null && list.size() > 0) {
			for(int i=0; i<list.size(); i++) {
				SpoWorkoutVO swvo = (SpoWorkoutVO)list.get(i);
				String no = swvo.getSwo_no();
				String name = swvo.getSwo_name();
				String weight = swvo.getSwo_weight();
				String sets = swvo.getSwo_sets();
				String count = swvo.getSwo_count();
				String workDate = swvo.getSwo_workoutdate();
				String title = name + " " + weight + "kg " + sets + "set " + count + "회";
	
				log.info(" >>>> " +no);
				log.info(" >>>> " +name);
				log.info(" >>>> " +weight);
				log.info(" >>>> " +sets);
				log.info(" >>>> " +count);
				log.info(" >>>> " +workDate);
				log.info(title);
				
				try {
					SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date date = new Date(); 
					date = fm.parse(workDate); 
					
					HashMap m = new HashMap(); 				
					m.put("start", date);
					m.put("title", title);
					m.put("id",no);
					log.info(m);
					
					aList.add(m);
					log.info(aList);
					
				}catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
		
		log.info("SpoWorkoutController eventsWorkout end");
		return aList;
	}
	
	// ==================== Ajax Calendar 이벤트 객체생성 ====================
	@RequestMapping("chartWorkout")
	@ResponseBody
	public ArrayList<HashMap<String,String>> chartWorkout(@ModelAttribute("param") SpoWorkoutVO param){
		log.info("SpoWorkoutController chartWorkout start");
		
		log.info(param.getSmb_no());
		//목표 몸무게 조회
		String g_weight = "";
		List<SpoWorkoutVO> listMember = spoWorkoutService.selectMember(param);
		if(listMember != null && listMember.size() > 0) {
			SpoWorkoutVO smvo = (SpoWorkoutVO)listMember.get(0);
			g_weight = smvo.getSmb_g_weight();
		}
		
		//오늘기준 6일전까지의 몸무게 데이터 조회
		List<SpoWorkoutVO> list = spoWorkoutService.selectWeekWeight(param);
		log.info(list);
		
		// 배열객체 만들기
		ArrayList aList = new ArrayList();
		
		if(list != null && list.size() > 0) {
			for(int i=0; i<list.size(); i++) {
				SpoWorkoutVO swvo = (SpoWorkoutVO)list.get(i);
				log.info(swvo.getScw_curweight());
				log.info(swvo.getScw_date());
				String weight = swvo.getScw_curweight();
				String date = swvo.getScw_date();
				if(weight == null || weight.length() < 0) {
					weight = "0";
				}
				HashMap m = new HashMap(); 				
				m.put("x", swvo.getScw_date());
				m.put("y", weight);
				log.info(m);
				
				aList.add(m);
				log.info(aList);
					
			}
			HashMap m = new HashMap();
			m.put("x", "목표 몸무게");
			m.put("y", g_weight);
			
			aList.add(m);
		}
		log.info(aList);
		
		log.info("SpoWorkoutController chartWorkout end");
		return aList;
	}
}
