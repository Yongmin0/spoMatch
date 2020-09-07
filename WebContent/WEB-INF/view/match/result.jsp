<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kosmo62.spomatch.match.vo.SpoMatchVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
	  redirectForm();
  	});
  	
	function redirectForm(){
  		var smc_no = $("#smc_no").val();
  		if(smc_no != null && smc_no.length >0){
  			$("#insertResultForm").attr({
  					"method" : "post",
  					"action" : "viewMatch.spo"
  			}).submit();
  		}else{
  			return false;
  		}
  	}
</script>
</head>

<body>
<%
	Object obj = request.getAttribute("isudResult");
	if(obj!=null){
			SpoMatchVO smvo = (SpoMatchVO)obj;
			String smc_no = smvo.getSmc_no();
%>
			<form id="insertResultForm" name="insertResultForm">
				<input type="hidden" id="smc_no" name="smc_no" value="<%=smc_no%>">
			</form>
<%		

	}
%>
</body>
</html>