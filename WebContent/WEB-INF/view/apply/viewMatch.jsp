<%@page import="kosmo62.spomatch.match.vo.SpoMatchVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>매칭 상세보기</title>
<link rel="stylesheet" type="text/css" href="css/match/viewMatch.css" />
<script type="text/javascript">
	function applyMatch(no){
		$("#smc_no").val(no);
		$("#selectForm").attr("action","applyMatchForm.spo");
		$("#selectForm").submit();
	}
	function updateMatch(no){
		$("#smc_no").val(no);
		if(confirm('수정을 진행할까요?')){
			$("#selectForm").attr("action","updateMatch.spo");
			$("#selectForm").submit();
		}
	}
	
	function deleteMatch(no){
		$("#smc_no").val(no);
		if(confirm('삭제를 진행할까요?')){
		$("#selectForm").attr("action","deleteMatch.spo");
		$("#selectForm").submit();
		}
	}
	function viewApplyMatch(no){
		$("#smc_no").val(no);
		if($(".countApply").val() == 0){
			alert("신청자가 없습니다.");
		}else{
			$("#selectForm").attr("action","viewApplyMatch.spo");
			$("#selectForm").submit();
		}
	}
	function goListBtn() {
		$("#selectForm").attr("action","listMatch.spo");
		$("#selectForm").submit();
	}

</script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<!-- Content -->
<section>
	<div class="container">
			<% 
				Object obj = request.getAttribute("SpoMatchVO");
				SpoMatchVO svo = (SpoMatchVO)obj;
				if(svo != null){
			%>
			<h1>매칭 상세보기</h1>
				<form name="buttonform" id="buttonform" method="post">
					<div class="detailboard_btn btnBox" align="right">
				<%		
						String session_member = String.valueOf(session.getAttribute("smb_no"));
						if(session_member != "null"){
							// 매칭글 등록자일 경우
							if(svo.getSmb_no().equals(session_member)) {
				%>
						<input type="hidden" class="countApply" value="<%=Integer.parseInt(svo.getSmc_wait())+ Integer.parseInt(svo.getSmc_apply()) %>">
						<input type="button" class="btn btn-primary" value="신청목록보기" onclick="viewApplyMatch('<%=svo.getSmc_no()%>')">
						<input type="button" class="btn btn-primary" value="수정" onclick="updateMatch('<%=svo.getSmc_no()%>')">
						<input type="button" class="btn btn-primary" value="삭제" onclick="deleteMatch('<%=svo.getSmc_no()%>')">
						<input type="button" class="btn btn-secondary" value="목록" id="listMatch" name="listMatch" onclick="goListBtn()" />
					
				<% 
							//회원일 경우
							}else{
				%>
						<input class="btn btn-primary" type="button" value="신청" onclick="applyMatch('<%=svo.getSmc_no()%>')">
						<input class="btn btn-secondary" type="button" value="목록" id="listMatch" name="listMatch" onclick="goListBtn()" />
				<%
							}
						}else{
				%>
						<input class="btn btn-secondary" type="button" value="목록" id="listMatch" name="listMatch" onclick="goListBtn()" />
				<%
					}}
				%>
					</div>
				</form>
				<form name="selectForm" id="selectForm" method="post">
					<input type="hidden" name="smb_no" id="smb_no" value="<%=svo.getSmb_no() %>" />
					<input type="hidden" name="smc_no" id="smc_no" value="<%=svo.getSmc_no() %>" />
					<input type="hidden" name="smc_categoy" id="smc_categoy" value="<%=svo.getSmc_category() %>" />
				</form>
				<form name="detailForm" id="detailForm" method="post">
				<div class="content detailboard_content">
					<div class="detailboard_info">
						<!-- 작성자 -->
						<div class="detailboard_author">
							<p class="author_subject" for="author_count">작성자</p>
							<div class="author_author"><%=svo.getSmb_id() %></div>
						</div>
						<!-- 작성일 -->
						<div class="detailboard_insertDate">
							<p class="content_subject" >작성일</p>
							<div class="content_insertDate"><%=svo.getSmc_insertdate() %></div>
						</div>
					</div>
					<div class="matchArea">
						<!-- 이미지 슬라이드 -->
						<div id="matchSlide" class="carousel slide" data-ride="carousel">
							<div class="matchImageSlide carousel-inner">
								<div class="carousel-item active">
							      <img class="d-block w-100" src="img/match/<%= svo.getSmc_category() %>/1.jpg" alt="First slide">
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" src="img/match/<%= svo.getSmc_category() %>/2.jpg" alt="Second slide">
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" src="img/match/<%= svo.getSmc_category() %>/3.jpg" alt="Third slide">
							    </div>
							</div>
							<!-- 왼쪽 오른쪽 화살표 버튼 --> 
							<a class="carousel-control-prev" href="#matchSlide" role="button" data-slide="prev">
							  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							  <span class="sr-only">Previous</span>
							</a>
							<a class="carousel-control-next" href="#matchSlide" role="button" data-slide="next">
							  <span class="carousel-control-next-icon" aria-hidden="true"></span>
							  <span class="sr-only">Next</span>
							</a>
							 <!-- / 화살표 버튼 끝 --> 
							 
							 <!-- 인디케이터 --> 
							<ul class="carousel-indicators"> 
								<li data-target="#matchSlide" data-slide-to="0" class="active"></li> <!--0번부터시작-->
								<li data-target="#matchSlide" data-slide-to="1"></li> 
								<li data-target="#matchSlide" data-slide-to="2"></li> 
							</ul> 
							<!-- 인디케이터 끝 -->
						</div>
						<div class="matchCategory">
							<p>[<%= svo.getSmc_categoryval() %>]</p>
						</div>
						<div class="matchTime">
							<p><%=svo.getSmc_date() %>  <%=svo.getSmc_sttime() %> ~ <%=svo.getSmc_endtime() %></p>
						</div>
						<div class="matchSubject">
							<h1><%= svo.getSmc_subject() %></h1>
						</div>
						<div class="matchLocal">
							<span><%=svo.getSmc_localval() %></span>
						</div>
						<div class="matchWait">
							<span>대기인원</span>
							<p><%=svo.getSmc_wait() %> 명</p>
						</div>
						<div class="ApplyAndMax">
							<div class="matchApply">
								<span>매칭인원</span>
								<p><%=svo.getSmc_apply() %> 명</p>
							</div>
							<div class="maxApply">
								<span>마감인원</span>
								<p><%=svo.getSmc_maxapl() %> 명</p>
							</div>
						</div>
					</div>
					<div>
						<div class="matchContent">
							<h3>기타사항</h3>
						</div>
						<div><%=svo.getSmc_content() %></div>
					</div>
				</div>
			</form>
		</div>
</section>
<%@include file="../common/footer.html" %>
</body>
</html>