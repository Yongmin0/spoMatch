package kosmo62.spomatch.tipboard.service;

import java.util.List;

import kosmo62.spomatch.tipboard.vo.SpoTipBoardVO;

public interface SpoTipBoardService {

	    //내가쓴글 목록(마이페이지용)
		public List<SpoTipBoardVO> mylistboard(SpoTipBoardVO param);
		
	   //게시판목록
		public List<SpoTipBoardVO> listboard(SpoTipBoardVO param);
		
		//게시판목록(관리자용)
		public List<SpoTipBoardVO> listallboard(SpoTipBoardVO param);
		
		//게시판상세보기
		public List<SpoTipBoardVO> detailboard(SpoTipBoardVO param);
		
		//게시판등록
		public int insertboard(SpoTipBoardVO param);
		
		//게시판수정
		public int updateboard(SpoTipBoardVO param);
		
		//게시판삭제
		public int deleteboard(SpoTipBoardVO param);
		
		//조회수증가
		public int viewcntboard(SpoTipBoardVO param);
		
		//=======게시판 글 좋아요구현=========
		//1. 좋아요 클릭여부 조회
		public List<SpoTipBoardVO> goodYNboard(SpoTipBoardVO param);
		
		//2-1.좋아요 클릭여부  조회 후 0 건이면 insert 하기
		public int insertgoodcnt(SpoTipBoardVO param);
		
		//2-2.좋아요 클릭여부 조회 결과 , 값이 'N'일 경우 'Y'로 변경하기
		//public int updategoodY(SpoTipBoardVO param);
		
		//2-3.좋아요 클릭여부 조회 결과 , 값이 'Y'일 경우 'N'으로 변경하기
		public int updategoodN(SpoTipBoardVO param);
		

}
