<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Insert title here</title>
<link rel="stylesheet" href="css/workout/insertCurWeight.css">
<script type="text/javascript">
	$(document).ready(function(){	
		$("#insertWeight").click(function(){
			$("#curWeightInsertForm").attr({
				"method" : "post",
				"enctype" : "application/x-www-form-urlencoded",
				"action" : "/spoMatch/insertCurWeight.spo"
			}).submit();
		});
	});
</script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<!-- Content -->
<section>
	<div class="container">
		<form id="curWeightInsertForm" name="curWeightInsertForm">
			<div class="weight-content col-lg-8 text-center">
				<h2>오늘 체중 입력</h2>
				<hr class="divider">
				<p class="text-muted mb-5">
					기록된 체중데이터가 없습니다!<br>오늘의 체중을 입력해주세요.
				</p>
				<p class="weight-text"><input type="text" id="scw_curweight" name="scw_curweight" class="form-control"/> KG</p>
				<a class="btn btn-primary btn-xl js-scroll-trigger" id="insertWeight" name="insertWeight" href="#">입력</a>
			</div>
		</form>
	</div>
</section>
<%@include file="../common/footer.html" %>
</body>
</html>