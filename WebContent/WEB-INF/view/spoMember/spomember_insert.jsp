<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>회원가입</title>
  <!-- CSS -->
  <link href="css/member/spomember_insert.css" rel="stylesheet" />
  <script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
$(document).ready(function(){
      
      //패스워드 일치 불일치 
      $('#smb_pw').keyup(function(){
         $('#pwCheckFF').text('');
      });
      
      $('#smb_bpw').keyup(function(){
         if($("#smb_pw").val()!=$('#smb_bpw').val()){
            $('#pwCheckFF').text('');
            $('#pwCheckFF').html("패스워드가 불일치 합니다.");
         }else{
            $('#pwCheckFF').text('');
            $('#pwCheckFF').html("패스워드가 일치합니다.");
         }
      });
      
      //패스워드 유효성 검사 및 체크
      $('#pwCheck').click(function(){
         if(document.spoMemberForm.smb_pw.value.length == 0){
            alert("비밀번호를 입력하세요!!");
            document.getElementById("smb_pw").focus();
            return false;
         }else{
            var length = document.spoMemberForm.smb_pw.value.length;
            if(length < 8 || length > 12){
               alert("비밀번호 오류 - 8자 이상 12자 이하");
               document.getElementById("smb_pw").focus();
               return false;
            }else{
               //정규식 영문 대문자 소문자 특수문자 숫자 조합 인데 다넣었는데 유효성검사 뜸...다시 처리
               var exp =/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

               if(!exp.test($("#smb_pw").val())){
                  console.log("비밀번호 유효성");
                  alert("비밀번호는 8~15자 특수문자 영대문자 영소문자 숫자 조합으로 구성해주세요! ");
                  return false;
               }
            }
            alert("비밀번호가 일치합니다.");
            //document.getElementById("smb_addrno").focus();
         }
      });
      

      
      
   
      //아이디 유효성 검사 6~10글자 영문 대문자 소문자 숫자만 가능
      $('.idCheck').click(function(){
         
         if(document.spoMemberForm.smb_id.value.length == 0){
            alert("아이디를 입력하세요!");
            document.getElementById("smb_id").focus();
            return false;
         }else{
            var length = document.spoMemberForm.smb_id.value.length;
            if(length < 6 || length > 10) {
               alert("아이디 오류 - 6자 이상 10자 이하");
               document.getElementById("smb_id").focus();
               return false;
            }else{
               var exp = /^[A-Za-z0-9+]{6,10}$/; 
               if(!exp.test($("#smb_id").val())){
                  console.log("아이디 유효성");
                  alert("아이디에 적합한 문자열을 입력~~~~~~~");
                  return false;
               }
            }
         }
         idCheckFunc();
      });
      
      
      
      
      
      
      $("#insertData").click(function(){
         console.log(document.spoMemberForm.smb_id.value.length);
         
         //아이디 공백시
         if(document.spoMemberForm.smb_id.value == "아이디를 입력하세요"){
            alert("아이디를 입력하세요.");
            document.getElementById("smb_id").focus();
            return false;
         }
         
         //중복체크 버튼 안누를시 
         if(document.spoMemberForm.check_id.value != "idCheck"){
            alert("아이디 중복체크 버튼을 눌러주세요.");
            return false;
         
         }
         
         //비밀번호 공백시
         if(document.spoMemberForm.smb_pw.value == 0){
            alert("비밀번호를 입력하세요.");
            document.getElementById("smb_pw").focus();
            return false;
         }
         
         //비밀번호 공백시
         if(document.spoMemberForm.smb_bpw.value == 0){
            alert("비밀번호를 한번 더 입력하세요.");
            document.getElementById("smb_bpw").focus();
            return false;
         }
         
         //주소 공백시
         if(document.spoMemberForm.smb_addrno.value == "우편번호"){
            alert("주소를 입력하세요.");
            document.getElementById("smb_addr").focus();
            return false;
         }
         
         //이메일 공백시
         if(document.spoMemberForm.smb_email.value == " "){
            alert("인증을 위해 이메일은 정확히 써주세요.");
            document.getElementById("smb_email").focus();
            return false;
         }
         //핸드폰 공백시
         if(document.spoMemberForm.smb_hp.value == " "){
            alert("핸드폰 번호를 입력해주세요.");
            document.getElementById("smb_hp").focus();
            return false;
         }
         if(document.spoMemberForm.smb_gender.value == 0){
            alert("성별을 체크해주세요.");
            return false;
         }
      
         
         //이름 한글 또는 영문으로 2~10자 사이로 받기
         if(document.spoMemberForm.smb_name.value == 0){
            alert("이름을 입력하세요!");
            document.getElementById("smb_name").focus();
            return false;
         }else{
            var length = document.spoMemberForm.smb_name.value.length;
            if(length < 2 || length > 6) {
               alert("이름 오류 - 2자 이상 6자 이하");
               document.getElementById("smb_name").focus();
               return false;
            }else{
               var exp = /^[가-힣a-zA-Z]+$/;
               if(!exp.test($("#smb_name").val())){
                  console.log("이름 유효성");
                  return false;
            }
            }
            document.getElementById("smb_pw").focus();
         }
         
         
         
         
         if(confirm('등록을 진행할까요?')){
            $("#spoMemberForm").attr("action", "/spoMatch/insertSpoMember.spo");
            $("#spoMemberForm").submit();
         }
      });
      
      // 텍스트필드 기본갑(Default Text Label)
      $('input[type="text"]').each(function(){

         this.value = $(this).attr('title');
         $(this).addClass('text-label');

         $(this).focus(function(){
            if(this.value == $(this).attr('title')) {
               this.value = '';
               $(this).removeClass('text-label');
            }
         });

         $(this).blur(function(){
            if(this.value == '') {
               this.value = $(this).attr('title');
               $(this).addClass('text-label');
            }
         });
      });
      
      
      
      
   });
   

   function emailCheck(){
      
      var eVal = document.spoMemberForm.smb_email2.options[document.spoMemberForm.smb_email2.selectedIndex].value;
                  
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
   
   
   function idCheckFunc(){
      
      var datas = {
            "smb_id" : $("#smb_id").val()
      };
      console.log(datas);
      $.ajax({
         url : "/spoMatch/checkID.spo",
         type : "POST",
         data : {
            "smb_id" : $("#smb_id").val()   
         },
         success : whenSuccess,
         error : whenError
      });
      function whenSuccess(data){
         if(data != '0'){
            alert("이미 사용중인 아이디 입니다.");
            $("#smb_id").val("");
            $("#smb_id").focus();
         }else{
            alert("사용 가능한 아이디 입니다.");
            $("#smb_name").focus();
            $("#check_id").val("idCheck");
         }
      }
      
      function whenError(){
         
         alert("실패");
      }
   }
   
   
   
</script>

</head>
<body id="page-top">
<%@include file="../common/header.jsp" %>
<!-- ******************************************Content****************************************** -->
<section>
    <div class="container">
        <h1>회원가입</h1>
        <form id="spoMemberForm" name="spoMemberForm" method="post"   >
            <!--<div class="spoMemberForm_item">
                <div>회원 번호 </div>
                <input type="text" name="smb_no" id="smb_no"/>
            </div>-->
            <div class="spoMemberForm_item memberId">
                <div class="item_name ness">아이디 </div>
                <div class="item_content">
                       <input type="text" name="smb_id" id="smb_id" size="30" maxlength="20" title="아이디를 입력하세요"  />
      <input type="hidden" name="check_id" id="check_id"/>
      <input type="button" name="smb_bid" id="smb_bid" value="아이디 중복 확인" class="idCheck"/>

                </div>
            </div>
            <div class="spoMemberForm_item">
                <div class="item_name ness">이름</div>
                <div class="item_content">
                   <input type="text" name="smb_name" id="smb_name" title="이름을 입력하세요"/>
                </div>
            </div>
            <div class="spoMemberForm_item">
                <div class="item_name ness">비밀번호</div>
                <div class="item_content">
                  <input type="password" name="smb_pw" id="smb_pw"  />
      <input type="hidden" name="check_pw" id="check_pw"/>
                    <!--<p id="pwCheckF" style="color: #FF6600; margin: 0;">???</p> -->
                </div>
            </div>
            <div class="spoMemberForm_item">
                <div class="item_name">비밀번호 확인</div>
                <div class="item_content">
                    <input type="password" name="smb_bpw" id="smb_bpw"/>
                    <input type="button" class="item_btn" name="pwCheck" id="pwCheck" value="비밀번호확인"/>
                    <div id="pwCheckFF" style="color: #FF6600; margin: 0; font-size: 11px;"></div>
                </div>
            </div>
            <div class="spoMemberForm_item">
                <div class="item_name road ness">도로명 주소</div>
                <div style="display: block;">
                    <div class="item_content road_content">
                        <div style="margin-bottom: 5px;">
                            <input type="text" class="tx_short" name="smb_addrno" id="smb_addrno" title="우편번호" value="" size=6 style="width: 75px; padding: 10px 0px;"/>
                            <input type="button" class="item_btn" value="우편번호 찾기" onclick="addrCheck()" style="padding: 5.5px 0;"/>
                        </div>
                        <input type="text" name="smb_addr" id="smb_addr" style="margin-bottom: 5px;"  title="도로명 주소" value="" readOnly /><br>
                        <input type="text" name="smb_addrdetail" id="smb_addrdetail" title="도로명 상세 주소" value="" /></br/>
                    </div>                
                </div>
            </div>
            <div class="spoMemberForm_item">
                <div class="item_name ness">이메일</div>
                <div class="item_content">
                    <input type="text" id="smb_email" name="smb_email" title=" " value="" size=10 style="width: 150px;" onfocus="this.value=";"/> @
                    <input type="text" id="smb_email1" name="smb_email1" title=" " value="선택해주세요" size=10 style="width: 150px;" readOnly /> 
                    <select name="smb_email2" style="vertical-align: middle;" onchange="emailCheck()">
                        <option value="0">선택해주세요</option>
                        <option value="9">직접입력</option>
                        <option>naver.com</option>
                        <option>gmail.com</option>
                    </select>
                </div>
            </div>
            <div class="spoMemberForm_item">
                <div class="item_name ness">핸드폰 번호</div>
                <div class="item_content">
                    <input type="text" class="item_hp" name="smb_hp" id="smb_hp" title=" " value="" size=1 maxlength="3" style="width: 70px; padding: 10px 0px;"/>&nbsp;-&nbsp;
                    <input type="text" class="item_hp" name="smb_hp1" id="smb_hp1" title=" " value="" size=2 maxlength="4" style="width: 70px; padding: 10px 0px;"/>&nbsp;-&nbsp;
                    <input type="text" class="item_hp" name="smb_hp2" id="smb_hp2" title=" " value="" size=2 maxlength="4" style="width: 70px; padding: 10px 0px;"/>
                </div>
            </div>
            <div class="spoMemberForm_item">
                <div class="item_name ness">성별</div>
                <div style="display: flex;">
                    <div class="item_content gender">
                        <div class="gender_male">
                            <input type="radio" name="smb_gender" id="smb_gender" value="남성"><span>남성</span>
                        </div>
                        <div class="gender_female">
                            <input type="radio" name="smb_gender" id="smb_gender" value="여성"><span>여성</span>    
                        </div>
                    </div>                 
                </div>
            </div>
            <div class="spoMemberForm_item">
                <div class="item_name">키</div>
                <div class="item_content">
                    <input type="text" name="smb_height" id="smb_height" title=" " value="" maxlength="3" style="width: 60px; padding: 10px 0px;"/>&nbsp;cm
                </div>
            </div>
            <div class="spoMemberForm_item">
                <div class="item_name">체중</div>
                <div class="item_content">
                    <input type="text" name="smb_weight" id="smb_weight" title=" " value="" maxlength="3" style="width: 60px; padding: 10px 0px;"/>&nbsp;kg
                </div>
            </div>
            <div class="spoMemberForm_item">
                <div class="item_name">목표 체중</div>
                <div class="item_content">
                    <input type="text" name="smb_g_weight" id="smb_g_weight" title=" " value="" maxlength="3" style="width: 60px; padding: 10px 0px;"/>&nbsp;kg
                </div>                    
            </div>
            <div class="spoMemberForm_item last">
                <div class="item_name">활동 지수</div>
                <div class="item_content">
                    <select name="smb_activity" id="smb_activity" onchange="activityCheck()">
                        <option value="25">앉아서 하는 일 </option>
                        <option value="30">서서 하는 일 </option>
                        <option value="35">활동량이 많은 일 </option>
                        <option value="40">운동선수, 농사 등 활동량이 많은 일</option>    
                    </select>
                </div>
            </div>
            <!--<div  name="memberbtndiv" id="memberbtndiv">   -->
            <div alig="center" class="spoMemberForm_item submitbtn">
                <input type="button" id="insertData" value="회원 등록" />
                <input type="button" id="closeWindow" value="닫기"/>
            </div>   
        </form>
    </div>
</section>
<%@include file="../common/footer.html" %>
</body>

</html>