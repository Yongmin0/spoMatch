<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>

</head>
<body>
<%@ include file="../common/header.jsp" %>
<!-- Content -->
<section>
	<div class="container">
	<div>
		<form action="findid.spo" method="post">
			<div>
				<h3>이메일로 아이디 찾기</h3>
			</div>
			<div>
				<p>
					<label>EMAIL</label>
					<input type="text" id="smb_email" name="smb_email" required>
				</p>
				<p>
					<input type="submit" id="findbtn" value="아이디찾기">
					<input type="button" id="cancle" value="취소" onclick="history.go(-1);">
				</p>
			</div>
		</form>
	</div>
	</div>
</section>
<%@ include file="../common/footer.html" %>
</body>
</html>