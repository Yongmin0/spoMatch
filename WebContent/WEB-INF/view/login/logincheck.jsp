<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인체크</title>

	<%
	String message = (String)request.getAttribute("message");
	System.out.println("message >>> " + message);
	if(message != null){
		%>
		<script type="text/javascript">
			alert('<%= message %>');
			history.go(-1);
		</script>
		<%
	}
%>
</head>
<body>

</body>
</html>