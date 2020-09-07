<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 </title>
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<% 
	//Object obj = request.getAttribute("result"); 
	//int result = (int)obj;
%>
<script type="text/javascript">
$(document).ready(function(){
		/*
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
		*/
		/*
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
					var exp = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[$@$!%*#?&])[A-Za-z[0-9]$@$!%*#?&]{8,12}$/;

					if(!exp.test($("#smb_pw").val())){
						console.log("비밀번호 유효성");
						return false;
					}
				}
				document.getElementById("smb_addr").focus();
			}
		});
		*/

		
		
		/*
		//아이디 유효성 검사 6~10글자 영문 대문자 소문자 숫자만 가능
		$('#idCheck').click(function(){
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
						return false;
					}
				}
				document.getElementById("smb_name").focus();
			}
		});
		*/
		
		
		
		
		
		$("#insertData").click(function(){
			/*
			//이름 한글 또는 영문으로 2~10자 사이로 받기
			if(document.spoMemberForm.smb_name.value.length == 0){
				alert("이름을 입력하세요!");
				document.getElementById("smb_name").focus();
				return false;
			}else{
				var length = document.spoMemberForm.smb_name.value.length;
				if(length < 2 || length > 10) {
					alert("이름 오류 - 2자 이상 10자 이하");
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
			
			//아이디 공백시
			if(document.spoMemberForm.smb_id.value.length == 0){
				alert("아이디를 입력하세요.");
				document.getElementById("smb_id").focus();
				return false;
			}
			//중복체크 버튼 안누를시 
			if(document.spoMemberForm.idDuplication.value != "idCheck"){
				alert("아이디 중복체크 버튼을 눌러주세요.");
				return false;
			}*/
		
			
			if(confirm('등록을 진행할까요?')){
				$("#spoMemberForm").attr("action", "/spoMatch/insertSpoMember.spo");
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
	
	
	function idCheckFunc(){
		alert("idCheckFunc start >>> : ");
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
	}
	
	function whenSuccess(data){
		if(data != '0'){
			alert("이미 사용중인 아이디 입니다.");
			$("#smb_id").val("");
			$("#smb_id").focus();
		}else{
			alert("사용 가능한 아이디 입니다.");
			$("#smb_name").focus();
		}
		//alert("성공");
		//console.log(data.getAttribute("result"));
	}
	
	function whenError(){
		
		alert("실패");
	}
	
	
</script>

</head>
<body>
		<form id="spoMemberForm" name="spoMemberForm" method="post"	>
		<div name="memberdiv" id="memberdiv">
				<table>
					<tr>
						<td>회원 번호 </td>
						<td><input type="text" name="smb_no" id="smb_no"/></td>	
					</tr>
				
					<tr>
						<td>아이디 </td>
						<td>
						<input type="text" name="smb_id" id="smb_id" size="30" maxlength="20" placeholder="아이디를 입력하세요" />
						<input type="button" name="smb_bid" id="smb_bid" value="아이디 중복 확인" onclick="idCheckFunc()"/>
						<a href="#none" id="_btnGetId" title="회원가입"></a>
						<div id="_regetid"></div>
						
						</td>
					</tr>
					<tr>
						<td>이름  </td>
						<td><input type="text" name="smb_name" id="smb_name"/></td>	
					</tr>
					

					<tr>
						<td>도로명 주소 </td>
						<td>
							<input type="text" name="smb_addrno" id="smb_addrno" size=6 />
							<input type="button" value="우편번호 찾기" onclick="addrCheck()"/>(도로명주소)<br/>
							<input type="text" name="smb_addr" id="smb_addr" readOnly /><br>
							<input type="text" name="smb_addrdetail" id="smb_addrdetail" /></br/>
						</td>	
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input type="text" id="smb_email" name="smb_email" size=10 onfocus="this.value=";"/> @
							<input type="text" id="smb_email1" name="smb_email1" value="" size=10 readOnly /> 
							<select name="smb_email2" onchange="emailCheck()">
								<option value="0">선택하세요</option>
								<option value="9">직접입력</option>
								<option>naver.com</option>
								<option>gmail.com</option>
							</select> 
						</td>
					</tr>
					<tr>
						<td>핸드폰 번호</td>
						<td><input type="text" name="smb_hp" id="smb_hp" size=1/>-
						<input type="text" name="smb_hp1" id="smb_hp1" size=1/>-
						<input type="text" name="smb_hp2" id="smb_hp2" size=1/></td>
							
					</tr>
					<tr>
						<td>성별</td>
						<td>
						
							<input type="radio" name="smb_gender" id="smb_gender" value="남성">남성
							<input type="radio" name="smb_gender" id="smb_gender" value="여성">여성
						
						</td>
							
					</tr>
					<tr>
						<td>키</td>
						<td><input type="text" name="smb_height" id="smb_height"/>cm</td>
							
					</tr>
					<tr>
						<td>체중</td>
						<td><input type="text" name="smb_weight" id="smb_weight"/>kg</td>
							
					</tr>
					<tr>
						<td>목표 체중</td>
						<td><input type="text" name="smb_g_weight" id="smb_g_weight"/>kg</td>
							
					</tr>
					
			
				<div  name="memberbtndiv" id="memberbtndiv">	
				<tr align="center">
					<td colspan="13" align="right">
						<input type="button" id="insertData" value="회원 등록" />
						<input type="button" id="closeWindow" value="닫기"/>
					</td>
				</tr>	
		</div>	
					
				
		
			</table>	
		</div>
		
		
	</form>
</body>
</html>