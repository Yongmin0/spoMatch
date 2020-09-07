package kosmo62.spomatch.notice.dao;

import java.util.List;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.apache.log4j.Logger;
import kosmo62.spomatch.notice.vo.SpoNoticeVO;


public class SpoNoticeMapperImpl extends SqlSessionDaoSupport implements SpoNoticeMapper {
	private static Logger log = Logger.getLogger(SpoNoticeMapperImpl.class);
	@Override
	public List<SpoNoticeVO> noticeList(SpoNoticeVO param) {
		List<SpoNoticeVO> list = getSqlSession().selectList("noticeList");
		log.info(list);
		return list;
	}

	@Override
	public int noticeUpdate(SpoNoticeVO param) {
		// TODO Auto-generated method stub
		return (int)getSqlSession().update("noticeUpdate");
	}

	@Override
	public SpoNoticeVO noticeListDetail(SpoNoticeVO param) {
		log.info("mapperImpl noticeListDetail 진입 >>>> ");
		
		return (SpoNoticeVO)getSqlSession().selectOne("noticeListDetail");
	}

	@Override
	public int noticeDelete(SpoNoticeVO param) {
		// TODO Auto-generated method stub
		return (int)getSqlSession().update("noticeDelete");
	}

	@Override
	public int noticeInsert(SpoNoticeVO param) {
		// TODO Auto-generated method stub
		return (int)getSqlSession().insert("noticeInsert");
	}

	@Override
	public int noticeViewCount(SpoNoticeVO param) {
		// TODO Auto-generated method stub
		return (int)getSqlSession().update("noticeViewCount");
	}


	
	
}
