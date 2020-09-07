package kosmo62.spomatch.member.controller;

import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.management.RuntimeErrorException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosmo62.spomatch.member.service.SpoMemberService;
import kosmo62.spomatch.member.vo.SpoMemberVO;

// @Controller 컨트롤러 :
// SpoMemberController 클래스는 컨트롤러의 역할이라고 명시적으로 선언 
@Controller
public class SpoMemberController {
      //log4j 를 사용하기 위해서 선언
      private static Logger log = Logger.getLogger(SpoMemberController.class);
      private static String CONTEXT_PATH="spoMember";
      
      //컨트롤러에서 서비스를 호출하기 위해서 서비스 인터페이스를 선언한다.
      //@Autowired 어노테이션은 SpoMemberService에서 VO에 set/get을 자동으로 해준다.
      @Autowired
      private SpoMemberService spoMemberService;
      
      @Autowired
      private JavaMailSender mailSender;
      
       private int size;
      
      //==========================전체 조회 ============================================= 
      // @RequestMapping 어노테이션 : 클라이언트에서 요청하는 url를 매핑하는(찾는, 받는) 역활
      // value="/memberSelect" : 클라이언트에서 url-patten을 "/memberSelect.js" 요청한 것을 
      //                         받는다.                
      // method=RequestMethod.GET : 클라이언트에서 GET 방식으로 요청한 것을 받는다. 
      // @ModelAttribute 어노테이션은 클라이언트에서 요청한 데이터를 VO에 일대일 매핑한다. 
      //      <input type="text" name="mid" value="aaa">
      //      String aaa = request.getParameter("aaa");
      //      js.bs.member.vo.MemberVO.setMid(aaa);
      // Model : 모델 객체를 파라미터로 받아서 데이터를 뷰로 넘긴다. 
      // ModelAndView : 데이터와 뷰를 동시에 설정
      // String   
      //"listSpoMember" 로 매핑한다.
      
      
      //이메일 인증
      @RequestMapping("emailAuth")
      public String emailAuth(Model m) {
         return "mail/main";
      }
      
      //회원가입 약관 
      @RequestMapping("memberAgree")
      public String memberAgree(Model m) {
         return "spoMember/memberAgree";
      }
      @RequestMapping("listSpoMember")
      public ModelAndView listSpoMember(@ModelAttribute SpoMemberVO param) {
         //VO 값들이 잘 들어왔는지 로그를 찍어본다.
         
         List<SpoMemberVO> list = spoMemberService.listSpoMember(param);
         log.info("SpoMemberController listSpoMember list >>> : " + list);
         
         //list의 값들을 int형인 참조변수 listCnt 에 담는다.
         int listCnt = list.size();
         //for문으로 listCnt 값들을 뽑아낸다.
         for (int i=0;i<listCnt ; i++) {
            //list의 인덱스 배열 0번째부터 돌려서 listCnt까지 뽑아낸다.
            SpoMemberVO svo = (SpoMemberVO)list.get(i);
         }
         ModelAndView mav = new ModelAndView();
         //"spoMemberList" 객체로 list의 들어있는 값들을
         // /spomember_select로 보낸다.
         mav.addObject("spoMemberList" , list);
         mav.setViewName(CONTEXT_PATH + "/spomember_select");
         log.info("SpoMemberController listSpoMember mav >>> : " + mav);
         
         return mav;
      }//end of list SpoMember
      
      /* ======================================상세 정보 보기============================================ */
      @RequestMapping("selectSpoMember")
      public ModelAndView selectSpoMember(@ModelAttribute SpoMemberVO param) {

         log.getLogger("selectSpoMember 함수 진입 >>> : ");
         log.getLogger("SpoMemberVO.param >>> : " + param);
         log.getLogger("param.getSmb_no() >>> : " + param.getSmb_no());
         
         String smb_no = param.getSmb_no();
         
         log.info("SpoMemberController listSpoMember >>> : ");
         
         ModelAndView mav = new ModelAndView();
         if(smb_no.equals("")) {
            mav.addObject("mode", "insert");
         }else {
            mav.addObject("SpoMemberVO", spoMemberService.selectSpoMember(smb_no));
            mav.addObject("mode", "update");
              }
         mav.setViewName(CONTEXT_PATH + "/spomember_select");

         return mav;
      }
      
      @RequestMapping("kakaoInsertForm")
      public ModelAndView kakaoInsertForm(@ModelAttribute SpoMemberVO param) {
         log.info("SpoMemberController kakaoInsertForm 진입 >>> : ");
         ModelAndView mav = new ModelAndView();
         mav.setViewName("/spoMember/spomember_insert_kakao");
         log.info("SpomemberConroller kakaoInsertForm end >>> : ");
         return mav;
      }
      
      //메인창에서 회원 가입 버튼을 누를 시 , 이 컨트롤러를 거쳐 insert로 간다.
      @RequestMapping("spoMatchForm")
      public ModelAndView spoMatchForm(@ModelAttribute SpoMemberVO param) {
         log.info("SpoMemberController spoMatchForm strat >>> ");
         log.info(param.getSmb_no());
         ModelAndView mav = new ModelAndView();
         mav.setViewName(CONTEXT_PATH + "/spomember_insert");
         log.info("SpoMemberController spoMatchForm end >>> ");
         return mav;
      }
      
      @RequestMapping("spoUpdateForm")
      public ModelAndView spoUpdateForm(@ModelAttribute SpoMemberVO param, HttpServletRequest req) {
         log.info("SpoMemberController spoUpdateForm strat >>> ");
         log.info(param.getSmb_no());
         
         ModelAndView mav = new ModelAndView();
         //Session
         HttpSession session = req.getSession(false);
         if(session == null) {
            mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
            mav.setViewName("/login/loginForm");
            return mav;
         }else {
            String smb_no = String.valueOf(session.getAttribute("smb_no"));
            log.info(smb_no);
            param.setSmb_no(smb_no);
            
         }
         List<SpoMemberVO> list = spoMemberService.spoUpdateForm(param);
         int nCnt = list.size();
         log.info("nCnt >>> : " + nCnt);
         if(nCnt > 0) {
         
            param = (SpoMemberVO)list.get(0);
            log.info("no >>> : "+ param.getSmb_no());
            log.info("email >>> : " + param.getSmb_email());
            log.info("hp >>> : " + param.getSmb_hp());
            log.info("addr >>> : " + param.getSmb_addr());
            //email "@" 기준으로 분류하기
            String str = param.getSmb_email();
            String[] emailNum = str.split("@");
            String email1 = emailNum[0];
            String email2 = emailNum[1];
            log.info("email1 >>> : " + email1);
            log.info("email2 >>> : " + email2);
            param.setSmb_email(email1);
            param.setSmb_email1(email2);
            
            //핸드폰번호 "-" 기준으로 분류하기
            String str1 = param.getSmb_hp();
            String[] hpNum = str1.split("-");
            String hp1 = hpNum[0];
            String hp2 = hpNum[1];
            String hp3 = hpNum[2];
            log.info("hp1 >>> : " + hp1);
            log.info("hp2 >>> : " + hp2);
            log.info("hp3 >>> : " + hp3);
            
            //주소 "^" 기준으로 분류하기
            String str2 = param.getSmb_addr();
            log.info("str2 >>> : " + str2);
            String[] addrNum = str2.split("\\^");
            log.info("addrNum >>> : " + addrNum);
            
            for(String addrNum1 : addrNum) {
               System.out.println(addrNum1);
            }
            String addr1 = addrNum[0];
            String addr2 = addrNum[1];
            log.info("addr1 >>> : " + addr1);
            log.info("addr2 >>> : " + addr2);
            
            
            param.setSmb_addr(addr1);
            param.setSmb_addrdetail(addr2);
            
            
            
            log.info("SpoMemberController spoUpdateForm list >>> : " + list);
            
            int listCnt = list.size();
            for (int i=0;i<listCnt ; i++) {
               SpoMemberVO svo = (SpoMemberVO)list.get(i);
               log.info(" no() >>> : " + svo.getSmb_no());
               log.info(" mf() >>> : " + svo.getSmb_mf());
               log.info(" id >>> : " + svo.getSmb_id());
               log.info(" name >>> : " + svo.getSmb_name());
               log.info(" pw >>> : " + svo.getSmb_pw());
               log.info(" email >>> : " + svo.getSmb_email());
               log.info(" email1 >>> : " + svo.getSmb_email1());
               log.info(" addrno >>> : " + svo.getSmb_addrno());
               log.info(" addr >>> : " + svo.getSmb_addr());
               log.info(" addrdetail >>> : " + svo.getSmb_addrdetail());
               log.info(" hp >>> : " + svo.getSmb_hp());
               log.info(" gender >>> : " + svo.getSmb_gender());
               log.info(" height >>> : " + svo.getSmb_height());
               log.info(" weight >>> : " + svo.getSmb_weight());
               log.info(" g_weight >>> : " + svo.getSmb_g_weight());
               log.info(" activity >>> : " + svo.getSmb_activity());
               log.info(" deleteyn >>> : " + svo.getSmb_deleteyn());
               log.info(" insertdate >>> : " + svo.getSmb_insertdate());
               log.info(" updatedate >>> : " + svo.getSmb_updatedate());
               log.info(" tableno >>> : " + svo.getSpg_tableno());   
            }
            
         }
         
         
         
         
         
         mav.addObject("spoMemberList" , list);
         mav.setViewName("myPage/spoUpdateForm");
         log.info("SpoMemberController spoUpdateForm mav >>> : " + mav);
         log.info("SpoMemberController spoUpdateForm end >>> ");
         return mav;
      }
      
      /* 레코드 추가 */
      @RequestMapping("insertSpoMember")
      public String insertSpoMember(@ModelAttribute SpoMemberVO param, HttpServletRequest req) {
         
         log.info("SpoMemberController insertSpoMember >>> : ");
         log.info("SpoMemberController insertSpoMember param >>> : " + param);
         log.info("param.getSmb_no() >>> : " + param.getSmb_no());
         log.info("param.getSmb_mf() >>> : " + param.getSmb_mf());
         log.info("param.getSmb_id() >>> : " + param.getSmb_id());
         log.info("param.getSmb_bid() >>> : " + param.getSmb_bid());
         log.info("param.getSmb_name() >>> : " + param.getSmb_name());
         log.info("param.getSmb_pw() >>> : " + param.getSmb_pw());
         log.info("param.getSmb_bpw() >>> : " + param.getSmb_bpw());
         log.info("param.getSmb_email() >>> : " + param.getSmb_email());
         log.info("param.getSmb_email1() >>> : " + param.getSmb_email1());
         log.info("param.getSmb_addrno() >>> : " + param.getSmb_addrno());
         log.info("param.getSmb_addr() >>> : " + param.getSmb_addr());
         log.info("param.getSmb_addrdetail() >>> : " + param.getSmb_addrdetail());
         log.info("param.getSmb_hp() >>> : " + param.getSmb_hp());
         log.info(" req.getParameter(\"smb_hp1\") >>> : " + req.getParameter("smb_hp1"));
         log.info(" req.getParameter(\"smb_hp2\") >>> : " + req.getParameter("smb_hp2"));
         
         log.info("param.getSmb_gender() >>> : " + param.getSmb_gender());
         log.info("param.getSmb_height() >>> : " + param.getSmb_height());
         log.info("param.getSmb_weight() >>> : " + param.getSmb_weight());
         log.info("param.getSmb_g_weight() >>> : " + param.getSmb_g_weight());
         log.info("param.getSmb_activity() >>> : " + param.getSmb_activity());
         log.info("param.getSmb_deleteyn() >>> : " + param.getSmb_deleteyn());
         log.info("param.getSmb_insertdate() >>> : " + param.getSmb_insertdate());
         log.info("param.getSmb_updatedate() >>> : " + param.getSmb_updatedate());
         log.info("param.getSpg_tableno() >>> : " + param.getSpg_tableno());
         
         
         String email = param.getSmb_email();
         String email1 = param.getSmb_email1();
         
         String spoemail = email + "@" + email1;
         
         String addrno = param.getSmb_addrno();
         String addr = param.getSmb_addr();
         String addrdetail = param.getSmb_addrdetail();
         
         String spoaddr = addr + "^" + addrdetail;
         
         String hp = param.getSmb_hp();
         String hp1 = req.getParameter("smb_hp1");
         String hp2 = req.getParameter("smb_hp2");
         
         String spohp = hp + "-" + hp1 + "-" + hp2;
         
         param.setSmb_addr(spoaddr);
         param.setSmb_email(spoemail);
         param.setSmb_hp(spohp);
         
         /*
          * 클래스명 , 메소드명(매개변수)
          * string 타입
          * String str = str.split();
          * 
          * void 타입
          * String str = new String();
          * 
          * ex)
          * SpoMemberVO param = new SpoMemberVO();
          * 
          * param.setOOOOO(담을스트링값);
          *
          */
   
         String resultStr = "";
         //인증번호 6자리 생성
         String smb_approval_key = getKey(6);
         param.setSmb_approval_key(smb_approval_key);
         log.info("smb_approval_key >>> : " + smb_approval_key);
         

         
         int result = spoMemberService.insertSpoMember(param);

         //이메일 발송
         sendAuthMail(spoemail, smb_approval_key);
         
         //난수 발생 및 이메일 발송
         
         if(result > 0) resultStr = "등록이 완료 되었습니다.";
         else resultStr = "등록에 문제가 있어 완료하지 못했습니다.";
         
         
         
         
         return "redirect:index.jsp";
      
      }//end of insertSpoMember
      
      //난수 발생 함수
      private String getKey(int size) {
         log.info("난수 발생 함수 getKey 시작 >>> : ");
         this.size = size;
         return getAuthcode();
      }
      
      //인증코드 난수 발생
      private String getAuthcode(){
         log.info("인증 코드 난수 발생 getAuthcode 시작 >>> : ");
         Random random = new Random();
         StringBuffer sb = new StringBuffer();
         int num=0;
         
         while(sb.length()<size) {
            num = random.nextInt(10);
            sb.append(num);
         }
         return sb.toString();
      }
      //인증메일 보내기
      public void sendAuthMail(String smb_email, String smb_approval_key) {
            log.info("인증메일 보내기 sendAuthMail() 시작 >>> : ");
            
            String mailcontent = "[SpoMatch 인증]</h1><br>" +
                  "<p>아래 링크를 클릭하시면 회원 가입이 완료 됩니다.</p>" +
                     "<a href='http://localhost:8088/spoMatch/approvalUpdate.spo?smb_approval_key="+smb_approval_key+"&smb_email="+smb_email+"'>이메일 인증확인</a>";
            try {
               MimeMessage mailmessage = mailSender.createMimeMessage();
               MimeMessageHelper helper;
               helper = new MimeMessageHelper(mailmessage, true, "utf-8");
               helper.setFrom(new InternetAddress("big516129@gmail.com"));
               helper.setTo(new InternetAddress(smb_email));
               helper.setSubject("[SPOMATCH]회원가입 이메일 인증");
               helper.setText(mailcontent,true);
               mailSender.send(mailmessage);
            }catch(javax.mail.MessagingException e1) {
               e1.printStackTrace();
            }
      }
      
      //DB에 난수(smb_approval_status) Y로 업데이트
      @RequestMapping("approvalUpdate")
      public ModelAndView approvalUpdate(@ModelAttribute SpoMemberVO param) {
         log.info("approvalUpdate 함수 진입 >>> : " );
         log.info(" param.getSmb_approval_key() >>> : " + param.getSmb_approval_key());
         
         String resultStr = "";
         int result = spoMemberService.approvalUpdate(param);
         log.info("result >>> : " + result);
         if(result>0) {
            resultStr="회원등록이 완료되었습니다.";
            
         }else {
            resultStr="수정 문제가 있습니다.";
         }
         
         ModelAndView mav = new ModelAndView();
         mav.addObject("result", resultStr);
         mav.setViewName("redirect:index.jsp");
         log.info(resultStr);
         log.info("approvalUpdate 함수 끝 >>> : ");
         return mav;
               
      }
      
   
      
      
      /* 레코드 수정 */
      @RequestMapping("updateSpoMember")
      public ModelAndView updateSpoMember(@ModelAttribute SpoMemberVO param , HttpServletRequest req) {
         
         log.info("SpoMemberController updateSpoMember >>> : ");
         log.info("SpoMemberController updateSpoMember param >>> : " + param);
         log.info("param.getSmb_no() >>> : " + param.getSmb_no());
         log.info("param.getSmb_mf() >>> : " + param.getSmb_mf());
         log.info("param.getSmb_id() >>> : " + param.getSmb_id());
         log.info("param.getSmb_name() >>> : " + param.getSmb_name());
         log.info("param.getSmb_pw() >>> : " + param.getSmb_pw());
         log.info("param.getSmb_email() >>> : " + param.getSmb_email());
         log.info("param.getSmb_email1() >>> : " + param.getSmb_email1());
         log.info("param.getSmb_addrno() >>> : " + param.getSmb_addrno());
         log.info("param.getSmb_addr() >>> : " + param.getSmb_addr());
         log.info("param.getSmb_addrdetail() >>> : " + param.getSmb_addrdetail());
         log.info("param.getSmb_hp() >>> : " + param.getSmb_hp());
         log.info(" req.getParameter(\"smb_hp1\") >>> : " + req.getParameter("smb_hp1"));
         log.info(" req.getParameter(\"smb_hp2\") >>> : " + req.getParameter("smb_hp2"));
         log.info("param.getSmb_gender() >>> : " + param.getSmb_gender());
         log.info("param.getSmb_height() >>> : " + param.getSmb_height());
         log.info("param.getSmb_weight() >>> : " + param.getSmb_weight());
         log.info("param.getSmb_g_weight() >>> : " + param.getSmb_g_weight());
         log.info("param.getSmb_activity() >>> : " + param.getSmb_activity());
         log.info("param.getSmb_deleteyn() >>> : " + param.getSmb_deleteyn());
         log.info("param.getSmb_insertdate() >>> : " + param.getSmb_insertdate());
         log.info("param.getSmb_updatedate() >>> : " + param.getSmb_updatedate());
         log.info("param.getSpg_tableno() >>> : " + param.getSpg_tableno());
      
         log.info("param.getSmb_approval_key >>> : " + param.getSmb_approval_key());
         
         //핸드폰 번호 합치기
         String hp = param.getSmb_hp();
         String hp1 = req.getParameter("smb_hp1");
         String hp2 = req.getParameter("smb_hp2");
         String spohp = hp + "-" + hp1 + "-" + hp2;
         param.setSmb_hp(spohp);
         
         //이메일 합치기
         String email = param.getSmb_email();
         String email1 = param.getSmb_email1();
         
         String spoemail = email + "@" + email1;
         param.setSmb_email(spoemail);
         
         //주소 합치기
         String addrno = param.getSmb_addrno();
         String addr = param.getSmb_addr();
         String addrdetail = param.getSmb_addrdetail();
         
         String spoaddr = addr +"^" + addrdetail;
         param.setSmb_addr(spoaddr);
         
         
         
         String resultStr = "";
         int result = spoMemberService.updateSpoMember(param);
         log.info("result >>> : " + result);
         if(result > 0) resultStr = "수정 완료 되었습니다.";
         else resultStr = "수정에 문제가 있어 완료하지 못했습니다.";
         
         ModelAndView mav = new ModelAndView();
         mav.addObject("aList", result);
         mav.setViewName("myPage/result");
         
         return mav;
      }//end of updateSpoMember
      
      /* 레코드 삭제 */
      @RequestMapping("deleteSpoMember")
      public ModelAndView deleteSpoMember(@ModelAttribute SpoMemberVO param, HttpServletRequest req) {
         
         ModelAndView mav = new ModelAndView();
         String resultStr = "";
         int result = 0;
         //Session
         HttpSession session = req.getSession(false);
         if(session == null) {
            mav.addObject("result", "세션이 만료되었습니다. 다시 로그인해주세요.");
            mav.setViewName("/login/loginForm");
            return mav;
         }else {
            String smb_no = String.valueOf(session.getAttribute("smb_no"));
            log.info(smb_no);
            param.setSmb_no(smb_no);
            result = spoMemberService.deleteSpoMember(param);
         }
         
         if(result > 0) resultStr = "삭제 완료가 되었습니다.";
         else resultStr = "삭제가 문제가 있어 완료하지 못했습니다.";
         
         mav.addObject("aList", result);
         mav.setViewName("result");
         
         return mav;
         
      }//end of deleteSpoMember

      //아이디 중복검사
      @RequestMapping("checkID")
      @ResponseBody
      public String checkID(@ModelAttribute SpoMemberVO param) {
         log.info("SpoMemberController checkID 진입");
         log.info("parma.smb_id >>> " +param.getSmb_id());
         int result = 0;
         SpoMemberVO svo = spoMemberService.checkID(param);
         if(svo != null) {
            result = 1;
         }else {
            result = 0;
         }
         //List<SpoMemberVO> count = spoMemberService.checkID(param);
         //result = count.size();
         //디비값과 같으면 []   ,   디비에 값이 없으면 [
         //log.info("count>>> : " + count); 
         /*if(count == null) resultStr = "사용하셔도 좋은 아이디 입니다";
         else resultStr = null;*/
         log.info("SpoMemberController checkID result >>> " + result);
         //ModelAndView mav = new ModelAndView();
         //mav.addObject("result", result);
         //mav.setViewName("spoMember/spomember_insert");
         log.info("SpoMemberController checkID end >>> ");
         return String.valueOf(result);   
      }
      
}//end of class "SpoMemberController"