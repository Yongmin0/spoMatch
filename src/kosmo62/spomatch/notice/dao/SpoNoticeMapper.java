package kosmo62.spomatch.notice.dao;
import java.util.List;

import kosmo62.spomatch.notice.vo.*;
public interface SpoNoticeMapper{
	public List<SpoNoticeVO> noticeList(SpoNoticeVO param); //전체목록
	public SpoNoticeVO noticeListDetail(SpoNoticeVO param); //게시글상세정보
	public int noticeUpdate(SpoNoticeVO param);//게시글 수정
	public int noticeDelete(SpoNoticeVO param);//게시글 삭제
	public int noticeInsert(SpoNoticeVO param);//게시글 등록
	public int noticeViewCount(SpoNoticeVO param);
}
