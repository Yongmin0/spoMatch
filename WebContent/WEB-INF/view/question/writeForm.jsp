<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1대1 문의 등록</title>
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="css/question/writeForm.css"/>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#insertData").click(function(){
				$("#questionBoardForm").attr({
					"method": "POST",
					"action": "/spoMatch/insertBoard.spo"
				}).submit();
			});
		});
		
		function validateForm(){
			if($(".subject").val().replace(/\s/g,"") == ""){
				alert("제목을 입력해주세요.");
				return false;
			}
			if($(".content").val().replace(/\s/g,"") == ""){
				alert('내용을 입력해주세요.');
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
<%@include file="../common/header.jsp" %>
	<!-- content -->
	<section>
		<div class="container">
			<form id="questionBoardForm" name="questionBoardForm">
				<h1>문의 등록하기</h1>
				<div class="questionBoard">
					<!-- 제목부분 -->
					<div class="info">
						<div><input type="text" id="siq_subject" name="siq_subject" placeholder="제목을 입력하세요" /></div>
					</div>
					<!-- 내용부분 -->
					<div class="board_content">
						<div><textarea id="siq_content" name="siq_content" placeholder="내용을 입력하세요" /></textarea></div>
					</div>
					<!-- 버튼부분 -->
					<div class="board_btn">
						<input type="button" id="insertData" onclick="insertData()" value="등록" />
						<input type="button" id="closeData" value="닫기" />
					</div>
				</div>
			</form>
		</div>
	</section>
	<!-- end of content -->
<%@include file="../common/footer.html" %>
</body>
</html>