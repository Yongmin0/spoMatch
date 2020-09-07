<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="kosmo62.spomatch.notice.vo.SpoNoticeVO"%>
<%@ page import="java.util.List"%>
<%
      Object obj= request.getAttribute("noticeList");
      HttpSession session1 = request.getSession();
      String value = (String)session1.getAttribute("smb_mf");
      System.out.println(">>>>쓋 >>>" + value);
      SpoNoticeVO list = (SpoNoticeVO)obj;
       SpoNoticeVO snvo = list;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript">

   /*업데이트 함수*/
   function goUpdate(){
      var snt_no = $("#snt_no").val();
      $("#detailboard").attr("action","/spoMatch/noticeListDetail2.spo");
      $("#detailboard").submit();
   }
   
   /*삭제 함수*/
   function goDelete(){
      
      var snt_no = $("#snt_no").val();
      $("#detailboard").attr("action","/spoMatch/deleteClick.spo");
      $("#detailboard").submit();
   }
   function goList(){
      history.go(-1);
   }
   /*파일 다운로드 함수*/
   $("#download_btn").click(function(){
      goDownLoad();
   });
   function goDownLoad(){
      $("#detailboard").attr({
         "method" : "POST",
         "action" : "/spoMatch/takeFileClick.spo"
      }).submit();
   }
   /*첨부파일이 null값일때 빈문자열 처리 함수*/
   $(function(){
      var fileValue = $("#file").children().text();
      if(fileValue==="null"){
         $("#file").text("");
      }
})   ;
</script>
<link rel="stylesheet" type="text/css" href="css/notice/kwsNoticeDetailBoard2.css">
<style>
section .container #buttonform .detailboard_btn
{
    padding-bottom: 15px;
    border-bottom: 1px solid rgb(179, 179, 179);
}
section .container #buttonform .detailboard_btn input[type=button]
{
    border-style: none;
    padding: 4px 10px;
    margin-left: 5px;
    font-size: 14px;
    font-weight: 500;
    font-family: var(--font-family-noto);
    border-radius: 5px;
}
</style>
</head>
<body>
<body>
   <%@include file="../common/header.jsp"%>
   <!-- Content -->
   <section>
      <div class="container">
         <form name="buttonform" id="buttonform" method="post">
            <div class="detailboard_btn" align="right">
               <input type="button" value="다운로드" id="filedown" onclick="goDownLoad()"/>
               <%
               if("1".equals(value)){ 
               %>
               <input    type="button" value="수정" id="updateForm" onclick="goUpdate()" /> 
               <input type="button" value="삭제" id="deleteForm" onclick="goDelete()"/> 
               <%
               }
               %>
               <input type="button" value="목록" id="listForm" onclick="goList()"/>
            </div>
         </form>
      
      <form name="detailboard" id="detailboard" method="post">
      <input type="hidden" name="snt_no" id="snt_no" value="<%= snvo.getSnt_no()%>"/>
      <input type="hidden" name="snt_file" id="snt_file" value="<%= snvo.getSnt_file()%>"/>
      <div class="detailBoardMain">
      <table >
         <br><br><br>
         <tr>
            <td><h1><%= snvo.getSnt_subject()%></h1></td>
         </tr>
         <tr>
            <td>관리자&nbsp;&nbsp;&nbsp;&nbsp; <%= snvo.getSnt_insertdate() %>&nbsp;&nbsp;&nbsp;&nbsp; <%= snvo.getSnt_viewCount() %></td>
         </tr>
      </table>
      </div>

<br>
<br>
<hr>
      <table>
         <br><br><br>
         <tr>
            <td><%= snvo.getSnt_content() %></td>
         </tr>
         <tr>
            <td id="file"><a href ="javascript:goDownLoad()"><%= snvo.getSnt_file() %></a></td>
         </tr>
      </table>
</form>
      </div>
      </div>
   </section>
   <%@include file="../common/footer.html"%>
</body>
</html>