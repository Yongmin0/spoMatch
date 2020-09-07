<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <%@ page import="kosmo62.spomatch.notice.vo.SpoNoticeVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<script type="text/javascript">

$(document).ready(function(){
		
		$("#insertBoardFunc").click(function(){
		
		
		$("#insertboard").attr({
			
			"method":"POST",
			
			"action":"/spoMatch/insertClick.spo"
			
		}).submit();
		
		});
		
		$("#cancel").click(function(){
			
			location.href="/spoMatch/listNotice.spo";
		});
});
</script>
<link rel="stylesheet" type="text/css" href="css/notice/kwsNoitceInsertForm.css">
</head>

<body>
<%@include file="../common/header.jsp" %>
<section>
	<div class="container">
		<div id="boardTit"><h3>글쓰기</h3></div>
		<form id="insertboard" name="insertboard" method="post">
	<!-- 상세 정보 보여주기 시작 -->
		<div id="boardDetail">
				<div class="insert insert_subject">
						<input type="text" id="insert_subject input
						" name="snt_subject" placeholder="제목"/>
					</div>
					<div class="insert insert_content">
						<textarea id="snt_content" name="snt_content" placeholder="내용"/></textarea>
					</div>
					<div class="insert insert_file preview-image">
			               <input class="upload-name" value="파일선택" disabled="disabled">
						   <label for="snt_file">업로드</label> 
			               <input type="file" class="upload-hidden" id="snt_file" name="snt_file" size="110px" /> 
		           	 </div>
					<div class="insert insert_subbtn" align="center">
						<input type="button" id="insertBoardFunc" value="[등록]"/>
						<input type="reset" id="cancel" value="[취소]"/>
					</div>
		</div>
		</form>
	</div>
</section>
<%@include file="../common/footer.html" %>
</body>
</html>