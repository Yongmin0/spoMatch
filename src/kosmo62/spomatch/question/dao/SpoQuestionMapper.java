package kosmo62.spomatch.question.dao;

import java.util.List;

import kosmo62.spomatch.question.vo.SpoQuestionVO;

public interface SpoQuestionMapper {
	/*전체조회*/
	public List<SpoQuestionVO> listBoard(SpoQuestionVO param);
	/*상세조회*/
	public List<SpoQuestionVO> detailBoard(SpoQuestionVO param);
	/*입력*/
	public int insertBoard(SpoQuestionVO param);
	/*수정*/
	public int updateBoard(SpoQuestionVO param);
	/*삭제*/
	public int deleteBoard(SpoQuestionVO param);
}
