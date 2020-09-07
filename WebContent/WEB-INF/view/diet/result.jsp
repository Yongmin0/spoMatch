<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kosmo62.spomatch.diet.vo.SpoDietVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body>
	<%
		Object obj = request.getAttribute("date");
		Object obj2 = request.getAttribute("Insert");
		if(obj!= null && obj!= null){
			SpoDietVO sdvo = (SpoDietVO)obj;
			System.out.println(sdvo.getSdi_dietdate());
			int result1 = (int)obj2;
			if(result1 > 0){
	%>
	<script>
		alert("입력에 성공했습니다");
		localStorage.removeItem("returnValue");
		location.href = "selectDiet.spo?sdi_dietdate="+"<%=sdvo.getSdi_dietdate()%>";
	</script>
	<%
			}else{
	%>
			<script>
				localStorage.removeItem("returnValue");
				history.go(-1);
			</script>
	<%		
			}
		}
	%>
</body>
</html>