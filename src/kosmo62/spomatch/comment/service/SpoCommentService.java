package kosmo62.spomatch.comment.service;

import java.util.List;

import kosmo62.spomatch.comment.vo.SpoCommentVO;

public interface SpoCommentService {

	public List<SpoCommentVO> listcomment(SpoCommentVO param);
	public List<SpoCommentVO> listallcomment(SpoCommentVO param);
	public int insertcomment(SpoCommentVO param);
	public int updatecomment(SpoCommentVO param);
	public int deletecomment(SpoCommentVO param);
}
