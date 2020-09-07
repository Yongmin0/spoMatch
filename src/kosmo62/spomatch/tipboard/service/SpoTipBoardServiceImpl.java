package kosmo62.spomatch.tipboard.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosmo62.spomatch.tipboard.dao.SpoTipBoardMapper;
import kosmo62.spomatch.tipboard.vo.SpoTipBoardVO;

@Service
@Transactional
public class SpoTipBoardServiceImpl implements SpoTipBoardService{
	
	private static Logger log = Logger.getLogger(SpoTipBoardServiceImpl.class);
	
	@Autowired
	private SpoTipBoardMapper spoTipBoardMapper;

	//내가쓴글 목록(마이페이지용)
	@Override
	public List<SpoTipBoardVO> mylistboard(SpoTipBoardVO param) {

		log.info("SpoTipBoardServiceImpl mylistboard >>> ");
		log.info("SpoTipBoardServiceImpl mylistboard param >>> " + param);
		
		List<SpoTipBoardVO> list = new ArrayList<SpoTipBoardVO>();
		list = spoTipBoardMapper.mylistboard(param);
		log.info("SpoTipBoardServiceImpl mylistboard list >>> " + list);
		
		return list;
	}

	
	//게시판목록
	@Override
	public List<SpoTipBoardVO> listboard(SpoTipBoardVO param) {
		
		log.info("SpoTipBoardServiceImpl listboard >>> ");
		log.info("SpoTipBoardServiceImpl listboard param >>> " + param);
		
		List<SpoTipBoardVO> list = new ArrayList<SpoTipBoardVO>();
		list = spoTipBoardMapper.listboard(param);
		log.info("SpoTipBoardServiceImpl listboard list >>> " + list);
		
		return list;
	}
	
	//게시판목록(관리자용)
	@Override
	public List<SpoTipBoardVO> listallboard(SpoTipBoardVO param) {


		log.info("SpoTipBoardServiceImpl listallboard >>> ");
		log.info("SpoTipBoardServiceImpl listallboard param >>> " + param);
		
		List<SpoTipBoardVO> list = new ArrayList<SpoTipBoardVO>();
		list = spoTipBoardMapper.listallboard(param);
		log.info("SpoTipBoardServiceImpl listallboard list >>> " + list);
		
		return list;
	}
	
	//게시판상세보기
	@Override
	public List<SpoTipBoardVO> detailboard(SpoTipBoardVO param) {
		log.info("SpoTipBoardServiceImpl detailboard >>> ");
		log.info("SpoTipBoardServiceImpl detailboard param >>> " + param);
		
		List<SpoTipBoardVO> list = new ArrayList<SpoTipBoardVO>();
		list = spoTipBoardMapper.detailboard(param);
		log.info("SpoTipBoardServiceImpl detailboard list >>> " + list);
		
		return list;
	}
	
	//게시판등록
	@Override
	public int insertboard(SpoTipBoardVO param) {
		
		log.info("SpoTipBoardServiceImpl insertboard >>> ");
		log.info("SpoTipBoardServiceImpl insertboard param >>> " + param);
		log.info("SpoTipBoardServiceImpl insertboard param.getSmb_no() >>> " + param.getSmb_no());
		log.info("SpoTipBoardServiceImpl insertboard param.getSmb_id() >>> " + param.getSmb_id());
		return spoTipBoardMapper.insertboard(param);
	}

	//게시판수정
	@Override
	public int updateboard(SpoTipBoardVO param) {

		log.info("SpoTipBoardServiceImpl updateboard >>> ");
		log.info("SpoTipBoardServiceImpl updateboard param >>> " + param.getStb_category());

		
		return spoTipBoardMapper.updateboard(param);
	}

	//게시판삭제
	@Override
	public int deleteboard(SpoTipBoardVO param) {

		log.info("SpoTipBoardServiceImpl deleteboard >>> ");
		log.info("SpoTipBoardServiceImpl deleteboard param >>> " + param);
		
		return spoTipBoardMapper.deleteboard(param);
	}

	//조회수증가
	@Override
	public int viewcntboard(SpoTipBoardVO param) {

		log.info("SpoTipBoardServiceImpl viewcntboard >>> ");
		log.info("SpoTipBoardServiceImpl viewcntboard param >>> " + param);
		
		
		return spoTipBoardMapper.viewcntboard(param);
	}

	//=======게시판 글 좋아요구현=========
	//1. 좋아요 클릭여부 조회
	@Override
	public List<SpoTipBoardVO> goodYNboard(SpoTipBoardVO param) {
		
		log.info("SpoTipBoardServiceImpl goodYNboard >>> ");
		log.info("SpoTipBoardServiceImpl goodYNboard param >>> " + param);
		
		
		return spoTipBoardMapper.goodYNboard(param);
	}

	//2-1.좋아요 클릭여부  조회 후 0 건이면 insert 하기
	@Override
	public int insertgoodcnt(SpoTipBoardVO param) {
		
		log.info("SpoTipBoardServiceImpl insertgoodcnt >>> ");
		log.info("SpoTipBoardServiceImpl insertgoodcnt param >>> " + param);
		log.info("SpoTipBoardServiceImpl insertgoodcnt param.getSession_no >>> " + param.getSession_no());
		log.info("SpoTipBoardServiceImpl insertgoodcnt param.getStb_no >>> " + param.getStb_no());
		
		return spoTipBoardMapper.insertgoodcnt(param);
	}
/*
	//2-2.좋아요 클릭여부 조회 결과 , 값이 'N'일 경우 'Y'로 변경하기
	@Override
	public int updategoodY(SpoTipBoardVO param) {
		
		log.info("SpoTipBoardServiceImpl updategoodY >>> ");
		log.info("SpoTipBoardServiceImpl updategoodY param >>> " + param);
		log.info("SpoTipBoardServiceImpl updategoodY param.getSmb_no >>> " + param.getSmb_no());
		log.info("SpoTipBoardServiceImpl updategoodY param.getStb_no >>> " + param.getStb_no());
		

		return spoTipBoardMapper.updategoodY(param);
	}
*/
	//2-3.좋아요 클릭여부 조회 결과 , 값이 'Y'일 경우 'N'으로 변경하기
	@Override
	public int updategoodN(SpoTipBoardVO param) {
		
		log.info("SpoTipBoardServiceImpl updategoodN >>> ");
		log.info("SpoTipBoardServiceImpl updategoodN param >>> " + param);
		log.info("SpoTipBoardServiceImpl updategoodY param.getSmb_no >>> " + param.getSmb_no());
		log.info("SpoTipBoardServiceImpl updategoodY param.getStb_no >>> " + param.getStb_no());
		

		return spoTipBoardMapper.updategoodN(param);
	}


}
