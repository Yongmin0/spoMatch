<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="kosmo62.spomatch.question.vo.SpoQuestionVO" %>
<%@ page import="kosmo62.spomatch.answer.vo.SpoAnswerVO" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta charset="UTF-8">
  <title>1대1문의</title>
  <!-- CSS -->
  <link href="css/question/questiondetailBoard.css" rel="stylesheet" />
	<script type="text/javascript">
		$(document).ready(function(){
			
			//수정
			$("#updateBoard").click(function(){
				$("#detailboard").attr({
					"method": "POST",
					"action": "/spoMatch/updateBoard.spo"
				}).submit();
			});
			
			//삭제
			$("#deleteBoard").click(function(){
				$("#detailboard").attr({
					"method": "POST",
					"action": "/spoMatch/deleteBoard.spo"
				}).submit();
			});
		});
	</script>
</head>
<body>
<%
	//댓글목록 조회용 글번호 데이터
	String siq_no = "";
%>
<%@include file="../common/header.jsp" %>
    <!-- *************************************Content************************************ -->
<section>
    <div class="container">
        <form id="detailboard" name="detailboard" method="POST">
            <h1>상세 정보</h1>
            <div class="detailboard_btn">
                <input id="updateBoard" name="updateBoard" type="button" onclick="updateBoard" value="수정" />
                <input id="deleteBoard" name="deleteBoard" type="button" onclick="deleteBoard()" value="삭제" />
            </div>
            
    <%
        Object oobj = request.getAttribute("detailBoard");
        System.out.println("detailBoard obj >>> "+oobj);
        if(oobj != null){
            List<SpoQuestionVO> list = (List<SpoQuestionVO>)oobj;
            System.out.println("listBoard list >>>> " +list.get(0));
            if(list != null && list.size() > 0){
                for(int i=0; i<list.size(); i++){
                    SpoQuestionVO sqvo = (SpoQuestionVO)list.get(i);
                    siq_no = sqvo.getSiq_no();
                    
                    System.out.println("listBoard.jsp");
                    System.out.println("sqvo.getSiq_no() >>> "+sqvo.getSiq_no());
                    System.out.println("sqvo.getSiq_subject() >>> "+sqvo.getSiq_subject());
                    System.out.println("sqvo.getSiq_content() >>> "+sqvo.getSiq_content());
                    System.out.println("sqvo.getSiq_deleteyn() >>> "+sqvo.getSiq_deleteyn());
                    System.out.println("sqvo.getSiq_insertdate() >>> "+sqvo.getSiq_insertdate());
                    System.out.println("sqvo.getSiq_updatedate() >>> "+sqvo.getSiq_updatedate());
                    System.out.println("sqvo.getSmb_no() >>> "+sqvo.getSmb_no());
                    System.out.println("sqvo.getSpg_tableno() >>> "+sqvo.getSpg_tableno());
    %>
        <div class="detailboard_content">
            <!--문의글 정보 부분-->
            <div class="detailboard_info">
                <div class="detailboard_num">
                    <p>글번호</p>
                    <div><input type="text" id="siq_no" name="siq_no" value="<%= sqvo.getSiq_no()%>" style="border-style: none; background-color: #F4F6F9; width: 70px;" readonly/></div>
                </div>
                <div class="detailboard_insertdate">
                    <p>작성일</p>
                    <div><%= sqvo.getSiq_insertdate()%></div>
                </div>
                <input type="hidden" id="siq_updatedate" name="siq_updatedate" value="<%= sqvo.getSiq_updatedate()%>" />
            </div>
            <!--문의글 제목-->
            <div class="content detailboard_subject">
                <input type="text" id="siq_subject" name="siq_subject" value="<%= sqvo.getSiq_subject()%>"/>
            </div>
            <!--문의글 내용-->
            <div class="content detailboard_text">
                <input type="text" id="siq_content" name="siq_content" value="<%= sqvo.getSiq_content()%>" />
            </div>
            <!-- 삭제여부 -->
            <input type="hidden" id="siq_deleteyn" name="siq_deleteyn" value="<%= sqvo.getSiq_deleteyn()%>" />
            <!-- 작성자번호 -->
            <input type="hidden" id="smb_no" name="smb_no" value="<%= sqvo.getSmb_no()%>" />
            <!-- 데이블번호 -->
            <input type="hidden" id="spg_tableno" name="spg_tableno" value="<%= sqvo.getSpg_tableno()%>" />
        </div>
    <%
                }
            }else{
    %>
        <p class="detailboard_nondata">데이터 불러오기를 실패했습니다...😥</p>
    <%		
            }
        }
    %>
        </form>    
            <jsp:include page="Answer.jsp">
                <jsp:param name="siq_no" value="<%=siq_no %>"></jsp:param>
            </jsp:include>
        
    </div>
</section>
<!-- *************************************End of Content************************************* -->	
<%@include file="../common/footer.html" %>
</body>
</html>