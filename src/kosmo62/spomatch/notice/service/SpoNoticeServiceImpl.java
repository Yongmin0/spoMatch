package kosmo62.spomatch.notice.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo62.spomatch.notice.dao.SpoNoticeMapper;
import kosmo62.spomatch.notice.vo.SpoNoticeVO;

@Service
@Transactional
public class SpoNoticeServiceImpl implements SpoNoticeService {
	
	Logger log = Logger.getLogger(SpoNoticeServiceImpl.class);
	
	@Autowired
	private SpoNoticeMapper spoNoticeMapper;
	
	/*글 목록 구현*/
	@Override
	public List<SpoNoticeVO> listNotice(SpoNoticeVO snvo) {
		List<SpoNoticeVO> listNotice =null;
		listNotice = spoNoticeMapper.noticeList(snvo);
		return listNotice;
	}

	@Override
	public int noticeInsert(SpoNoticeVO snvo) {
		log.info("serviceImple noticeInsert 호출성공 >>> : ");
		return spoNoticeMapper.noticeInsert(snvo);
	}
	@Override
	public int noticeUpdate(SpoNoticeVO param) {
		log.info("serviceImple noticeUpdate 호출성공 >>> : ");
		return spoNoticeMapper.noticeUpdate(param);
	}

	@Override
	public int noticeDelete(SpoNoticeVO param) {
		// TODO Auto-generated method stub
		return spoNoticeMapper.noticeDelete(param);
	}

	@Override
	public SpoNoticeVO noticeListDetail(SpoNoticeVO param) {
		log.info("ServiceImpl noticeListDetail 진입 >>>");
		return spoNoticeMapper.noticeListDetail(param);
	}

	@Override
	public int noticeViewCount(SpoNoticeVO param) {
		log.info("ServiceImpl noticeViewCount 진입 >>>");
		return spoNoticeMapper.noticeViewCount(param);
	}

}
