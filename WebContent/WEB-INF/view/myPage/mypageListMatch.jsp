<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kosmo62.spomatch.match.vo.SpoMatchVO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> myPage MatchList </title>
<link rel="stylesheet" type="text/css" href="css/mypage/mypageMatch.css" />
<script type="text/javascript">
	$(document).ready(function() {
		$(".mypageMatch").on('click',function() {
			$(location).attr('href',"mypageListMatch.spo");
		});
		
		$(".mypageApply").on('click',function() {
			$(location).attr('href',"mypageListApply.spo");
		});
		
		$(".button-viewApplyMatch").click(function(e){
			e.preventDefault();
			e.stopPropagation();
			var divclick = $(this).parent().parents();
			$("#smc_no").val(divclick.children(".smc_no").text());
			$("#smb_no").val($(".smb_no").text());
			alert($("#smb_no").val($(".smb_no").text()));
			var count = $(this).prev().val();
			console.log(count);
			if(count == 0){
				alert("신청자가 없습니다.");
			}else{
				$("#mypageMatchListForm").attr({
					"action":"viewApplyMatch.spo",
					"method": "POST"
				}).submit();
			}
		});
		
		$('.mypage-container-list-item').click(function(e){
			e.preventDefault();
			e.stopPropagation();
			var divclick = $(this).children(".smc_no");
			$("#smc_no").val(divclick.text());
			$("#mypageMatchListForm").attr({
				"action":"viewMatch.spo",
				"method": "POST"
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
						
				<form id="mypageMatchListForm">
					<input type="hidden" id="smb_no" name="smb_no">
					<input type="hidden" id="smc_no" name="smc_no">
					<input type="hidden" id="smc_category" name="smc_category">
				</form>
					<div class="mypage-header">
						<a class="mypageMatch"><div class=" mypage-header-select">
							<img src="https://img.icons8.com/officel/48/000000/parse-resumes.png"/>
							<h1>등록 조회</h1>
						</div></a>
						<div class="mypage-header-select">
							<img src="https://img.icons8.com/doodle/48/000000/multi-edit--v1.png"/>
							<a class="mypageApply"><h1>신청 조회</h1></a>
						</div>
					</div>
					<div class="mypage-container">
						<div class="mypage-container-header">
							<p><h3>등록 조회<h3></p>
						</div>
						
						<div class="mypage-container-list">
				<% 
					//아이콘 불러울 배열 설정
					String[] imgSrc= {"https://img.icons8.com/officel/48/000000/treadmill.png", "https://img.icons8.com/officel/48/000000/football2--v2.png", 
							"https://img.icons8.com/doodle/48/000000/basketball--v1.png","https://img.icons8.com/dusk/48/000000/baseball.png" };
				
					Object obj = request.getAttribute("matchList");
					if(obj != null){
						List<SpoMatchVO> list = (List<SpoMatchVO>)obj;
						if(list != null && list.size() > 0){
							for(SpoMatchVO svo : list){
				System.out.println("svo.getSmc_no() >>>>>>>>>>>>>>>>>>>>>>" + svo.getSmc_no());			
				%>
								
						<div class="mypage-container-list-item">
							<div class="smb_no" style="display: none;"><%=svo.getSmb_no() %></div>
							<div class="smc_no" style="display: none;"><%=svo.getSmc_no() %></div>
							<div class="list-item-category">
								<img src="<%=imgSrc[Integer.parseInt(svo.getSmc_category())]%>"/>
								<p class="item-category-text"><%=svo.getSmc_categoryval() %></p>
							</div>
							<div class="list-item-content">
								<p class="list-item-content-li content-date"><%=svo.getSmc_date() %> <%=svo.getSmc_sttime() %> ~ <%=svo.getSmc_endtime() %></p> 
								
								<p class="list-item-content-li content-subject"><%=svo.getSmc_subject() %></p>
								<p class="list-item-content-li content-local"><%=svo.getSmc_localval() %></p>
							</div>
							<div class="list-item-applyMember">
									<p> 신청 인원 : <%=svo.getSmc_apply() %> / <%=svo.getSmc_maxapl() %></p>
									<p> 대기 인원 : <%=svo.getSmc_wait() %></p>
							</div>
							<div class="list-item-button">
								<input type="hidden" class="countApply" value="<%=Integer.parseInt(svo.getSmc_wait())+ Integer.parseInt(svo.getSmc_apply()) %>">
								<button type=”button” class="button-viewApplyMatch">신청서 보기</button>
							</div>
						</div>
					
				<% 			} %>
					</div>
				<%
						
					}else{
				%>
						<div class="mypage-container-list">
							<div class="mypage-container-list-item">
								<div> 등록된 데이터가 없습니다.</div>
							</div>
						</div>
				<%
						}
					}
				%>
				<% 
					if(obj != null){
						List<SpoMatchVO> list = (List<SpoMatchVO>)obj;
						if(list != null && list.size() > 0){
							SpoMatchVO svo = list.get(0);
				%>
				
					<div class="mypage-container-boarder">
						<jsp:include page="../paging.jsp" flush="true">
							<jsp:param name="url" value="mypageListMatch.spo" />
							<jsp:param name="str" value="" />
							<jsp:param name="spg_pageSize" value="<%=svo.getSpg_pageSize() %>" />
							<jsp:param name="spg_totalSize" value="<%=svo.getSpg_totalSize() %>" />
							<jsp:param name="spg_groupSize" value="<%=svo.getSpg_groupSize() %>" />
							<jsp:param name="spg_curPage" value="<%=svo.getSpg_curPage() %>" />
						</jsp:include>
					</div>
				<% 			}
						}
				%>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="../common/footer.html" %>
</body>
</html>