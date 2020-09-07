<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="kosmo62.spomatch.question.vo.SpoQuestionVO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1대1 문의</title>
	<!--css-->
	<link rel="stylesheet" href="css/question/questionList.css" type="text/css">
	<link href="/spoMatch/css/member/spoupdateForm.css" rel="stylesheet" />
	<script type="text/javascript">
		//입력
		function insertBoard(){
			$("#listid").val("");
			$("#listBoardForm").attr("action", "writeForm.spo");
			$("#listBoardForm").submit();
		}
		
		function updateBoard(deptid){
			$("#listid").val(deptid);
			$("#listBoardForm").attr("action", "detailBoard.spo");
			$("#listBoardForm").submit();
		}
		
		//체크박스 전체 선택
		function checkboxAll(){
			if($("#checkAll").is(':checked')){
				$("input[name=checkBno]").prop("checked", true);
			}else{
				$("input[name=checkBno]").prop("checked", false);
			}
		}
		
		//체크박스
		function checkOnly(chk){
			var obj = document.getElementsByName("checkBno");
			console.log('obj >> : ' + obj);
			console.log('obj.length >> : ' + obj.length);
			for(var i=0; i < obj.length; i++){
				if(obj[i] != chk){
					obj[i].checked = false;
				}
			}
		}
	</script>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<!-- Content -->
<section>
	<div class="container">
		<!--side메뉴 + Content 부분-->
		<div class="mypage_content">
			<!--side메뉴 부분-->
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
			<!--End of side메뉴 부분-->
			<form id="listBoardForm" name="listBoardForm" method="POST">
				<input type="hidden" name="listid" id="listid" />
			</form>
			<h4>1대1 문의 게시판</h4>
			<!--문의등록 버튼-->
			<div class="sub_insertbtn">
	            <input type="button" onclick="insertBoard()" value="문의 등록" />
	        </div>
			<!--게시판 제목 부분-->
			<div class="board">
				<div class="board_info">
					<div class="info checkAll" style="width: 6%;"><input type="checkbox" name="checkAll" id="checkAll" onclick="checkboxAll()"></div>
					<div class="info info_num" style="width: 16%;">문의번호</div>
					<div class="info info_author" style="width: 16%;">작성자</div>
					<div class="info info_subject" style="width: 23%;">제목</div>
					<div class="info info_inserdate" style="width: 16%;">작성일</div>
					<div class="info info_updatedate" style="width: 16%;">수정일</div>
					<div class="info info_replyyn" style="width: 16%;">문의 상태</div>
				</div>
		
    <%
			Object obj = request.getAttribute("listBoard");
			System.out.println("list Board  obj >>> "+obj);
			
			if(obj != null){
				List<SpoQuestionVO> list = (List<SpoQuestionVO>)obj;
				
				if(list != null && list.size() > 0){
					for(int i=0; i<list.size(); i++){
						SpoQuestionVO sqvo = (SpoQuestionVO)list.get(i);
						System.out.println("listBoard.jsp");
						System.out.println("sqvo.getSiq_no() >>> "+sqvo.getSiq_no());
						System.out.println("sqvo.getSmb_id() >>> "+sqvo.getSmb_id());
						System.out.println("sqvo.getSiq_subject() >>> "+sqvo.getSiq_subject());
						System.out.println("sqvo.getSiq_content() >>> "+sqvo.getSiq_content());
 						System.out.println("sqvo.getSiq_insertdate() >>> "+sqvo.getSiq_insertdate());
						System.out.println("sqvo.getSiq_updatedate() >>> "+sqvo.getSiq_updatedate());
						System.out.println("sqvo.getSmb_no() >>> "+sqvo.getSmb_no());
						System.out.println("sqvo.getSpg_tableno() >>> "+sqvo.getSpg_tableno());
						System.out.println("sqvo.getAncnt() >>>" + sqvo.getAncnt());
						
						int ancnt = Integer.parseInt(sqvo.getAncnt());
						String answerYN = "";
						
						if(ancnt == 0){
							answerYN = "답변 대기";
						}else if(ancnt >= 1){
							answerYN = "답변 완료";
						}
		%>
    
				<!--**********게시물 부분**********-->
				<div class="board_content" align="center">
					<!--체크박스-->
					<div class="content" style="width: 6.5%;">
						<input type="checkbox" name="checkBno" id="checkBno" value="<%= sqvo.getSiq_no()%>" onclick="checkOnly(this)">
					</div>
					<!--문의번호-->
					<div class="content content_num" style="width: 16%;">
						<a href="/spoMatch/detailBoard.spo?siq_no=<%= sqvo.getSiq_no()%>"><%= sqvo.getSiq_no()%></a>
					</div>
					<!--작성자-->
					<div class="content content_author" style="width: 16%;"><%= sqvo.getSmb_id() %></div>
					<!--문의 제목-->
					<div class="content content_subject" style="width: 23%;">
						<a href="/spoMatch/detailBoard.spo?siq_no=<%= sqvo.getSiq_no()%>"><%= sqvo.getSiq_subject() %></a>
					</div>
					<!--작성일-->
					<div class="content content_insertdate" style="width: 16%;"><%=sqvo.getSiq_insertdate()%></div>
					<!--수정일-->
					<div class="content content_updatedate" style="width: 16%;"><%=sqvo.getSiq_insertdate()%></div>
					<!--문의 상태-->
			         <div class="content content_replyyn" style="width: 16%;"><%= answerYN%></div> 
			    </div>
    <%				
					
					}
            }else{
    %>

                <div class="board_nondate">
                    <span>등록한 문의가 존재하지 않습니다...😥</span>
                </div>
                      
    <%
            }
		}
	%>
               
           </div>	
	</div>
</section>

<!--End of content-->
<%@include file="../common/footer.html" %>
</body>
</html>