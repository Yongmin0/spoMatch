<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kosmo62.spomatch.login.vo.SpoLoginVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#loginbtn").click(function(){
			location.href="index.jsp";
		});
	});
</script>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<!-- Content -->
<section>
	<div class="container">
<%
	Object obj = request.getAttribute("findid");	
	List list = (List)obj;
	int nCnt = list.size();
	if(nCnt > 0){
		for(int i = 0; i < nCnt; i++){
			SpoLoginVO param = (SpoLoginVO)list.get(0);
%>
	<div>
		<h3>아이디 찾기 검색결과</h3>
	</div>
	<div>
		<h5>
			
			<%= param.getSmb_id() %>
		</h5>
			<%
		}
	}else{
%>
		<h5>
			등록된 이메일이 없습니다.
		</h5>
<%
	}
	%>
		<p>
			<input type="button" id="loginbtn" value="로그인">
			<input type="button" id="cancle" onclick="history.go(-1);" value="취소">
		</p>
	</div>

	</div>
</section>
<%@ include file="../common/footer.html" %>
</body>
</html>