package kosmo62.spomatch.tipboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import kosmo62.spomatch.tipboard.vo.SpoTipBoardVO;

public class SpoTipBoardMapperImpl extends SqlSessionDaoSupport implements SpoTipBoardMapper{
	
	private static Logger log = Logger.getLogger(SpoTipBoardMapperImpl.class);

	//내가쓴글 목록(마이페이지용)
	@Override
	public List<SpoTipBoardVO> mylistboard(SpoTipBoardVO param) {

		log.info("SpoTipBoardMapperImpl mylistboard >>> " );
		log.info("SpoTipBoardMapperImpl mylistboard param >>> " + param);
		
		List<SpoTipBoardVO> list = getSqlSession().selectList("mylistboard");
		log.info("SpoTipBoardMapperImpl mylistboard list >>> " + list);
		
		return list;
	}
	
	//게시판목록
	@Override
	public List<SpoTipBoardVO> listboard(SpoTipBoardVO param) {
		
		log.info("SpoTipBoardMapperImpl listboard >>> " );
		log.info("SpoTipBoardMapperImpl listboard param >>> " + param);
		
		List<SpoTipBoardVO> list = getSqlSession().selectList("listboard");
		log.info("SpoTipBoardMapperImpl listboard list >>> " + list);
		
		return list;
	}
	
	//게시판목록(관리자용)
	@Override
	public List<SpoTipBoardVO> listallboard(SpoTipBoardVO param) {

		log.info("SpoTipBoardMapperImpl listallboard >>> " );
		log.info("SpoTipBoardMapperImpl listallboard param >>> " + param);
		
		List<SpoTipBoardVO> list = getSqlSession().selectList("listallboard");
		log.info("SpoTipBoardMapperImpl listallboard list >>> " + list);
		
		
		return list;
	}
	
	//게시판상세보기
	@Override
	public List<SpoTipBoardVO> detailboard(SpoTipBoardVO param) {

		log.info("SpoTipBoardMapperImpl detailboard >>> " );
		log.info("SpoTipBoardMapperImpl detailboard param >>> " + param);
		
		List<SpoTipBoardVO> list = getSqlSession().selectList("detailboard");
		log.info("SpoTipBoardMapperImpl detailboard list >>> " + list);
		
		return list;
	}

	//게시판등록
	@Override
	public int insertboard(SpoTipBoardVO param) {
		
		log.info("SpoTipBoardMapperImpl insertboard >>> " );
		log.info("SpoTipBoardMapperImpl insertboard param >>> " + param);
		log.info("SpoTipBoardMapperImpl insertboard param.getStb_subject() >>> " + param.getStb_subject());
		
		return (int)getSqlSession().insert("insertboard");
	}

	//게시판수정
	@Override
	public int updateboard(SpoTipBoardVO param) {

		log.info("SpoTipBoardMapperImpl updateboard >>> " );
		log.info("SpoTipBoardMapperImpl updateboard param >>> " + param);
		
		return (int)getSqlSession().update("updateboard");
	}

	//게시판삭제
	@Override
	public int deleteboard(SpoTipBoardVO param) {

		log.info("SpoTipBoardMapperImpl deleteboard >>> " );
		log.info("SpoTipBoardMapperImpl deleteboard param >>> " + param);
		
		return (int)getSqlSession().update("deleteboard");
	}

	//조회수증가
	@Override
	public int viewcntboard(SpoTipBoardVO param) {

		log.info("SpoTipBoardMapperImpl viewcntboard >>> " );
		log.info("SpoTipBoardMapperImpl viewcntboard param >>> " + param);
		
		return (int)getSqlSession().update("viewcntboard");
	}

	//=======게시판 글 좋아요구현=========
	//1. 좋아요 클릭여부 조회
	@Override
	public List<SpoTipBoardVO> goodYNboard(SpoTipBoardVO param) {

		log.info("SpoTipBoardMapperImpl goodYNboard >>> " );
		log.info("SpoTipBoardMapperImpl goodYNboard param >>> " + param);
		
		return getSqlSession().selectList("goodYNboard");
	}

	//2-1.좋아요 클릭여부  조회 후 0 건이면 insert 하기
	@Override
	public int insertgoodcnt(SpoTipBoardVO param) {

		log.info("SpoTipBoardMapperImpl insertgoodcnt >>> " );
		log.info("SpoTipBoardMapperImpl insertgoodcnt param >>> " + param);
		
		return (int)getSqlSession().insert("insertgoodcnt");
	}
/*
	//2-2.좋아요 클릭여부 조회 결과 , 값이 'N'일 경우 'Y'로 변경하기
	@Override
	public int updategoodY(SpoTipBoardVO param) {
		
		log.info("SpoTipBoardMapperImpl updategoodY >>> " );
		log.info("SpoTipBoardMapperImpl updategoodY param >>> " + param);
		
		return (int)getSqlSession().update("updategoodY");
	}
*/
	//2-3.좋아요 클릭여부 조회 결과 , 값이 'Y'일 경우 'N'으로 변경하기
	@Override
	public int updategoodN(SpoTipBoardVO param) {

		log.info("SpoTipBoardMapperImpl updategoodN >>> " );
		log.info("SpoTipBoardMapperImpl updategoodN param >>> " + param);
		
		return (int)getSqlSession().update("updategoodN");
	}
	

}
