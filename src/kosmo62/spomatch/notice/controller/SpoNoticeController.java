package kosmo62.spomatch.notice.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kosmo62.spomatch.notice.service.SpoNoticeService;
import kosmo62.spomatch.notice.vo.SpoNoticeVO;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;



@Controller
public class SpoNoticeController {
	private static Logger log = Logger.getLogger(SpoNoticeController.class);
	
	@Autowired
	private SpoNoticeService spoNoticeService;
	
	/*******************************************************************************
									
	*******************************************************************************/
	@RequestMapping(value="listNotice")
	public ModelAndView listNotice(@ModelAttribute SpoNoticeVO param, HttpServletRequest req) {
		
		log.info("notice_list listNotice>> : ");
		
	
		
		if(req.getParameter("spg_curPage")!= null && req.getParameter("spg_curPage").length() >0) {
			log.info("spomatchController listNotice spg_curPage >>> : " + req.getParameter("spg_curPage"));
			param.setSpg_curPage(req.getParameter("spg_curPage"));
		}else {
			param.setSpg_curPage("1");
		}
		
		SpoNoticeVO searchVO = new SpoNoticeVO();
		searchVO.setSearchFilter(param.getSearchFilter());
		searchVO.setKeyword(param.getKeyword());
		
		
		ModelAndView mav = new ModelAndView();
		String message = "";
		HttpSession session = req.getSession(false);
		if(session != null) {
		List<SpoNoticeVO> list = spoNoticeService.listNotice(param);
		mav.addObject("noticeList",list);
		mav.addObject("searchVO",searchVO);
		mav.setViewName("notice/spoNoticeListAll");
		}else {
			message =  "세션이 만료되었습니다. 로그인을 해주세요.";
			mav.addObject("message",message);
			mav.setViewName("login/loginForm");
		}
		return mav;
		}
	/*******************************************************************************
								
	 *******************************************************************************/
	@RequestMapping(value="noticeListDetail" , method=RequestMethod.POST)
	public ModelAndView detailListNotice(@ModelAttribute SpoNoticeVO param, HttpServletRequest req) {
		
	
		log.info(">>>>>>>>>>"+param.getSnt_no());
		log.info("controller noticeListDetail 진입 >>>   ");
		SpoNoticeVO snvo = new SpoNoticeVO();
		snvo.setSnt_viewCount(param.getSnt_viewCount());
		log.info("controller noticeListDetail >>>  :  " + param.getSnt_viewCount());
		int viewCount = spoNoticeService.noticeViewCount(param);
		
		ModelAndView mav = new ModelAndView();
		String message = "";
		HttpSession session = req.getSession(false);
		if(session != null) {
		
		mav.addObject("noticeList",spoNoticeService.noticeListDetail(param));
	
		mav.setViewName("notice/spoNoticeListDetail");
		}else {
			message =  "세션이 만료되었습니다. 로그인을 해주세요.";
			mav.addObject("message",message);
			mav.setViewName("login/loginForm");
		}
		return mav;
		}
	/*******************************************************************************
			
		*******************************************************************************/
		@RequestMapping(value="noticeListDetail2" , method=RequestMethod.POST)
		public ModelAndView detailListNotice2 (@ModelAttribute("param")  SpoNoticeVO param,HttpServletRequest req) {
		
		log.info("controller noticeListDetail2 : ");
		ModelAndView mav = new ModelAndView();
		String message = "";
		HttpSession session = req.getSession(false);
		if(session != null) {
		mav.addObject("noticeList",spoNoticeService.noticeListDetail(param));
		mav.setViewName("notice/spoNoticeListDetail2");
		}else {
			message =  "세션이 만료되었습니다. 로그인을 해주세요.";
			mav.addObject("message",message);
			mav.setViewName("login/loginForm");
		}
		return mav;
		}
	/*******************************************************************************
								
	 *******************************************************************************/
	@RequestMapping(value="updateClick" , method=RequestMethod.POST)
	public ModelAndView listNoticeUpdate(@ModelAttribute("param")  SpoNoticeVO param, HttpServletRequest request ) {
		log.info("controller noticeListUpdate >>> : ");
		log.info(param.getSnt_no());
		log.info(param.getSnt_subject());
		log.info(param.getSnt_content());
		log.info(param.getSnt_file());
		
		int size = 10*1024*1024;
		String path =  "C:\\00.KOSMO62\\spomatch_workspace20200717\\spoMatch\\WebContent\\WEB-INF\\file";
		String[] type = {"jpg","png","gif","psd","tiff","jpeg"};
		
		
		try {
			MultipartRequest multi = new MultipartRequest(request,path,size,"UTF-8",new DefaultFileRenamePolicy());
			
			
			
			String snt_no = multi.getParameter("snt_no");
			String snt_subject = multi.getParameter("snt_subject");
			String snt_content = multi.getParameter("snt_content");
			String snt_file = null;
			
		
			param.setSnt_no(snt_no);
			param.setSnt_subject(snt_subject);
			param.setSnt_content(snt_content);
			
			Enumeration<String> et = multi.getFileNames();
			
			List<String> list = new ArrayList<String>();
		
			while(et.hasMoreElements()) {
				String file = et.nextElement();
				list.add(multi.getFilesystemName(file));
			}
			for(int i=0;i<list.size();i++) {
				snt_file = list.get(i);
			}
			param.setSnt_file(snt_file);
		}catch(Exception ex) {
			log.info(" >>> : " + ex.getMessage());
		}
		

		String resultStr ="";
		int result = spoNoticeService.noticeUpdate(param);
		log.info(result);
		if(result > 0) resultStr="성공입니다";
		else resultStr ="문제";
		ModelAndView mav = new ModelAndView();
		String message = "";
		HttpSession session = request.getSession(false);
		if(session != null) {
		mav.addObject("result",resultStr);
		log.info("mav>>> : " + mav);
		mav.setViewName("notice/result");
		}else {
			message =  "세션이 만료되었습니다. 로그인을 해주세요.";
			mav.addObject("message",message);
			mav.setViewName("login/loginForm");
		}
		return mav;
		}
		/*******************************************************************************
						
		 *******************************************************************************/
		@RequestMapping(value="deleteClick", method=RequestMethod.POST)
		public ModelAndView listNoticeDelete(@ModelAttribute("param") SpoNoticeVO param,HttpServletRequest request) {
			
			log.info("번호 >>  " + param.getSnt_no());
			String path = "C:\\00.KOSMO62\\spomatch_workspace20200717\\spoMatch\\WebContent\\WEB-INF\\file";
			
			String resultStr="";
			int result = spoNoticeService.noticeDelete(param);
			log.info(result);
			if(result>0){
				String snt_file = param.getSnt_file();
				File file = new File(path+snt_file);
				boolean deleteFile = file.delete();
				resultStr = "성공";
			}else{ 
				resultStr="문제";
			}
			
			ModelAndView mav = new ModelAndView();
			String message = "";
			HttpSession session = request.getSession(false);
			if(session != null) {
			mav.addObject("result", resultStr);
			log.info("mav>>> : " + mav);
			mav.setViewName("notice/result");
			}else {
				message =  "세션이 만료되었습니다. 로그인을 해주세요.";
				mav.addObject("message",message);
				mav.setViewName("login/loginForm");
			}
			return mav;
		}
		/*******************************************************************************
					
		*******************************************************************************/
		@RequestMapping(value="insertClick" , method=RequestMethod.POST)
		public ModelAndView listNoticeInsert(@ModelAttribute SpoNoticeVO param, HttpServletRequest request){
			log.info(param.getSnt_subject());
			log.info(param.getSnt_content());
			log.info(param.getSnt_file());
			log.info("request.getContentType() >> : " +request.getContentType());
			
		
		int size = 10*1024*1024;
		String path = "C:\\00.KOSMO62\\spomatch_workspace20200717\\spoMatch\\WebContent\\WEB-INF\\file";
		String[] type = {"jpg","png","gif","psd","tiff","jpeg"};
		
		
		
		
		
		try {
			MultipartRequest multi = new MultipartRequest(request,path,size,"UTF-8",new DefaultFileRenamePolicy());
			
			
			
			
			String snt_subject = multi.getParameter("snt_subject");
			String snt_content = multi.getParameter("snt_content");
			String snt_file = null;
			
			param.setSnt_subject(snt_subject);
			param.setSnt_content(snt_content);
			
			Enumeration<String> et = multi.getFileNames();
			
			List<String> list = new ArrayList<String>();
		
			while(et.hasMoreElements()) {
				String file = et.nextElement();
				list.add(multi.getFilesystemName(file));
			}
			for(int i=0;i<list.size();i++) {
				snt_file = list.get(i);
			}
			param.setSnt_file(snt_file);
		}catch(Exception ex) {
			log.info("오류 >>> : " + ex.getMessage());
		}
		
		
		
		
		String resultStr="";
		int result = spoNoticeService.noticeInsert(param);
		log.info(result);
		if(result>0) resultStr = "성공";
		else resultStr="문제";
		
		
		ModelAndView mav = new ModelAndView();
		String message = "";
		HttpSession session = request.getSession(false);
		if(session != null) {
		mav.addObject("result", resultStr);
		mav.setViewName("notice/result");
		}else {
			message =  "세션이 만료되었습니다. 로그인을 해주세요.";
			mav.addObject("message",message);
			mav.setViewName("login/loginForm");
		}
		
		return mav;

		}
		/*******************************************************************************
												
		*******************************************************************************/
		@RequestMapping(value="takeFileClick",method=RequestMethod.POST)
		public ModelAndView takeFileInContent(@ModelAttribute SpoNoticeVO param,HttpServletRequest request) {
			
			String path = "C:\\00.KOSMO62\\spomatch_workspace20200717\\spoMatch\\WebContent\\WEB-INF\\file";
			
			String file = param.getSnt_file();
			log.info("파일 들어와유 >>> : " + file);
			
			ModelAndView mav = new ModelAndView();
			String message = "";
			HttpSession session = request.getSession(false);
			if(session != null) {
			mav.addObject("file", file);
			mav.addObject("path", path);
			mav.setViewName("notice/fileDownload");
			}else {
				message =  "세션이 만료되었습니다. 로그인을 해주세요.";
				mav.addObject("message",message);
				mav.setViewName("login/loginForm");
			}
			
			return mav;
			
		}
		
		
		/*******************************************************************************
													
		 *******************************************************************************/
		@RequestMapping(value="writeClick" , method=RequestMethod.POST)
		public ModelAndView listNoticeWrite(@ModelAttribute("param") SpoNoticeVO param,HttpServletRequest request) {
			
			ModelAndView mav = new ModelAndView();
			String message = "";
			HttpSession session = request.getSession(false);
			if(session != null) {
			mav.setViewName("notice/spoNoticeInsertForm");
			}else {
				message =  "세션이 만료되었습니다. 로그인을 해주세요.";
				mav.addObject("message",message);
				mav.setViewName("login/loginForm");
			}
			return mav;
		}

}
