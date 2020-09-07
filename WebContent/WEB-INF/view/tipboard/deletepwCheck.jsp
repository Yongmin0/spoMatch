<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kosmo62.spomatch.tipboard.vo.SpoTipBoardVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/tipboard/deletepwCheck.css" rel="stylesheet" />
<title>비밀번호 체크</title>
<%
		Object obj = request.getAttribute("detailboard");
		if(obj != null){
			List list = (List)obj;
			int nCnt = list.size();
			if(nCnt > 0){
				for(int i = 0; i < nCnt; i++){
					SpoTipBoardVO param = (SpoTipBoardVO)list.get(0);
					String stb_pw = param.getStb_pw();
					System.out.println(stb_pw);
%>
<script type="text/javascript">
    
	$(document).ready(function(){
		$("#pwCheckbtn").click(function(){	
			//alert($("#stb_pwCheck").val());
			if($("#stb_pwCheck").val() == <%= stb_pw %>){
				//alert("!!!!!!!!!!!");
				 $("#pwCheckForm").attr({
					 
					  "action":"deleteForm.spo"
				  });
				  $("#pwCheckForm").submit();
			}else{
				//alert("????????");
				alert("비밀번호가 일치하지 않습니다.")
				history.go(-1);
			}
		});
	});
</script>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<!-- Content -->
<section>
	<div class="container" align="center" style="margin: 200px auto;">
	<div>
		<form id="pwCheckForm" name="pwCheckForm" method="post">
			<input type="hidden" id="stb_no" name="stb_no" value="<%= param.getStb_no()%>" />
			<input type="hidden" id="smb_no" name="smb_no" value="<%= param.getSmb_no()%>" />
			<input type="hidden" id="session_no" name="session_no" value="<%= param.getSession_no()%>" />
			<input type="hidden" id="stb_pw" name="stb_pw" value="<%= param.getStb_pw()%>" />

			<div class = "input-field col s12">
				<h2>비밀번호 확인</h2>
			</div>
			<div class = "input-field col s12">
				<div class = "pw">
					<input type="text" id="stb_pwCheck" name="stb_pwCheck" required>
				</div>
				<br>
				<div class = "button" align="center">
					<input type="submit" id="pwCheckbtn" value="확인">
					<input type="button" id="cancle" value="취소" onclick="history.go(-1);">
				</div>
			</div>
		</form>
	</div>
	</div>
</section>
<%
				}
			}
		}
%>
<%@ include file="../common/footer.html" %>
</body>
</html>