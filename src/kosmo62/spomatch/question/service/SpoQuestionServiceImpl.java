package kosmo62.spomatch.question.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo62.spomatch.question.dao.SpoQuestionMapper;
import kosmo62.spomatch.question.vo.SpoQuestionVO;

@Service
@Transactional
public class SpoQuestionServiceImpl implements SpoQuestionService{
	private static Logger log = Logger.getLogger(SpoQuestionServiceImpl.class);
	
	@Autowired
	private SpoQuestionMapper spoQuestionMapper;
	
	/*전체조회*/
	@Override
	public List<SpoQuestionVO> listBoard(SpoQuestionVO param){
		log.info("SpoQuestionServiceImpl listBoard 시작");
		log.info("SpoQuestionServiceImpl listBoard param >> : " + param);
		
		List<SpoQuestionVO> list = new ArrayList<SpoQuestionVO>();
		list = spoQuestionMapper.listBoard(param);
		log.info("SpoQuestionServiceImpl listBoard list >> : " + list);
		
		return list;
	}
	/*상세조회*/
	@Override
	public List<SpoQuestionVO> detailBoard(SpoQuestionVO param) {
		log.info("SpoQuestionServiceImpl detailBoard 함수 호출 성공");
		
		List<SpoQuestionVO> detailBoard = spoQuestionMapper.detailBoard(param);
		return detailBoard;
	}
	
	/*입력*/
	@Override
	public int insertBoard(SpoQuestionVO param) {
		log.info("SpoQuestionServiceImpl insertBoard 시작");
		log.info("SpoQuestionServiceImpl insertBoard param >> : " + param);
		
		return (int)spoQuestionMapper.insertBoard(param);
	}
	/*수정*/
	@Override
	public int updateBoard(SpoQuestionVO param) {
		log.info("SpoQuestionServiceImpl updateBoard 시작");
		log.info("SpoQuestionServiceImpl updateBoard param >> : " + param);
		
		return (int)spoQuestionMapper.updateBoard(param);
	}
	/*삭제*/
	@Override
	public int deleteBoard(SpoQuestionVO param) {
		log.info("SpoQuestionServiceImpl deleteBoard 시작");
		log.info("SpoQuestionServiceImpl deleteBoard param >> : " + param);
		
		return (int)spoQuestionMapper.deleteBoard(param);
	}
}
