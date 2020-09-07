<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/tipboard/insertboard.css" rel="stylesheet" />
<title>게시판 등록</title>
<%
	String message = (String)request.getAttribute("message");
	System.out.println("message >>> " + message);
	if(message != null){
		%>
		<script type="text/javascript">
			alert('<%= message %>');
		</script>
		<%
	}
%>
<script type="text/javascript">


$(document).ready(function(){
	
	//등록버튼클릭이벤트
	$("#insertBoardFunc").click(function(){
		
		   //패스워드 유효성 검사 및 체크

	       if(document.insertboard.stb_pw.value.length == 0){
	          alert("비밀번호를 입력하세요!!");
	          document.getElementById("stb_pw").focus();
	          return false;
	       }else{
	          var length = document.insertboard.stb_pw.value.length;
	          if(length != 4 ){
	             alert("비밀번호 4자리(숫자만)를 입력해주세요");
	             document.getElementById("stb_pw").focus();
	             return false;
	         	 }else{
	         		$("#insertboard").attr({
	        			"method":"POST",
	        			"enctype":"multipart/form-data",
	        			"action":"insertboard.spo"
	        		}).submit();
	         	 }
	          }
	});//end of insertBoardFunc click
	
	//목록버튼클릭이벤트
	$("#listBoardFunc").click(function(){
		
		location.href="listboard.spo";
	});	//end of listBoardFunc click
	
	
	$("#shareYN").change(function(){
		if($("#shareYN").is(":checked")){
			$("#stb_shareyn").val('Y');
		}else{
			$("#stb_shareyn").val('N');
		}
	}).submit();//end of stb_shareyn
	
	
});//end of ready

function selectCategory(){
	console.log("selectCategory >>>");
	var sc = document.getElementById("stb_category");
	var scSelected = sc.options[sc.selectedIndex].value;
	console.log("scSelected >>> " + scSelected);

		for(var i = 0; i < sc.length; i++){
			if(sc[i].value == scSelected){
				sc[i].selected = true;	
		}
	}
}
</script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<!-- Content -->
<section>
	<div class="container">
		<P></P>
		<%
			String smb_no = (String)request.getAttribute("smb_no");
			System.out.println("insert smb_no >>> " + smb_no);
		%>
		<div align="center">
			<form id="insertboard" name="insertboard" method="post">
			<input type="hidden" id="smb_no" name="smb_no" value="<%= smb_no %>">
				<table border="1">
					<thread>
						<tr>
							<td colspan="3" align="center">
								<h4>게시판 등록</h4>
							</td>
						</tr>
					</thread>
					<tbody>
						<tr>
							<th>카테고리</th>
							<td>
								<select name="stb_category" id="stb_category" value="" onchange="selectCategory()">
									<option value="">선택</option>
									<option value="루틴">루틴</option>
									<option value="축구">축구</option>
								    <option value="야구">야구</option>
								    <option value="농구">농구</option>
								    <option value="기타">기타</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<th>제목</th>
							<td>
								<input type="text" id="stb_subject" name="stb_subject" size="110px" />
							</td>
						</tr>
						
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" id="stb_pw" name="stb_pw" size="110px" />
							</td>
						</tr>
						
						<tr>
							<th></th>
							<td>
								<input type="hidden" id="stb_shareyn" name="stb_shareyn" />
								<input type="checkbox" id="shareYN" name="shareYN" size="110px" />공유하기
							</td>
						</tr>
						
						<tr>
							<th>내용</th>
							<td>
								<textarea id="stb_content" name="stb_content" cols="115" rows="20"></textarea>
							</td>
						</tr>
						
						<tr>
							<th>파일</th>
							<td>
								<input type="file" id="stb_file" name="stb_file" size="110px" />
							</td>
						</tr>
					</tbody>
				</table>
				<br>
				<div align="center">
					<input type="button" value="확인" id="insertBoardFunc">
					<input type="button" value="목록" id="listBoardFunc">
					<input type="reset" value="다시">
				</div>
		</form>
		</div>

		</div>
	</section>
<%@include file="../common/footer.html" %>
</body>
</html>