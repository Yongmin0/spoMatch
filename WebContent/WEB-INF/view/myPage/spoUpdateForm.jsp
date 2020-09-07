<%@page import="kosmo62.spomatch.member.vo.SpoMemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보 수정 </title>
<link href="css/member/spoupdateForm.css" rel="stylesheet" />
<script type="text/javascript"
              src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
      
   <style type="text/css">
         .mem{ text-align: center;}
   </style>
   
<style type="text/css">
      table, td{
            border: 1px solid blue
      }
      table {
            width: 60%;
            margin: auto;
      }


</style>
<script type="text/javascript">

   $(document).ready(function(){
      
      var spoGender = document.getElementById("smb_gender1").value;
      console.log(spoGender);
      
      var genderV = document.getElementsByName("smb_gender");
      console.log(genderV);
      console.log(genderV[0].value);
      console.log(genderV[1].value);
      for(var i=0;i<genderV.length;i++){
         console.log(genderV[i]);
         console.log(genderV.length);
         if(spoGender == genderV[i].value){
            
            console.log("if문 안>>> : " + genderV[i]);
            genderV[i].checked=true;
         }
      }

      //select option 선택값에 의해 바뀜   
      console.log($("#smb_activity1").val());
      $("#smb_activity").val($("#smb_activity1").val());

      
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
      //id 중복확인 버튼 눌렀을 시 , ajax를 이용해서 url을 컨트롤러를 가르킨담에
      //db에 id값과 비교해서 success 와 fail을 구분한다. 
      
      //pw는 두개의 입력값을 여기서 받기때문에
      //javascript로 이용해서 여기서 비교를 한다.
      
      
   });
   
   function emailCheck(){
      alert(" emailCheck 함수 진입");
      var eVal = document.spoMemberForm.smb_email2.options[document.spoMemberForm.smb_email2.selectedIndex].value;
      alert("eVal >>> : " + eVal);            
      if (eVal == '0'){                        
         document.spoMemberForm.smb_email1.readOnly = true;
         document.spoMemberForm.smb_email1.value = "";
      }
      if (eVal == '9'){
         document.spoMemberForm.smb_email1.readOnly = false;
         document.spoMemberForm.smb_email1.value = "";
         document.spoMemberForm.smb_email1.focus();
      }else{
         document.spoMemberForm.smb_email1.readOnly = true;
         document.spoMemberForm.smb_email1.value = eVal;
      }            
   }
   
   function addrCheck(){
      alert(" addrCheck 함수 진입");   
      var width = 500;
      var height = 600;
      daum.postcode.load(function(){
         new daum.Postcode({
            oncomplete: function(data){                     
               console.log("새우편번호 >>> : " + data.zonecode);
               console.log("주소값 >>> : " + data.address);
               console.log("빌딩값 >>> : " + data.buildingName);   
               document.spoMemberForm.smb_addrno.value = data.zonecode;   
               //document.spoMemberForm.smb_addr.value = data.address;
               document.spoMemberForm.smb_addr.value = data.address;
               document.spoMemberForm.smb_addrdetail.value = data.buildingName;
            }   
         }).open({
            left: (window.screen.width / 2) - (width / 2),
            top: (window.screen.height / 2) - (height / 2),
         });                  
      });            
   }
   
   function activityCheck(){
      alert(" activityCheck 함수 진입");
      var eVal = document.spoMemberForm.smb_activity.options[document.spoMemberForm.smb_activity.selectedIndex].value;
      alert("eVal >>> : " + eVal);            
      if (eVal == '9'){
         document.spoMemberForm.smb_activity.readOnly = false;
         document.spoMemberForm.smb_activity.value = "";
         document.spoMemberForm.smb_activity.focus();
      }else{
         document.spoMemberForm.smb_activity.readOnly = true;
         document.spoMemberForm.smb_activity.value = eVal;
      }            
   }



</script>


</head>
<body>
 <%@ include file="../common/header.jsp" %>
<!-- Content -->
<section>
	<div class="container">
		<!--side메뉴 + Content 부분-->
		<div class="mypage_content">
			<div class="mypage_side">
				<div class="mypage_icon">
					<!--개인정보-->
					<div class="icon icon_user">
						<div class="icon_subject">
							<img src="/spoMatch/img/updatemember/mypage_user.png" /><span>&nbsp;개인정보</span>
						</div>
						<!--sub_sidemenu-->
						<ul>
							<li><a href="spoUpdateForm.spo">┗&nbsp;회원 수정/탈퇴</a></li>
						</ul>
					</div>
					<!--매칭현황-->
					<div class="icon icon_matching">
						<div class="icon_subject">
							<img src="/spoMatch/img/updatemember/mypage_football.png" /><span>&nbsp;My 매칭</span>
						</div>
						<!--sub_sidemenu-->
						<ul>
							<li><a href="mypageListMatch.spo" >┗&nbsp;매칭등록 현황</a></li>
							<li><a href="mypageListApply.spo" >┗&nbsp;매칭신청 현황</a></li>
						</ul>
					</div>
					<!--게시글현황-->
					<div class="icon icon_board">
						<div class="icon_subject">
							<img src="/spoMatch/img/updatemember/mypage_board.png" /><span>&nbsp;게시글 현황</span>
						</div>
						<ul>
							<li><a href="mylistboard.spo">┗&nbsp;게시글 등록 현황</a></li>
						</ul>
					</div>
					<!--1대1 문의-->
					<div class="icon icon_question">
						<div class="icon_subject">
							<img src="/spoMatch/img/updatemember/mypage_question.png" /><span>&nbsp;1대1 문의하기</span>
						</div>
						<ul>
							<li><a href="listBoard.spo">┗&nbsp;문의 게시판</a></li>
						</ul>
					</div>
				</div>
			</div>
                  <div id="main_content" >
	                  <!--content부분-->
	                  <form id="spoMemberForm" name="spoMemberForm" method="post">
	                     <div class="main_content" name="memberdiv" id="memberdiv">
	            
	                     <%
	                        Object obj = request.getAttribute("spoMemberList");
	                        System.out.println("spoMember_UD_List >>> : " + obj);
	                        
	                        if(obj != null){
	                           ArrayList aList = (ArrayList)obj;
	                           if(aList != null && aList.size() > 0){
	                              int nCnt = aList.size();
	                              for(int i=0;i<nCnt;i++){
	                                 SpoMemberVO svo = (SpoMemberVO)aList.get(i);
	                                 System.out.println("for 문 안에 SpoMemberVO svo >>> : " + svo);
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
	                                 System.out.println("svo.getSmb_height() >>> : " + svo.getSmb_height());
	                                 System.out.println("svo.getSmb_weight() >>> : " + svo.getSmb_weight());
	                                 System.out.println("svo.getSmb_g_weight() >>> : " + svo.getSmb_g_weight());
	                                 System.out.println("svo.getSmb_activity() >>> : " + svo.getSmb_activity());
	                              %>
	                           <!--회원정보-->
	                           <h4>나의 회원정보</h4>
	                           <!--내용-->
	                           <div class="main_main">
	                              <!--회원 번호-->
	                              <div class="contents">
	                                 <p>회원 번호</p>
	                                 <input type="text" name="smb_no" id="smb_no" value="<%=svo.getSmb_no()%>" readonly/>
	                              </div>
	                              <!--아이디-->
	                              <div class="contents">
	                                 <p>아이디</p>
	                                 <input type="text" name="smb_id" id="smb_id" value="<%= svo.getSmb_id()%>"/>
	                                 <input type="button" name="smb_bid" id="smb_bid" value="아이디 중복 확인" class="idCheck" readonly/>
	                              </div>
	                              <!--이름-->
	                              <div class="contents">
	                                 <p>이름</p>
	                                 <input type="text" name="smb_name" id="smb_name" value="<%= svo.getSmb_name() %>" readonly/>
	                              </div>
	                              <!--비밀번호-->
	                              <div class="contents">
	                                 <p>비밀번호</p>
	                                 <input type="text" name="smb_pw" id="smb_pw" value="<%= svo.getSmb_pw() %>"/>
	                              </div>
	                              <!--비밀번호 확인-->
	                              <div class="contents">
	                                 <p>비밀번호 확인</p>
	                                 <input type="text" name="smb_bpw" id="smb_bpw" value="<%= svo.getSmb_pw()%>"/>
	                                 <input type="button" name="smb_bpw" id="smb_bpw" value="비밀번호확인"/>
	                              </div>
	                              <!--도로명 주소-->
	                              <div class="contents">
	                                 <p>주소</p>
	                                 <div class="main_juso">
	                                    <!--우편번호부분-->
	                                    <div class="main_postnum">
	                                       <input type="text" name="smb_addrno" id="smb_addrno" value="<%= svo.getSmb_addrno()%>"/>
	                                       <input type="button" value="우편번호찾기" onclick="addrCheck()" />
	                                    </div>
	                                    <!--도로명 주소 부분-->
	                                    <div class="main_address">
	                                       <input type="text" name="smb_addr" id="smb_addr" value="<%= svo.getSmb_addr()%>" readOnly />
	                                       <input type="text" name="smb_addrdetail" id="smb_addrdetail" value="<%= svo.getSmb_addrdetail()%>"/>
	                                    </div>
	                                 </div>
	                              </div>
	                              <!--이메일 부분-->
	                              <div class="contents">
	                                 <p>이메일</p>
	                                 <div class="main_email">
	                                    <input class="email_id" type="text" id="smb_email" name="smb_email" size=10 value="<%= svo.getSmb_email()%>"/>&nbsp;@
	                                    <input class="email_address" type="text" id="smb_email1" name="smb_email1" size=10 readOnly value="<%= svo.getSmb_email1()%>"/>
	                                    <select name="smb_email2" onchange="emailCheck()">
	                                       <option value="0">선택해주세요</option>
	                                       <option value="9">직접입력</option>
	                                       <option>naver.com</option>
	                                       <option>google.com</option>
	                                    </select>
	                                 </div>
	                              </div>
	                              <%
	                                 //핸드폰번호 "-" 기준으로 분류하기
	                                 String str1 = svo.getSmb_hp();
	                                 String[] hpNum = str1.split("-");
	                              %>
	                           <!--핸드폰 부분-->
	                           <div class="contents">
	                              <p>핸드폰</p>
	                              <div class="main_phone">
	                                 <input type="text" name="smb_hp" id="smb_hp" size=1 maxlength="3" value="<%=hpNum[0] %>" />&nbsp;-&nbsp;
	                                 <input type="text" name="smb_hp1" id="smb_hp1" size=1 maxlength="4" value="<%=hpNum[1] %>"/>&nbsp;-&nbsp;
	                                 <input type="text" name="smb_hp2" id="smb_hp2" size=1 maxlength="4" value="<%=hpNum[2] %>"/>
	                              </div>
	                           </div>
	                           <!--성별 부분-->
	                           <div class="contents">
	                              <p>성별</p>
	                              <div class="main_gender">
	                                 <input type="hidden" name="smb_gender1" id="smb_gender1" value="<%= svo.getSmb_gender()%>"/>
	                                 <div>
	                                    <input type="radio" name="smb_gender" id="smb_gender_M" value="남성"/>
	                                    <span>남성</span>
	                                 </div>
	                                 <div>
	                                    <input type="radio" name="smb_gender" id="smb_gender_F" value="여성"/>
	                                    <span>여성</span>
	                                 </div>
	                              </div>
	                           </div>
	                           <!--키 부분-->
	                           <div class="contents main_physical">
	                              <p>키</p>
	                              <input type="text" name="smb_height" id="smb_height" value="<%= svo.getSmb_height()%>"/><span>&nbsp;cm</span>
	                           </div>
	                           <!--체중 부분-->
	                           <div class="contents main_physical">
	                              <p>체중</p>
	                              <input type="text" name="smb_weight" id="smb_weight" value="<%= svo.getSmb_weight()%>"/><span>&nbsp;kg</span>
	                           </div>
	                           <!--목표체중 부분-->
	                           <div class="contents main_physical">
	                              <p>목표체중</p>
	                              <input type="text" name="smb_g_weight" id="smb_g_weight" value="<%= svo.getSmb_g_weight()%>" /><span>&nbsp;kg</span>
	                           </div>
	                           <!--활동지수 부분-->
	                           <div class="contents main_activity">
	                              <p>활동지수</p>
	                              <input type="hidden" name="smb_activity1" id="smb_activity1" value="<%= svo.getSmb_activity()%>" />
	                              <select name="smb_activity" id="smb_activity">
	                                 <option value="25">앉아서 하는 일 </option>
	                                 <option value="30">서서 하는 일 </option>
	                                 <option value="35">활동량이 많은 일 </option>
	                                 <option value="40">운동선수, 농사 등 활동량이 많은 일</option>  
	                              </select>
	                           </div>
	                        </div>
	                     </div>
	                        
	            <%
	                     }
	                  }
	               }
	            
	            %>
	                  <!--버튼 부분-->
	                  <div class="main_btn" name="memberbtndiv" id="memberbtndiv">
	                     <input type="button" id="updateData" value="회원수정">
	                     <input type="button" id="deleteData" value="탈퇴">
	                  </div>
	               </form>
            	</div>
            </div>
            <!--End of Content부분-->
         </div>
         <!--End of side메뉴 + Content 부분-->
	</section>
	<%@include file="../common/footer.html" %>
</body>
</html>