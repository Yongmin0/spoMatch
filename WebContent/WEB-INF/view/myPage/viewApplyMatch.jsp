<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kosmo62.spomatch.apply.vo.SpoApplyVO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/match/viewApplyMatch.css" />
<script type="text/javascript">
	$(document).ready(function(){
		$(".viewApplyBtn").click(function(){
			var $tr = $(this).parent().parent();
			var $td = $tr.find("td");
			$("#smc_no").val($td.eq(0).text());
			$("#sap_no").val($td.eq(1).text());
			$("#match_writer").val($td.eq(3).text());
			$("#smb_no").val($td.eq(4).text());
			$("#viewApplyForm").attr({
				"method":"post",
				"enctype":"application/x-www-form-urlencoded",
				"action":"/spoMatch/viewApply.spo"
			}).submit();
		});
	});
</script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<!-- Content -->
<section>
	<div class="container">
		<div class="mypage_content">
			<div class="mypage_side">
				<div class="mypage_icon">
					<!--개인정보-->
					<div class="icon icon_user">
						<div class="icon_subject">
							<img src="/spoMatch/img/updatemember/mypage_user.png" /><span>&nbsp;개인정보</span>
						</div>
						<!--sub_sidemenu-->
						<ul>
							<li><a href="spoUpdateForm.spo">┗&nbsp;회원 수정/탈퇴</a></li>
						</ul>
					</div>
					<!--매칭현황-->
					<div class="icon icon_matching">
						<div class="icon_subject">
							<img src="/spoMatch/img/updatemember/mypage_football.png" /><span>&nbsp;My 매칭</span>
						</div>
						<!--sub_sidemenu-->
						<ul>
							<li><a href="mypageListMatch.spo" >┗&nbsp;매칭등록 현황</a></li>
							<li><a href="mypageListApply.spo" >┗&nbsp;매칭신청 현황</a></li>
						</ul>
					</div>
					<!--게시글현황-->
					<div class="icon icon_board">
						<div class="icon_subject">
							<img src="/spoMatch/img/updatemember/mypage_board.png" /><span>&nbsp;게시글 현황</span>
						</div>
						<ul>
							<li><a href="mylistboard.spo">┗&nbsp;게시글 등록 현황</a></li>
						</ul>
					</div>
					<!--1대1 문의-->
					<div class="icon icon_question">
						<div class="icon_subject">
							<img src="/spoMatch/img/updatemember/mypage_question.png" /><span>&nbsp;1대1 문의하기</span>
						</div>
						<ul>
							<li><a href="listBoard.spo">┗&nbsp;문의 게시판</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div id="main_content" >
				<%
					Object obj = request.getAttribute("applyList");
					if(obj != null){
						List<SpoApplyVO> list = (List<SpoApplyVO>) obj;
				%>
				<table>
					<tr>
						<td><h2>신청 리스트</h2></td>
					</tr>
				</table>
				<form id="viewApplyForm">
					<input type="hidden" id="match_writer" name="match_writer">
					<input type="hidden" id="smb_no" name="smb_no">
					<input type="hidden" id="smc_no" name="smc_no">
					<input type="hidden" id="sap_no" name="sap_no">
				</form>
				
				<p class="viewApply_total" >총 <%=list.get(0).getSpg_totalSize() %>개의 신청</p>
				<table class="matchList_table">
					<thead>
						<tr>
							<th>신청글 번호</th><!--  -->
							<th>번호</th><!--  -->
							<th>제목</th><!--  -->
							<th>매칭글 작성자</th><!--  -->
							<th>신청글 작성자</th><!--  -->
							<th>아이디</th>
							<th>거주지</th>
							<th>신청일</th>
							<th>수락여부</th>
							<th>상세보기</th>
						</tr>
					</thead>
					<tbody>
					<%	
						if(list != null && list.size() > 0){
							for(SpoApplyVO row : list){
					%>
						<tr>
							<td><%=row.getSmc_no() %></td>
							<td><%=row.getSap_no() %></td>
							<td><%=row.getSap_subject() %></td>
							<td><%=row.getMatch_writer()%></td>
							<td><%=row.getSmb_no() %></td>
							<td><%=row.getSmb_id() %></td>
							<td><%=row.getSap_areaval() %></td>
							<td><%=row.getSap_insertdate() %></td>
							<%   
								String acceptYN =  row.getSap_acceptyn();
								if(acceptYN.equals("Y")){
									acceptYN = "수락 완료";
								}else if(acceptYN.equals("W")){
									acceptYN = "대기 중";
								}else{
									acceptYN = "거절";
								}
							%>
							<td><%=acceptYN %></td>
							<td><input type="button" class="viewApplyBtn" value="상세보기" /></td>
						</tr>
					<% 
							}
						} else { 
					%>
						<tr>
							<td colspan="7">
								등록된 데이터가 존재하지 않습니다.
							</td>
						</tr>
					<% } %>
					</tbody>
				</table>
				<%	
					if(list != null && list.size() > 0){
						SpoApplyVO svo = list.get(0);
				%>
				<div class="paging_Box">
					<jsp:include page="../paging.jsp" flush="true">
						<jsp:param name="url" value="listApply.spo" />
						<jsp:param name="str" value="" />
						<jsp:param name="spg_pageSize" value="<%=svo.getSpg_pageSize() %>" />
						<jsp:param name="spg_totalSize" value="<%=svo.getSpg_totalSize() %>" />
						<jsp:param name="spg_groupSize" value="<%=svo.getSpg_groupSize() %>" />
						<jsp:param name="spg_curPage" value="<%=svo.getSpg_curPage() %>" />
					</jsp:include>
				</div>
				<% 		}
					} 
				%>
			</div>
		</div>
	</div>
</section>
<%@include file="../common/footer.html" %>
</body>
</html>