package kosmo62.spomatch.answer.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo62.spomatch.answer.dao.SpoAnswerMapper;
import kosmo62.spomatch.answer.vo.SpoAnswerVO;
import kosmo62.spomatch.question.service.SpoQuestionServiceImpl;

@Service
@Transactional
public class SpoAnswerServiceImpl implements SpoAnswerService{
	private static Logger log = Logger.getLogger(SpoAnswerServiceImpl.class);
	
	@Autowired
	private SpoAnswerMapper spoAnswerMapper;
	
	/*댓글 목록*/
	@Override
	public List<SpoAnswerVO> listAnswer(SpoAnswerVO savo){
		log.info("SpoAnswerServiceImpl listAnswer 호출!");
		
		List<SpoAnswerVO> listAnswer = spoAnswerMapper.listAnswer(savo);
		
		return listAnswer;
	}
	/*댓글 입력*/
	@Override
	public int insertAnswer(SpoAnswerVO savo) {
		log.info("SpoAnswerServiceImpl insertAnswer 호출!");
		
		int insertAnswer = (int)spoAnswerMapper.insertAnswer(savo);
		return insertAnswer;
	}
	/*댓글 수정*/
	@Override
	public int updateAnswer(SpoAnswerVO savo) {
		log.info("SpoAnswerServiceImpl updateAnswer 호출!");
		
		int updateAnswer = (int)spoAnswerMapper.updateAnswer(savo);
		return updateAnswer;
	}
	/*댓글 삭제*/
	@Override
	public int deleteAnswer(SpoAnswerVO savo) {
		log.info("SpoAnswerServiceImpl deleteAnswer 호출!");
		
		int deleteAnswer = (int)spoAnswerMapper.deleteAnswer(savo);
		return deleteAnswer;
	}
}
