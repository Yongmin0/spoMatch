<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kosmo62.spomatch.notice.vo.SpoNoticeVO"%>
<%@ page import="java.util.List"%>
<%
	Object obj = request.getAttribute("noticeList");
SpoNoticeVO snvo = (SpoNoticeVO) obj;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript">
	$(document).ready(function() {

		$("#updateBoardFunc").click(function() {
			$("#boardDetail2Form").attr("action", "/spoMatch/updateClick.spo");
			$("#boardDetail2Form").submit();

		});

		$("#deleteBoardFunc").click(function() {
				$("#boardDetail2Form").attr("action", "/spoMatch/deleteClick.spo");
			$("#boardDetail2Form").submit();
		});
	});
</script>
<link rel="stylesheet" type="text/css" href="css/notice/kwsNoitceInsertForm.css">
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<section>
		<div class="container">
			<h3>수정페이지</h3>
			<form id="boardDetail2Form" name="boardDetail2Form" method="POST">
			<input type="hidden" id="snt_no" name="snt_no" value="<%= snvo.getSnt_no()%>" /> 
				<div id="boardDetail">
					<div class="insert insert_subject">
						<input type="text" id="insert_subject input" name="snt_subject" placeholder="제목" value="<%=snvo.getSnt_subject()%>" />
					</div>
					<div class="insert insert_content">
						<textarea id="snt_content" name="snt_content" placeholder="내용" value="<%=snvo.getSnt_content()%>"/></textarea>
					</div>
					<div class="insert insert_file preview-image">
						<input class="upload-name" value="파일선택" disabled="disabled">
						<label for="snt_file">업로드</label> 
						<input type="file" class="upload-hidden" id="snt_file" name="snt_file" size="110px" />
					</div>
					<div class="insert insert_subbtn" align="center">
						<input type="button" id="updateBoardFunc" value="[등록]" /> <input type="reset" id="deleteBoardFunc" value="[취소]" />
					</div>
				</div>
			</form>
		</div>
	</section>
	<%@include file="../common/footer.html"%>
</body>
</html>