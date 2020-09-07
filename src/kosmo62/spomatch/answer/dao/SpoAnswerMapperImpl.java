package kosmo62.spomatch.answer.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import kosmo62.spomatch.answer.vo.SpoAnswerVO;



public class SpoAnswerMapperImpl extends SqlSessionDaoSupport implements SpoAnswerMapper{
	
	private static Logger log = Logger.getLogger(SpoAnswerMapperImpl.class);
	
	/*댓글 목록*/
	@Override
	public List<SpoAnswerVO> listAnswer(SpoAnswerVO savo){
		log.info("SpoAnswerMapperImpl listAnswer 호출!");
		
		//SpoAnswerDAO 이동
		List<SpoAnswerVO> listAnswer = getSqlSession().selectList("listAnswer", savo);
		
		return listAnswer;
	}
	/*댓글 입력*/
	@Override
	public int insertAnswer(SpoAnswerVO savo) {
		log.info("SpoAnswerMapperImpl insertAnswer 호출!");	
		return (int)getSqlSession().insert("insertAnswer");
	}
	/*댓글 수정*/
	@Override
	public int updateAnswer(SpoAnswerVO savo) {
		log.info("SpoAnswerMapperImpl updateAnswer 호출!");
		return (int)getSqlSession().update("updateAnswer");
	}
	/*댓글 삭제*/
	@Override
	public int deleteAnswer(SpoAnswerVO savo) {
		log.info("SpoAnswerMapperImpl deleteAnswer 호출!");
		return (int)getSqlSession().delete("deleteAnswer");
	}
}
