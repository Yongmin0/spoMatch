package kosmo62.spomatch.comment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kosmo62.spomatch.comment.service.SpoCommentService;
import kosmo62.spomatch.comment.vo.SpoCommentVO;

@Controller
public class SpoCommentController {
	
	private static Logger log = Logger.getLogger(SpoCommentController.class);
	
	@Autowired
	private SpoCommentService spoCommentService;
	
	@ResponseBody
	@RequestMapping("/listcomment")
	public Map<String,Object> listcomment(@ModelAttribute SpoCommentVO param, Model model){
		
		log.info("SpoCommentController listcomment >>> ");
		log.info("SpoCommentController listcomment param>>> " + param);
		log.info("SpoCommentController listcomment param>>> " + param.getSmb_no());//데이터확인
		
		List<SpoCommentVO> listcomment = spoCommentService.listcomment(param);
		log.info("조회성공한 댓글갯수 >>> " + listcomment.size());
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("listcomment", listcomment);
		
		return map;
	}//end of listcomment
	
	@ResponseBody
	@RequestMapping("/insertcomment")
	public String insertcomment(@ModelAttribute SpoCommentVO param) {
		
		log.info("SpoCommentController insertcomment >>> ");
		log.info("SpoCommentController insertcomment param>>> " + param);
		log.info("SpoCommentController insertcomment 댓글번호 >>> " + param.getStb_no() + ", 아이디 >>> " + param.getSmb_id());
		
		int nCntinsert = spoCommentService.insertcomment(param);
		
		String insertResult = "";
		
		if(nCntinsert == 1) {
			log.info("댓글등록성공 >>> nCntinsert" + nCntinsert);
			insertResult = "댓글등록 성공";
		}else {
			log.info("댓글등록 실패 >>> nCntinsert" + nCntinsert);
			insertResult = "댓글등록 실패";
		}
		
		return insertResult;
	}
	
	@ResponseBody
	@RequestMapping("/updatecomment")
	public String updatecomment(@ModelAttribute SpoCommentVO param) {
		
		log.info("SpoCommentController updatecomment >>> ");
		log.info("SpoCommentController updatecomment param>>> " + param);
		
		int nCntupdate = spoCommentService.updatecomment(param);
		String updateResult = "";
		
		if(nCntupdate == 1) {
			log.info("댓글수정성공 >>> nCntupdate" + nCntupdate);
			updateResult = "댓글수정 성공";
		}else {
			log.info("댓글수정 실패 >>> nCntupdate" + nCntupdate);
			updateResult = "댓글수정 실패";
		}
		return updateResult;
	}
	
	@ResponseBody
	@RequestMapping("/deletecomment")
	public String deletecomment(@ModelAttribute SpoCommentVO param) {
		
		log.info("SpoCommentController deletecomment >>> ");
		log.info("SpoCommentController deletecomment param>>> " + param);
		
		int nCntdelete = spoCommentService.deletecomment(param);
		String deleteResult = "";
		
		if(nCntdelete == 1) {
			log.info("댓글삭제성공 >>> nCntdelete" + nCntdelete);
			deleteResult = "댓글삭제 성공";
		}else {
			log.info("댓글삭제 실패 >>> nCntupdate" + nCntdelete);
			deleteResult = "댓글삭제 실패";
		}
		return deleteResult;
	}

}
