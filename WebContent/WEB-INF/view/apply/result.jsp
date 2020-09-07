<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kosmo62.spomatch.apply.vo.SpoApplyVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
	  redirectForm();
	 
	  console.log("${result}");
		if("${result}".indexOf("문제") > -1){
			history.go(-1);
		}else{
			
		}
  	});
  	
	function redirectForm(){
  		var smc_no = $("#smc_no").val();
  		if(smc_no != null && smc_no.length >0){
  			$("#insertResultForm").attr({
  					"method" : "post",
  					"action" : "viewApply.spo"
  			}).submit();
  		}else{
  			history.go(-1);
  		}
  	}
</script>
</head>

<body>
<%
	Object obj = request.getAttribute("isudResult");
	if(obj!=null){
			SpoApplyVO smvo = (SpoApplyVO)obj;
			String smc_no = smvo.getSmc_no();
			String smb_no = smvo.getSmb_no();
			String sap_no = smvo.getSap_no();
			System.out.println(">>>>>>>>>>>>>>>"+smc_no);
			System.out.println(">>>>>>>>>>>>>>>"+smb_no);
			System.out.println(">>>>>>>>>>>>>>>"+sap_no);
%>
			<form id="insertResultForm" name="insertResultForm">
				<input type="hidden" id="smc_no" name="smc_no" value="<%=smc_no%>">
				<input type="hidden" id="smb_no" name="smb_no" value="<%=smb_no%>">
				<input type="hidden" id="sap_no" name="sap_no" value="<%=sap_no%>">
			</form>
<%		

	}
%>
</body>
</html>