<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
	*{margin: 0;padding: 0;box-sizing: border-box}
	body{background-color: #f7f7f7;}
	ul>li{list-style: none}
	a{text-decoration: none;}
	.clearfix::after{content: "";display: block;clear: both;}
	
	#joinForm{width: 460px;margin: 0 auto;}
		ul.join_box{border: 1px solid #ddd;background-color: #fff;}
		.checkBox,.checkBox>ul{position: relative;}
		.checkBox>ul>li{float: left;}
		.checkBox>ul>li:first-child{width: 85%;padding: 15px;font-weight: 600;color: #888;}
		.checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;}
		.checkBox textarea{width: 96%;height: 90px; margin: 0 2%;background-color: #f7f7f7;color: #888; border: none;}
		.footBtwrap{margin-top: 15px;}
		.footBtwrap>li{float: left;width: 50%;height: 60px;}
		.footBtwrap>li>button{display: block; width: 100%;height: 100%; font-size: 20px;text-align: center;line-height: 60px;}
		.fpmgBt1{background-color: #fff;color:#888}
		.fpmgBt2{background-color: lightsalmon;color: #fff}


</style>

<script type="text/javascript">

function cAll(){
	console.log("cAll 진입 >>> : ");
	if($("[name=chkAll]").is(':checked')){
		$("[name=chk]").prop("checked",true);
	}else{
		$("[name=chk]").prop("checked",false);
	}
}

function oneCheck(a){
	console.log("oneCheck 진입 >>> : ");
	
	var allChkBox = $("[name=chkAll]");
	var chkBoxName = $(a).attr("chk");
	
	if($(a).prop("checked"))
	{
		//전체 체크박스 수(모두 동의하기 체크박스 제외)
		checkBoxLength = $("[name=" + chkBoxName + "]").length;
		//체크된 체크박스 수
		checkedLength = $("[name=" + chkBoxName + "]:checked").length;
		
		if(checkBoxLength == checkedLength){
			//전체체크박스수 == 체크된 체크박스 수 같다면 모두체크
			allChkBox.prop("checked", true);
		}else{
			allChkBox.prop("checked", false);
		}
	}else{
		allChkBox.prop("checked", false);
	}
	
}

$(function(){
	console.log("function 진입 >>> : ");
	
	
	$("[name=chk]").click(function(){

		oneCheck(this);			
	
	});
});

$(document).ready(function(){
	//동의 버튼 눌렀을 시 
	$("#agreeButton2").click(function(){
		//체크버튼 안했을 시
		if($("[id=check2]").is(":checked") == false){
			alert("이용 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
			return;
		}
		if($("[id=check3]").is(":checked") == false){
			alert("개인정보 수집 및 이용에 대한 안내를 동의 하셔야 다음 단계로 진행 가능합니다.");
			return;
		}
		
		//회원가입 창으로 이동
		if(confirm('동의하시겠습니까?')){
			$("#joinForm").attr("action", "/spoMatch/spoMatchForm.spo");
			$("#joinForm").submit();
		}
	});
	
	
	//비동의 버튼 눌렀을 시 메인단으로
	$("#agreeButton1").click(function(){
		if(confirm('뒤로 가시겠습니까?')){
			$("#joinForm").attr("action", "index.html");
			$("#joinForm").submit();
		}
	});
	
	
});




</script>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<section>
	<div class="container">
		<form action="" id="joinForm">
			<ul class="join_box">
				<li class="checkBox check1">
					<ul class="clearfix">
						<li>이용약관, 개인정보 수집 및 이용,
							위치정보 이용약관(선택), 프로모션 안내
							메일 수신(선택)에 모두 동의합니다.
						</li>
						<li class="checkAllBtn">
							<input type="checkbox" name="chkAll" id="chk" onclick="cAll();" class="chkAll">
						</li>
					</ul>
				</li>
				<li class="checkBox check2">
					<ul class="clearfix">
						<li>이용약관 동의(필수)</li>
						<li class="checkBtn">
							<input type="checkbox" name="chk" id="check2">
						</li>
					</ul>
					<textarea name="" id="">여러분 환영합니다.
스포매치 서비스 및 제품을 이용해 주셔서 감사합니다. 본 약관은 다양한 스포매치 서비스의 이용과 이용과 관련하여 스포매치 서비스를 제공하는 스포매치 주식회사(이하 ‘SpoMatch’)와 이를 이용하는 스포매치 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 스포매치 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
					</textarea>
				</li>
				<li class="checkBox check3">
					<ul class="clearfix">
						<li>개인정보 수집 및 이용에 대한 안내(필수)</li>
						<li class="checkBtn">
							<input type="checkbox" name="chk" id="check3" >
						</li>
					</ul>
					<textarea name="" id="">여러분 환영합니다.
스포매치 서비스 및 제품을 이용해 주셔서 감사합니다. 본 약관은 다양한 스포매치 서비스의 이용과 이용과 관련하여 스포매치 서비스를 제공하는 스포매치 주식회사(이하 ‘SpoMatch’)와 이를 이용하는 스포매치 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 스포매치 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
					</textarea>
				</li>
				<li class="checkBox check4">
					<ul class="clearfix">
						<li>위치정보 이용약관 동의(선택)</li>
						<li class="checkBtn">
							<input type="checkbox" name="chk" id="check4">
						</li>
					</ul>
					
					<textarea name="" id="">여러분 환영합니다.
스포매치 서비스 및 제품을 이용해 주셔서 감사합니다. 본 약관은 다양한 스포매치 서비스의 이용과 이용과 관련하여 스포매치 서비스를 제공하는 스포매치 주식회사(이하 ‘SpoMatch’)와 이를 이용하는 스포매치 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 스포매치 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
					</textarea>
				</li>
				<li class="checkBox check05">
					<ul class="clearfix">
						<li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
						<li class="checkBtn">
							<input type="checkbox" name="chk" id="check5">
						</li>
					</ul>
					
				</li>
			</ul>
			<ul class="footBtwrap clearfix">
				<li><button class="agreeButton1" id="agreeButton1">비동의</button></li>
				<li><button class="agreeButton2" id="agreeButton2">동의</button></li>
			</ul>
		</form>
	</div>
</section>
</body>
</html>