<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String message = (String)request.getAttribute("message");
	System.out.println("message >>> " + message);
	if(message != null){
		%>
		<script type="text/javascript">
			alert('<%= message %>');
			location.href="index.jsp";
		</script>
		<%
	}
%>
</head>
<body>
</body>
</html>