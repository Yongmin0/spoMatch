package kosmo62.spomatch.question.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import kosmo62.spomatch.question.vo.SpoQuestionVO;

public class SpoQuestionMapperImpl extends SqlSessionDaoSupport implements SpoQuestionMapper{
	private static Logger log = Logger.getLogger(SpoQuestionMapperImpl.class);
	
	/*전체조회*/
	@Override
	public List<SpoQuestionVO> listBoard(SpoQuestionVO param){
		log.info("SpoQuestionMapperImpl listBoard 시작");
		log.info("SpoQuestionMapperImpl listBoard param >> : " + param);
		
		//SpoQuestionDAO 이동
		List<SpoQuestionVO> list = getSqlSession().selectList("listBoard");
		log.info("SpoQuestionMapperImpl listBoard list >> : " + list);
		
		return list;
	}
	/*상세조회*/
	@Override
	public List<SpoQuestionVO> detailBoard(SpoQuestionVO param) {
		log.info("SpoQuestionMapperImpl detailBoard 함수 호출 성공");
		
		List<SpoQuestionVO> detailBoard = getSqlSession().selectList("detailBoard");
		
		return detailBoard;
	}
	
	/*입력*/
	@Override
	public int insertBoard(SpoQuestionVO param) {
		log.info("SpoQuestionMapperImpl insertBoard 시작");
		log.info("SpoQuestionMapperImpl insertBoard param >> : " + param);
		
		return (int)getSqlSession().insert("insertBoard");
	}
	
	/*수정*/
	@Override
	public int updateBoard(SpoQuestionVO param) {
		log.info("SpoQuestionMapperImpl updateBoard 시작");
		log.info("SpoQuestionMapperImpl updateBoard param >> : " + param);
		
		return (int)getSqlSession().update("updateBoard");
	}
	/*삭제*/
	@Override
	public int deleteBoard(SpoQuestionVO param) {
		log.info("SpoQuestionMapperImpl deleteBoard 시작");
		log.info("SpoQuestionMapperImpl deleteBoard param >> : " + param);
		
		return (int)getSqlSession().delete("deleteBoard");
	}
}
