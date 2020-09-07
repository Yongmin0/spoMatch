package kosmo62.spomatch.notice.service;
import java.util.List;
import kosmo62.spomatch.notice.vo.SpoNoticeVO;

public interface SpoNoticeService {
	public List<SpoNoticeVO> listNotice(SpoNoticeVO snvo);
	public int noticeInsert(SpoNoticeVO snvo);
	public SpoNoticeVO noticeListDetail(SpoNoticeVO param);
	public int noticeUpdate(SpoNoticeVO param);
	public int noticeDelete(SpoNoticeVO param);
	public int noticeViewCount(SpoNoticeVO param);
}