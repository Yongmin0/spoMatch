package kosmo62.spomatch.answer.service;

import java.util.List;

import kosmo62.spomatch.answer.vo.SpoAnswerVO;

public interface SpoAnswerService {
	//댓글 목록
	public List<SpoAnswerVO> listAnswer(SpoAnswerVO savo);
	//댓글 입력
	public int insertAnswer(SpoAnswerVO savo);
	//댓글 수정
	public int updateAnswer(SpoAnswerVO savo);
	//댓글 삭제
	public int deleteAnswer(SpoAnswerVO savo);
}
