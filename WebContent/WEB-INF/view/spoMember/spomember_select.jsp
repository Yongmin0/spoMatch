<%@page import="kosmo62.spomatch.member.vo.SpoMemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/member/selectmember.css" rel="stylesheet" />
<title>회원 목록</title>
<script type="text/javascript">

   $(document).ready(function(){
      var mode = "${mode}";
      
      $("#insertData").click(function(){
         
         if(confirm('등록을 진행할까요?')){
            $("#spoMemberForm").attr("action", "/spoMatch/spoMatchForm.spo");
            $("#spoMemberForm").submit();
         }
      });
      
      $("#updateData").click(function(){
         if(confirm('수정을 진행할까요?')){
            $("#spoMemberForm").attr("action", "/spoMatch/updateSpoMember.spo");
            $("#spoMemberForm").submit();
         }
      });
      
      $("#deleteData").click(function(){
         if(confirm('삭제를 진행할까요?')){
            $("#spoMemberForm").attr("action", "/spoMatch/deleteSpoMember.spo");
            $("#spoMemberForm").submit();
         }
      });
      
      
      
   });
   
   

</script>


</head>
<body>
<%@include file="../common/header.jsp" %>
<!-- Content -->
<section>
   <div class="container">
         <h1>회원 목록</h1>
   

         <div name="memberdiv" id="memberdiv">
            <div>
            <form class="spoMemberForm" name="spoMemberForm" id="spoMemberForm" method="post">
               
            </form>
   
            <div class="member">
            <div class="member_info">
               <div class="info smb_no" style="width: 30%;">회원번호</div>
               <div class="info smb_id" style="width: 40%;">아이디</div>
               <div class="info smb_name" style="width: 20%;">이름</div>
               <div class="info smb_pw" style="width: 25%;">비밀번호</div>
               <div class="info smb_email" style="width: 30%;">이메일</div>
               <div class="info smb_addrno" style="width: 20%;">우편번호</div>
               <div class="info smb_addr" style="width: 40%;">주소</div>
               <div class="info smb_hp" style="width: 25%;">핸드폰 번호</div>
               <div class="info smb_gender" style="width: 15%;">성별</div>
               

            </div>
            
<%
      Object obj = request.getAttribute("spoMemberList");
      System.out.println("spoMember_select obj >>> : " + obj);
      
      if(obj != null){
         ArrayList aList = (ArrayList)obj;
         if(aList != null && aList.size() > 0){   
            int nCnt = aList.size();
            for(int i=0;i<nCnt;i++){
               SpoMemberVO svo = (SpoMemberVO)aList.get(i);
               System.out.println("for문 안에  SpoMemberVO svo >>> : " + svo);
               System.out.println("svo.getSmb_no() >>> : " + svo.getSmb_no());
               System.out.println("svo.getSmb_mf() >>> : " + svo.getSmb_mf());
               System.out.println("svo.getSmb_id() >>> : " + svo.getSmb_id());
               System.out.println("svo.getSmb_name() >>> : " + svo.getSmb_name());
               System.out.println("svo.getSmb_pw() >>> : " + svo.getSmb_pw());
               System.out.println("svo.getSmb_bpw() >>> : " + svo.getSmb_bpw());
               System.out.println("svo.getSmb_email() >>> : " + svo.getSmb_email());
               System.out.println("svo.getSmb_addrno() >>> : " + svo.getSmb_addrno());
               System.out.println("svo.getSmb_addr() >>> : " + svo.getSmb_addr());
               System.out.println("svo.getSmb_hp() >>> : " + svo.getSmb_hp());
               System.out.println("svo.getSmb_gender() >>> : " + svo.getSmb_gender());
               
               
               
   %>
   
   
         <div class="member_content" >
            <div class="content content_no" style="width: 30%;"><%= svo.getSmb_no() %></div>
            <div class="content content_id" style="width: 40%;"><%= svo.getSmb_id() %></div>
            <div class="content content_name" style="width: 20%;"><%= svo.getSmb_name() %></div>
            <div class="content content_pw" style="width: 25%;"><%= svo.getSmb_pw() %></div>
            <div class="content content_email" style="width: 30%;"><%= svo.getSmb_email() %></div>
            <div class="content content_addrno" style="width: 20%;"><%= svo.getSmb_addrno() %></div>
            <%
               String SpoAddr = svo.getSmb_addr();
               SpoAddr = SpoAddr.replace('^',' ');
            %>
            <div class="content content_addr" style="width: 40%;"><%= svo.getSmb_addr() %></div>
            <div class="content content_hp" style="width: 25%;"><%= svo.getSmb_hp() %></div>
            <%
               String Spogender = svo.getSmb_gender();
               if (Spogender.equals("female")){
                  Spogender = "여성";
               }else{
                  Spogender = "남성";
               }
            %>
            <div class="content content_gender" style="width: 15%;"><%= svo.getSmb_gender() %></div>
            
            
            
         </div>

   <%
            }
         }
      }
         
   %>
   </div>
   </div>
   <div class="container">
      <div class="row col-lg-8 mx-auto date">
         <div>
            <form id="dateSearchForm" name="dateSearchForm">   
            <div>
               <p>
                  <input type="button" id="insertData" name="insertData" value="등록"/>   
                  <input type="button" id="updateData" name="updateData" value="수정"/>   
                  <input type="button" id="deleteData" name="deleteData" value="삭제"/>   
                  <input type="button" id="closeWindow" name="closeWindow" value="닫기"/>   
               </p>
            </div>
         </form>
         </div>
      </div>


</div>
</section>
<%@include file="../common/footer.html" %>
</body>
</html>