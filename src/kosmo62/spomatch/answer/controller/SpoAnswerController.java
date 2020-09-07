package kosmo62.spomatch.answer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosmo62.spomatch.answer.service.SpoAnswerService;
import kosmo62.spomatch.answer.vo.SpoAnswerVO;

@Controller
@RequestMapping(value="/answer")
public class SpoAnswerController {
	private static Logger log = Logger.getLogger(SpoAnswerController.class);
	
	@Autowired
	private SpoAnswerService spoAnswerService;
	
	/*댓글 목록*/
	@ResponseBody
	@RequestMapping(value="/listAnswer", produces="application/json; charset=utf-8")
	public Map<String, Object> listAnswer(@ModelAttribute SpoAnswerVO savo, Model model){
		log.info("SpoAnswerController listAnswer 호출");
		log.info("데이터 확인 savo.siq_no >> : " + savo.getSiq_no());
		
		List<SpoAnswerVO> listAnswer = spoAnswerService.listAnswer(savo);
		
		log.info("조회성공한 댓글 갯수 >>> listAnswerSize : " + listAnswer.size());
		int listAnswerSize = listAnswer.size();
		for(int i=0; i<listAnswerSize; i++) {
			SpoAnswerVO savoo = (SpoAnswerVO)listAnswer.get(i);
			log.info("savoo.getSaw_no() :: " + savoo.getSaw_no());
			log.info("savoo.getSaw_content() :: " + savoo.getSaw_content());
			log.info("savoo.getSaw_deleteyn() :: " + savoo.getSaw_deleteyn());
			log.info("savoo.getSaw_insertdate() :: " + savoo.getSaw_insertdate());
			log.info("savoo.getSaw_updatedate() :: " + savoo.getSaw_updatedate());
			log.info("savoo.getSiq_no() :: " + savoo.getSiq_no());
		}
		
		Map<String, Object> m = new HashMap<String, Object>();
		
		m.put("listAnswer", listAnswer);
		log.info("listAnswer m >> : " + m);
		return m;
	}// end of 댓글 목록
	
	/*댓글 입력*/
	@ResponseBody
	@RequestMapping(value="/insertAnswer", produces="application/json; charset=utf-8")
	public String insertAnswer(@ModelAttribute SpoAnswerVO savo) {
		log.info("SpoAnswerController insertAnswer 호출");
		log.info("데이터 확인 insertAnswer || savo.getSiq_no() >> : " + savo.getSiq_no());
		log.info("데이터 확인 insertAnswer || savo.getSaw_content() >> : " + savo.getSaw_content());
		
		
		int insertAnswernCnt = spoAnswerService.insertAnswer(savo);
		
		
		String insertResult = "";
		
		if(insertAnswernCnt == 1) {
			log.info("int insertAnswernCnt >> : " + insertAnswernCnt);
			insertResult = "댓글 입력 성공.";
		}else {
			log.info("int insertAnswernCnt >> : " + insertAnswernCnt);
			insertResult = "댓글 입력 문제 발생";
		}
		
		return insertResult;
	}
	/*댓글 수정*/
	@ResponseBody
	@RequestMapping(value="/updateAnswer", produces="application/json; charset=utf-8")
	public String updateAnswer(@ModelAttribute SpoAnswerVO savo) {
		log.info("SpoAnswerController updateAnswer 호출");
		log.info("데이터 확인 updateAnswer || savo.getSiq_no() >> : " + savo.getSiq_no());
		log.info("데이터 확인 updateAnswer || savo.getSaw_no() >> : " + savo.getSaw_no());
		log.info("데이터 확인 updateAnswer || savo.getSaw_content() >> : " + savo.getSaw_content());
		
		int updateAnswernCnt = spoAnswerService.updateAnswer(savo);
		
		String updateResult = "";
		
		if(updateAnswernCnt == 1) {
			log.info("updateAnswer || updateAnswernCnt >> : " + updateAnswernCnt);
			updateResult = "댓글 수정 성공.";
		}else {
			log.info("updateAnswer || updateAnswernCnt >> : " + updateAnswernCnt);
			updateResult = "댓글 수정 실패.";
		}
		
		return updateResult;
	}
	
	/*댓글 삭제*/
	@ResponseBody
	@RequestMapping(value="/deleteAnswer", produces="application/json; charset=utf-8")
	public String deleteAnswer(@ModelAttribute SpoAnswerVO savo) {
		log.info("SpoAnswerController deleteAnswer 호출");
		log.info("데이터 확인 updateAnswer || savo.getSiq_no() >> : " + savo.getSiq_no());
		log.info("데이터 확인 updateAnswer || savo.getSaw_no() >> : " + savo.getSaw_no());
		
		int deleteAnswernCnt = spoAnswerService.deleteAnswer(savo);
		
		String deleteResult = "";
		
		if(deleteAnswernCnt == 1) {
			log.info("updateAnswer || updateAnswernCnt >> : " + deleteAnswernCnt);
			deleteResult = "댓글 삭제 성공.";
		}else {
			log.info("updateAnswer || updateAnswernCnt >> : " + deleteAnswernCnt);
			deleteResult = "댓글 삭제 실패.";
		}
		
		return deleteResult;
	}
}
