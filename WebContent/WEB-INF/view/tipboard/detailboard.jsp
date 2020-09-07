<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kosmo62.spomatch.tipboard.vo.SpoTipBoardVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<link href="css/tipboard/detailboard.css" rel="stylesheet" />
<script type="text/javascript">
<%
		Object obj = request.getAttribute("detailboard");
		if(obj != null){
		List flist = (List)obj;
		int nCnt = flist.size();
		if(nCnt > 0){
			for(int i = 0; i < nCnt; i++){
				SpoTipBoardVO stvo = (SpoTipBoardVO)flist.get(0);
%>
$(document).ready(function(){

	
	//수정버튼 클릭이벤트
	$("#updateForm").click(function(){
		
		 $("#buttonform").attr({
			 
			  "action":"updatepwCheck.spo"
		  });
		  $("#buttonform").submit();
	});
	
	//삭제버튼 클릭이벤트
	$("#deleteForm").click(function(){
		
		 $("#buttonform").attr({
			  
			  "action":"deletepwCheck.spo"
		  });
		  $("#buttonform").submit();
	});// end of deleteForm click
	
	//목록버튼클릭이벤트
	$("#listForm").click(function(){
		
		location.href="listboard.spo";
	});//end of listForm click
	

		
	$("#filedown").click(function(){
		if("null" == "<%=stvo.getStb_file()%>"){
			alert("파일이 존재하지 않습니다.");
			
		}else{
			goDownLoad();
		}
	});
	
	$(function() {
	    var fileValue = $("#file").children().text();
	    if(fileValue === "null"){
	       $("#file").text("");
	    }
	 });
	
	
	$(".good_btn").click(function(){
		alert("좋아요 클릭>>>");
		
		var smb_no = $("#smb_no").val();
		console.log("smb_no >>> " + smb_no);
		var stb_no = $("#stb_no").val();
		console.log("stb_no >>> " + stb_no);
		var my_goodyn = $("#my_goodyn").val();
		
		var urls = "goodYNboard.spo";
		console.log("urls >>> " + urls);
		
		var types = "POST";
		console.log("types >>> " + types);
		
		var datatypes = "JSON";
		console.log("datatypes >>> " + datatypes);
		
		var datas = {
				"smb_no":smb_no,
				"stb_no":stb_no,
				"my_goodyn":my_goodyn
		};
		console.log("datas >>> " + datas);
		
		$.ajax({
			url: urls,
			type: types,
			datatype: datatypes,
			data: datas,
			success: WhenSuccess,
			error: WhenError
		});
		function WhenSuccess (boardLikeyResult){
			console.log("좋아요성공 >>> boardLikeyResult " + boardLikeyResult);
			console.log(boardLikeyResult.result);
			console.log(boardLikeyResult.my);
			console.log(boardLikeyResult.cnt);
			
			$(".good_btn").attr("style","color:black");
			if(boardLikeyResult.my == "N"){
				$(".good_btn").attr("style","color:black");
			}else if(boardLikeyResult.my == 'Y'){
				$(".good_btn").attr("style","color:red");
			}
			$("#my_goodyn").val(boardLikeyResult.my);
			$(".cnt").html(boardLikeyResult.cnt);
		}
		function WhenError(request, status, error){
			alert("좋아요 실패  잠시후 다시 시도해주세여 ");
			alert("code="+request.status + "message=" + request.responseText + "error=" + error);
		}
		
	});
});//end of ready



function goDownLoad(){
	$("#detailForm").attr({
		"method" : "post",
		"action" : "boardFileDownload.spo"
	}).submit();
}
</script>
<%
			}
		}
	}
%>
</head>
<body>
<%@include file="../common/header.jsp" %>
<!-- Content -->
<section>
	<div class="container">

<div align="center">
<br>
<form name="buttonform" id="buttonform" method="post">
		<%
	
	if(obj != null){
	List list = (List)obj;
	int nCnt = list.size();
	if(nCnt > 0){
		for(int i = 0; i < nCnt; i++){
			SpoTipBoardVO param = (SpoTipBoardVO)list.get(i);
			System.out.println("getStb_no >>> " + param.getStb_no());
			System.out.println("getSmb_no >>> " + param.getSmb_no());
			System.out.println("getSession_no >>> " + param.getSession_no());
			System.out.println("getMy_goodyn >>> " + param.getMy_goodyn());
%>

<div align="right">
	<input type="button" value="다운로드" id="filedown" />
	<input type="button" value="수정" id="updateForm" />
	<input type="button" value="삭제" id="deleteForm" />
	<input type="button" value="목록" id="listForm" />
	<input type="hidden" id="stb_no" name="stb_no" value="<%= param.getStb_no()%>" />
	<input type="hidden" id="smb_no" name="smb_no" value="<%= param.getSmb_no()%>" />
	<input type="hidden" id="session_no" name="session_no" value="<%= param.getSession_no()%>" />
	<input type="hidden" id="stb_pw" name="stb_pw" value="<%= param.getStb_pw()%>" />
</div>
</form>
<hr>
	<form name="detailForm" id="detailForm" method="post">

		<input type="hidden" id="stb_file" name="stb_file" value="<%= param.getStb_file()%>" />
		<input type="hidden" id="stb_no" name="stb_no" value="<%= param.getStb_no()%>" />
		<input type="hidden" id="smb_no" name="smb_no" value="<%= param.getSession_no()%>" />
		<input type="hidden" id="my_goodyn" name="my_goodyn" value="<%= param.getMy_goodyn()%>" />
		<table>
			<tr>
				<td><h3>[<%= param.getStb_category()%>]</h3></td>
			</tr>
			<tr>
				<td><h1><%= param.getStb_subject()%></h1></td>
			</tr>
			<tr>
				<td><%= param.getSmb_id()%>&nbsp;&nbsp;&nbsp;&nbsp; <%= param.getStb_insertdate() %>&nbsp;&nbsp;&nbsp;&nbsp; <%= param.getStb_viewcnt() %></td>
			</tr>
		</table>

<br>
<br>
<hr>
		<table>
			<br><br><br>
			<tr>
				<td><%= param.getStb_content() %></td>
			</tr>
			<tr>
				<td id="file"><a href ="javascript:goDownLoad()"><%= param.getStb_file() %></a></td>
			</tr>
		</table>

<br><br><br><br><br>
	<div>
	
<%
	
	
		if(param.getMy_goodyn().equals("Y")){
			
%>
		<span class="good_btn good_y" ><i class="far fa-thumbs-up fa-2x"></span></i> 
		<span class = "cnt"><%= param.getStb_goodcnt() %></span>
<%
		}else{
%>
		<span class="good_btn" id="good_btn"><i class="far fa-thumbs-up fa-2x"></span></i> 
		<span class = "cnt"><%= param.getStb_goodcnt() %></span>	
<%
		}//end if not "Y"
		
%> 

</div>
</form>

	<!-- 댓글 -->
	<jsp:include page="comment/comment.jsp">
		<jsp:param value="<%=param.getStb_no() %>" name="stb_no"/>
	</jsp:include>
	
<%
			}
		}
	}
%>
		</div>
	</section>
<%@include file="../common/footer.html" %>
</body>
</html>