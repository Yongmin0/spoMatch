package kosmo62.spomatch.tipboard.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kosmo62.spomatch.tipboard.service.SpoTipBoardService;
import kosmo62.spomatch.tipboard.vo.SpoTipBoardVO;

@Controller
public class SpoTipBoardController {
	
	private static Logger log = Logger.getLogger(SpoTipBoardController.class);


	@Autowired
	private SpoTipBoardService spoTipBoardService;
	
	/*======================================================게시판목록======================================================*/	
	
	//팁공유게시판 목록 조회(마이페이지용)-------------------------------------------------------------------------------------------------
		@RequestMapping("/mylistboard")
		public ModelAndView mylistboard(@ModelAttribute SpoTipBoardVO param, HttpServletRequest request) {
			
			log.info("SpoTipBoardController mylistboard >>>");
			log.info("SpoTipBoardController mylistboard param >>> " + param);
		
			
			ModelAndView mav = new ModelAndView();
			SpoTipBoardVO searchVO = new SpoTipBoardVO();
			searchVO.setSearchFilter(param.getSearchFilter());
			searchVO.setKeyword(param.getKeyword());
			
			HttpSession session = request.getSession(false);
			if(session != null) {
				String smb_no = String.valueOf(session.getAttribute("smb_no"));
				if(smb_no != "null") {
						param.setSmb_no(smb_no);
						log.info("SpoTipBoardController mylistboard param.getSmb_no >>> " + param.getSmb_no());
						
				}
			}
			if(request.getParameter("spg_curPage")!= null && request.getParameter("spg_curPage").length() >0 ) {
				log.info("SpoTipBoardController mylistboard spg_curPage >>>" + request.getParameter("spg_curPage"));
				param.setSpg_curPage(request.getParameter("spg_curPage"));
			}else {
				param.setSpg_curPage("1");}
			List<SpoTipBoardVO> mylistboard = spoTipBoardService.mylistboard(param);
			mav.addObject("mylistboard", mylistboard);
			log.info("SpoTipBoardController mylistboard mav >>> " + mav);
			mav.addObject("searchVO",searchVO);
			mav.setViewName("myPage/mylistboard");
			return mav;
		}
	
	//팁공유게시판 목록 조회-------------------------------------------------------------------------------------------------
	@RequestMapping("/listboard")
	public ModelAndView listboard(@ModelAttribute SpoTipBoardVO param, HttpServletRequest request) {
		
		log.info("SpoTipBoardController listboard >>>");
		log.info("SpoTipBoardController listboard param >>> " + param);
		
		ModelAndView mav = new ModelAndView();
		SpoTipBoardVO searchVO = new SpoTipBoardVO();
		searchVO.setSearchFilter(param.getSearchFilter());
		searchVO.setKeyword(param.getKeyword());
		
		HttpSession session = request.getSession(false);
		if(session != null) {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			if(smb_no != "null") {
					param.setSmb_no(smb_no);
			log.info("SpoTipBoardController listboard param.getSmb_no >>> " + param.getSmb_no());
					
			}
		}
		if(request.getParameter("spg_curPage")!= null && request.getParameter("spg_curPage").length() >0 ) {
			log.info("SpoTipBoardController listboard spg_curPage >>>" + request.getParameter("spg_curPage"));
			param.setSpg_curPage(request.getParameter("spg_curPage"));
		}else {
			param.setSpg_curPage("1");}
		List<SpoTipBoardVO> listboard = spoTipBoardService.listboard(param);
		mav.addObject("listboard", listboard);
		log.info("SpoTipBoardController listboard mav >>> " + mav);
		mav.addObject("searchVO",searchVO);
		mav.setViewName("tipboard/listboard");
		return mav;
	}
	
	//팁공유게시판 전체목록 조회-------------------------------------------------------------------------------------------------
	@RequestMapping("/listallboard")
	public ModelAndView listallboard(@ModelAttribute SpoTipBoardVO param, HttpServletRequest request) {
		
		log.info("SpoTipBoardController listallboard >>>");
		log.info("SpoTipBoardController listallboard param >>> " + param);

		
		ModelAndView mav = new ModelAndView();
		SpoTipBoardVO searchVO = new SpoTipBoardVO();
		searchVO.setSearchFilter(param.getSearchFilter());
		searchVO.setKeyword(param.getKeyword());
		
		HttpSession session = request.getSession(false);
		if(session != null) {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			if(smb_no != "null") {
					param.setSmb_no(smb_no);
					log.info("SpoTipBoardController listallboard param.getSmb_no >>> " + param.getSmb_no());
			}
		}
		if(request.getParameter("spg_curPage")!= null && request.getParameter("spg_curPage").length() >0 ) {
			log.info("SpoTipBoardController listallboard spg_curPage >>>" + request.getParameter("spg_curPage"));
			param.setSpg_curPage(request.getParameter("spg_curPage"));
		}else {
			param.setSpg_curPage("1");}
		List<SpoTipBoardVO> listallboard = spoTipBoardService.listallboard(param);
		mav.addObject("listallboard", listallboard);
		log.info("SpoTipBoardController listallboard mav >>> " + mav);
		mav.addObject("searchVO",searchVO);
		mav.setViewName("tipboard/listallboard");
		return mav;
	}
	
	/*======================================================게시판상세목록======================================================*/
	//등록버튼 클릭시 이동-------------------------------------------------------------------------------------------------
	@RequestMapping("/insertForm")
	public ModelAndView insertForm(@ModelAttribute SpoTipBoardVO param, HttpServletRequest request) {
		log.info("SpoTipBoardController insertForm >>> ");
		log.info("SpoTipBoardController insertForm param >>> " + param);
		
		
		String message = "";
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession(false);
		if(session != null) {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			if(smb_no != "null") {
				param.setSmb_no(smb_no);
				log.info("SpoTipBoardController insertForm param.getSmb_no >>> " + param.getSmb_no());
				mav.addObject("smb_no",smb_no);
					
			}else {
				message = "세션이 만료되었습니다. 로그인을 해주세요.";
				mav.addObject("message",message);
				mav.setViewName("login/loginForm");
			}
		}
		mav.setViewName("tipboard/insertboard");
		return mav;
	}//end of insertForm
	
	//수정 비밀번호 체크
	@RequestMapping("updatepwCheck")
	public ModelAndView updatepwCheck(@ModelAttribute SpoTipBoardVO param) {
		log.info("SpoTipBoardController updatepwCheck >>> ");
		log.info("SpoTipBoardController updatepwCheck param >>> " + param);
		log.info("SpoTipBoardController updatepwCheck param.getStb_pw >>> " + param.getStb_pw());
		
		ModelAndView mav = new ModelAndView();
		List<SpoTipBoardVO> detailboard = spoTipBoardService.detailboard(param);
		mav.addObject("detailboard",detailboard);
		mav.setViewName("tipboard/updatepwCheck");
		
		return mav;
	}
	
	//삭제 비밀번호 체크
	@RequestMapping("deletepwCheck")
	public ModelAndView deletepwCheck(@ModelAttribute SpoTipBoardVO param) {
		log.info("SpoTipBoardController deletepwCheck >>> ");
		log.info("SpoTipBoardController deletepwCheck param >>> " + param);
		log.info("SpoTipBoardController deletepwCheck param.getStb_pw >>> " + param.getStb_pw());
		
		ModelAndView mav = new ModelAndView();
		List<SpoTipBoardVO> detailboard = spoTipBoardService.detailboard(param);
		mav.addObject("detailboard",detailboard);
		mav.setViewName("tipboard/deletepwCheck");
		
		return mav;
	}
	
	//수정버튼 클릭시 이동-------------------------------------------------------------------------------------------------
	@RequestMapping("/updateForm")
	public ModelAndView updateForm(@ModelAttribute SpoTipBoardVO param, HttpServletRequest request) {
		log.info("SpoTipBoardController updateForm >>> ");
		log.info("SpoTipBoardController updateForm param >>> " + param);
		log.info("SpoTipBoardController updateForm param.getStb_no >>> " + param.getStb_no());
		
		
		ModelAndView mav = new ModelAndView();
		String message = "";
		HttpSession session = request.getSession(false);
		if(session != null) {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			if(smb_no != "null") {
					param.setSmb_no(smb_no);
					List<SpoTipBoardVO> detailboard = spoTipBoardService.detailboard(param);
					mav.addObject("detailboard",detailboard);
					mav.setViewName("tipboard/updateboard");
		}else {
			message =  "세션이 만료되었습니다. 로그인을 해주세요.";
			mav.addObject("message",message);
			mav.setViewName("login/loginForm");
		}
	}
		mav.setViewName("tipboard/updateboard");
		return mav;
	}//end of updateForm
	
	//삭제버튼 클릭시 이동-------------------------------------------------------------------------------------------------
	@RequestMapping("/deleteForm")
	public ModelAndView deleteForm(@ModelAttribute SpoTipBoardVO param, HttpServletRequest request) {
		log.info("SpoTipBoardController deleteForm >>> ");
		log.info("SpoTipBoardController updateForm param >>> " + param);
		
		ModelAndView mav = new ModelAndView();
		String message = "";
		HttpSession session = request.getSession(false);
		if(session != null) {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			if(smb_no != "null") {
					param.setSmb_no(smb_no);
					List<SpoTipBoardVO> detailboard = spoTipBoardService.detailboard(param);
					mav.addObject("detailboard",detailboard);
					mav.setViewName("tipboard/deleteboard");
		}else {
			message =  "세션이 만료되었습니다. 로그인을 해주세요.";
			mav.addObject("message",message);
			mav.setViewName("login/loginForm");
		}
	}
	
		mav.setViewName("tipboard/deleteboard");
		return mav;
	}//end of deleteForm
	
	//게시판상세페이지 이동 -------------------------------------------------------------------------------------------------
	@RequestMapping("/detailboard")
	public ModelAndView detailboard(@ModelAttribute SpoTipBoardVO param , HttpServletRequest request) {
		
		log.info("SpoTipBoardController detailboard >>> ");
		log.info("SpoTipBoardController detailboard param >>> " + param);
		log.info("SpoTipBoardController detailboard param.stb_no >>> " + param.getStb_no());
		
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession(false);
		if(session != null) {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			if(smb_no != "null") {
				param.setSmb_no(smb_no);
				log.info("SpoTipBoardController login param.getSmb_no >>> " + param.getSmb_no());
				
				//조회수
				int nCntViewCount = spoTipBoardService.viewcntboard(param);
				log.info("SpoTipBoardController nCntViewCount >>> " + nCntViewCount);
				
				//좋아요
				String sgd_goodyn="";
				String session_no = param.getSmb_no();
				log.info("SpoTipBoardController detailboard session_no >>> " +session_no);
			
				List<SpoTipBoardVO> goodYNboardList = spoTipBoardService.goodYNboard(param);
				param.setSession_no(session_no);
				
				if(goodYNboardList.size() == 1) {
					sgd_goodyn = goodYNboardList.get(0).getSgd_goodyn();
					log.info("1 >>> sgd_goodyn >>>" + sgd_goodyn);
				}else if(goodYNboardList.size()==0) {
					sgd_goodyn = "N";
					log.info("0 >>> sgd_goodyn >>>" + sgd_goodyn);
				}
				param.setSgd_goodyn(sgd_goodyn);
				
				List<SpoTipBoardVO> detailboard = spoTipBoardService.detailboard(param);
				param.setSession_no(session_no);
				mav.addObject("detailboard",detailboard);
				mav.setViewName("tipboard/detailboard");
			}else {
				mav.addObject("result","세션이 만료되었습니다. 로그인을 해주세요.");
				mav.setViewName("login/loginForm");
			}
		}
		return mav;
	}
	
	/*======================================================게시판등록======================================================*/
	//팁공유게시판 등록-------------------------------------------------------------------------------------------------
	@RequestMapping("/insertboard")
	public String insertboard(HttpServletRequest request, SpoTipBoardVO param){
		log.info("SpoTipBoardController insertboard >>> ");
		
		int size = 10 * 1024 * 1024;
		String path = "C://00.KOSMO62//spomatch_workspace202000904//spoMatch//WebContent//WEB-INF//file";
		
		log.info("request.getContentType()" + request.getContentType());
		

				try {
					MultipartRequest mult = new MultipartRequest(request, path,size,"UTF-8",new DefaultFileRenamePolicy());			
					
					
					String smb_no = mult.getParameter("smb_no");
					String stb_category = mult.getParameter("stb_category");
					String stb_subject = mult.getParameter("stb_subject");
					String smb_id = mult.getParameter("smb_id");
					String stb_pw = mult.getParameter("stb_pw");
					String stb_shareyn = mult.getParameter("stb_shareyn");
					String stb_content = mult.getParameter("stb_content");
					String stb_file = "";
										
					log.info(smb_no);
					log.info(stb_category);
					log.info(stb_subject);
					log.info(smb_id);
					log.info(stb_pw);
					log.info(stb_shareyn);
					log.info(stb_content);
					log.info(stb_file);
					
					param.setSmb_no(smb_no);
					param.setStb_category(stb_category);
					param.setStb_subject(stb_subject);
					param.setStb_pw(stb_pw);
					param.setSmb_id(smb_id);
					param.setStb_shareyn(stb_shareyn);
					param.setStb_content(stb_content);
										
					Enumeration<String> em = mult.getFileNames();
					
					List<String> list = new ArrayList<String>();
					
					while(em.hasMoreElements()) {
						String file = em.nextElement();
						list.add(mult.getFilesystemName(file));
					}
					
					for(int i = 0; i<list.size(); i++) {
						stb_file = list.get(i);			
					}
					
						param.setStb_file(stb_file);
					
				
				}catch(Exception e) {
					log.info("에러 >>> " + e.getMessage());
				}
				
				int result = 0;
				String url = "";
				
				result = spoTipBoardService.insertboard(param);
				if(result == 1) {
					log.info("insert 성공  >>> " + result);
				}else {
					log.info("insert 실패  >>> " + result);
				}
					url = "/listboard.spo";
			
		return "redirect:" + url;
	}//end of insertboard
	
	//첨부파일 다운로드-------------------------------------------------------------------------------------------------
		@RequestMapping(value="/boardFileDownload")
		public ModelAndView boardFileDownload(@ModelAttribute SpoTipBoardVO param){
		log.info("SpoTipBoardController boardFileDownload >>> 다운로드 진행중 페이지로 이동");
		
		String path = "C://00.KOSMO62//spomatch_workspace202000904//spoMatch//WebContent//WEB-INF//file";
		
		
		String file = param.getStb_file();
		log.info("다운로드 할 파일명 >>> file : " + file);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("file", file);
		mav.addObject("path", path);
		mav.setViewName("tipboard/fileDownload");
		return mav;
	}//end of boardFileDownload
	

	/*======================================================게시판수정======================================================*/	
	//팁공유게시판 수정-------------------------------------------------------------------------------------------------
	@RequestMapping(value="/updateboard")
	public String updateboard(@ModelAttribute SpoTipBoardVO param, HttpServletRequest request) {
		log.info("SpoTipBoardController updateboard >>>");
		int size = 10 * 1024 * 1024;
		String path = "C://00.KOSMO62//spomatch_workspace202000904//spoMatch//WebContent//WEB-INF//file";
		
		log.info("request.getContentType()" + request.getContentType());
		
		try {
			MultipartRequest mult = new MultipartRequest(request, path,size,"UTF-8",new DefaultFileRenamePolicy());			
			
			
			String stb_no = mult.getParameter("stb_no");
			String smb_no = mult.getParameter("smb_no");
			String stb_category = mult.getParameter("stb_category");
			String stb_subject = mult.getParameter("stb_subject");
			String stb_shareyn = mult.getParameter("stb_shareyn");
			String stb_content = mult.getParameter("stb_content");
			String stb_file = "";
			
			log.info(stb_no);
			log.info(stb_category);
			log.info(stb_subject);
			log.info(stb_shareyn);
			log.info(stb_content);
			
			param.setSmb_no(smb_no);
			param.setStb_no(stb_no);
			param.setStb_category(stb_category);
			param.setStb_subject(stb_subject);
			param.setStb_shareyn(stb_shareyn);
			param.setStb_content(stb_content);
			
			
			Enumeration<String> em = mult.getFileNames();
			
			List<String> list = new ArrayList<String>();
			
			while(em.hasMoreElements()) {
				String file = em.nextElement();
				if(mult.getFilesystemName(file)!=null) {
					list.add(mult.getFilesystemName(file));
				}	
			}
			
			for(int i = 0; i<list.size(); i++) {
				stb_file = list.get(i);
				
				File f = new File(path + mult.getParameter("old_stb_file"));
				boolean delete = f.delete();
				log.info("기존 첨부파일 삭제성공 >>> ? delete >>>" + delete);
			}
			param.setStb_file(stb_file);
			
		}catch(Exception e) {
			log.info("에러 >>> " + e.getMessage());
		}
		
		int result = 0;
		String url = "";
		
		result = spoTipBoardService.updateboard(param);
		if(result == 1) {
			log.info("update 성공  >>> " + result);
		}else {
			log.info("update 실패  >>> " + result);
		}
			url = "/listboard.spo";
		
		return "redirect:" + url;
	}
	
	
	/*======================================================게시판삭제======================================================*/
	@RequestMapping("/deleteboard")
	public String deleteboard(@ModelAttribute SpoTipBoardVO param, HttpServletRequest request) {
		
		log.info("SpoTipBoardController deleteboard >>> ");
		log.info("SpoTipBoardController deleteboard param >>> " + param);
		log.info("delete :: param.getStb_no() >>>" + param.getStb_no());
		
		int size = 10 * 1024 * 1024;
		String path = "C://00.KOSMO62//spomatch_workspace202000904//spoMatch//WebContent//WEB-INF//file";
		
		try {
			MultipartRequest mult = new MultipartRequest(request, path,size,"UTF-8",new DefaultFileRenamePolicy());			
			
			String stb_no = mult.getParameter("stb_no");
			String stb_file = mult.getParameter("stb_file");
			log.info(stb_no);

			param.setStb_no(stb_no);
			param.setStb_file(stb_file);
			
			int nCntDelete = spoTipBoardService.deleteboard(param);
			if(nCntDelete == 1) {
				log.info("삭제 성공 nCntDelete >>>" + nCntDelete);
				//기존 파일 삭제
				File file = new File(path + stb_file);
				boolean deleteFile = file.delete();
				log.info("기존 파일 삭제 성공? >>> " + deleteFile);
			}else {
				log.info("파일 삭제 실패 nCntDelete >>> " + nCntDelete);
			}
			
		}catch(Exception e) {
			log.info("에러 >>> " + e.getMessage());
		}
		
		String url = "/listboard.spo";
		return "redirect:" + url;
	}
	
	/*======================================================게시판좋아요======================================================*/
	//좋아요 클릭 여부
	@ResponseBody
	@RequestMapping("/goodYNboard")
	public Map goodboard(@ModelAttribute SpoTipBoardVO param,  HttpServletRequest request) {
		
		log.info("SpoTipBoardController goodboard >>> 추천완료후 상세보기 페이지로 이동");
		log.info("SpoTipBoardController goodboard param.getStb_no >>> " + param.getStb_no());
		log.info("SpoTipBoardController goodboard param.getSmb_no >>> " + param.getSmb_no());
		log.info("SpoTipBoardController goodboard param.getMy_goodyn >>> " + param.getMy_goodyn());
		log.info("SpoTipBoardController goodboard param.getSession_no >>> " + param.getSession_no());
		
		String goodYNboard = "";
		String goodboardResult = "";
		String stb_no = param.getStb_no();
		String my_goodyn = param.getMy_goodyn();

		HttpSession session = request.getSession(false);
		if(session != null) {
			String smb_no = String.valueOf(session.getAttribute("smb_no"));
			if(smb_no != "null") {
				param.setSession_no(smb_no);
				if("N".equals(param.getMy_goodyn())) {
					log.info("my_goodyn N일 경우 insert하기 if문 >>>");
					
					param.setStb_no(stb_no);
					int nCntinsertgoodcnt = spoTipBoardService.insertgoodcnt(param);
					
					if(nCntinsertgoodcnt == 1) {
						log.info("좋아요 성공 >>> nCntinsertgoodcnt >>>" + nCntinsertgoodcnt);
					}else {
						log.info("좋아요 실패 nCntinsertgoodcnt >>> " + nCntinsertgoodcnt);
						goodboardResult = "좋아요 실패! 잠시 후 다시 시도해 주세요";
					}
				
				}else if("Y".equals(param.getMy_goodyn())) {
					log.info("0건이 아닐경우 update하기  >>>");
								
					//2-2. 좋아요 여부 조회 결과, 값이 'N'일 경우 -> 'Y'로 변경
					log.info("좋아요 취소 상태 -> 좋아요상태로 변경");
						 
					param.setStb_no(stb_no);				
					int nCntupdategoodN = spoTipBoardService.updategoodN(param);
					
					if(nCntupdategoodN == 1) {
						log.info("좋아요 성공 >>> " +nCntupdategoodN);
						goodboardResult = "좋아요 성공!";
					}else {
						log.info("좋아요 실패 nCntupdategoodN >>> " + nCntupdategoodN);
						goodboardResult = "좋아요 실패! 잠시 후 다시 시도해 주세요";
					}		
			   }//end of n->y
			}
		}
		List<SpoTipBoardVO> boardDetailList = spoTipBoardService.detailboard(param);
		SpoTipBoardVO stvo = boardDetailList.get(0);
		log.info(stvo.getMy_goodyn());
		log.info(stvo.getStb_goodcnt());
		Map<String,String> m = new HashMap<String,String>();
		
		m.put("result", goodboardResult);
		m.put("my",stvo.getMy_goodyn());
		m.put("cnt", stvo.getStb_goodcnt());
		
		return m;
	}
	
}//end of SpoTipBoardController
