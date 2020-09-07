<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kosmo62.spomatch.notice.vo.SpoNoticeVO"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<%
	    Object obj= request.getAttribute("noticeList");
	
	 	List<SpoNoticeVO> list1 = (List<SpoNoticeVO>)obj;
	 	HttpSession session1 = request.getSession();
		String value = (String)session1.getAttribute("smb_mf");
	 	System.out.println(">>>>쓋 >>>" + value);
	 	
	 	
 	
 	
		SpoNoticeVO snvo = null;
		
		boolean keywordBool = false;
		boolean searchBool = false;
		
		SpoNoticeVO searchVO = (SpoNoticeVO)request.getAttribute("searchVO");
		
		
		keywordBool = searchVO.getKeyword()!=null&&searchVO.getKeyword()!="";
		searchBool = searchVO.getSearchFilter()!=null&&searchVO.getSearchFilter()!="";

%>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript">
$(function(){

		$("#searchbtn").click(function(){
			console.log('검색버튼 클릭! >>> 전체조회 조건검색 컨트롤러로 이동');
			
			// 전체조회 컨트롤러로 이동
			$("#boardForm").attr({
				"method":"POST",
				"action":"/spoMatch/listNotice.spo"
			}).submit();
		});
		
		/*검색 후 검색 대상과 검색 단어 출력*/
		
			$("#writeForm").click(function(){
		         console.log("insertBoard value >>> " + $("#detailForm").val());
		         $("#boardForm").attr("action","writeClick.spo");
		         $("#boardForm").submit();
		      });
			

		$(".goDetail").click(function(){
			
			var snt_no = $(this).parents().attr("data-num");
			
			$("#snt_no").val(snt_no);
			// 상세 페이지로 이동하기 위해 form 추가
			$("#detailForm").attr({
				"method" : "POST",
				"action" : "/spoMatch/noticeListDetail.spo"
			});
			$("#detailForm").submit();
		});
});

</script>
<link rel="stylesheet" type="text/css" href="css/notice/kwsNoticeListBoard.css">

</head>
<body>
<body>
	<%@include file="../common/header.jsp"%>
	<!-- Content -->
<section>
    <div class="container">
    <form name="detailForm" id="detailForm" method="POST">
					<!--★snt_no값을 다음페이지에 넘겨주기 위해 꼭 써야함★ -->
					<input type="hidden" name="snt_no" id="snt_no">
				</form>
        <h1>공지사항</h1>
        	<form name="boardForm" id="boardForm" method="post">
         <input type="hidden" name="snt_no" id="snt_no">
            <div class="sub">
                <!--카테고리, 제목(+작성자) -->
                <div class="sub_category_subject">
                    <div class="sub_subject" style="">
                        <select name="searchFilter" id="searchFilter" style="border: none; border-right: 0px; border-top: 0px; color: var(--black); width: 60; height: 36; background-color: #EFEFEF;">
                            <option value="제목">제목</option>
                            <option value="작성자">작성자</option>
                            <option value="제목+작성자">제목+작성자</option>
                        </select>
                    </div>
                </div>
                <!--검색 부분-->
                <div class="sub_search">
                    <input type="text" name="keyword" id="keyword" placeholder="검색어 입력" size="50px" style="height : 36;">
                    <input type="button" class="searchbtn" id="searchbtn" value="검색" style="border: none; border-right: 0px; border-top: 0px; color: var(--black); width: 60; height: 36;  background-color: #EFEFEF;"> 
               </div>
            </div>
            <%
            	if("1".equals(value)){
            %>
            <div>
                <input class="sub_insertbtn" type="button" value="글쓰기" id="writeForm" >
            </div>
            <%
            	}
            %>
    </form>
    
<!--**********게시물 부분**********-->
            <form class="selectForm" name="selectForm" id="selectForm" method="post">
                <input type="hidden" name="snt_no" id="snt_no">
            </form>
            <div class="board" style="padding-bottom: 24%;">
                <div class="board_info">
                    <div class="info info_num" style="width: 20%;">글번호</div>
                    <div class="info info_category" style="width: 60%;">글제목</div>
                    <div class="info info_author" style="width: 10%;">작성일</div>
                     <div class="info info_author" style="width: 10%;">조회수</div>
                </div>

<%
		if(obj != null){
			list1 = (List)obj;
			int nCnt = list1.size();
			if(nCnt > 0){
				for(int i = 0; i < nCnt; i++){
					snvo = (SpoNoticeVO)list1.get(i);
%>

                <div class="board_content" data-num="<%=snvo.getSnt_no()%>">
                    <div class="content content_num" style="width: 20%;"><%=snvo.getSnt_no()%></div>
                    <div class="goDetail" style="width: 70%; padding: 10px 0px; "><%=snvo.getSnt_subject()%></div>      
                    <div class="content content_author" style="width: 10%;"><%=snvo.getSnt_insertdate()%></div>
                    <div class="content content_author" style="width: 10%;"><%=snvo.getSnt_viewCount()%></div>
               </div>

    <%
                }
            }
    %>
	<!--페이지 버튼 부분-->
          <div class="paging_Box" style="margin-bottom: 12%;">
             <jsp:include page="../paging.jsp" flush="true">
				<jsp:param name="url" value="listNotice.spo" />
				<jsp:param name="str" value="" />
				<jsp:param name="spg_pageSize" value="<%=snvo.getSpg_pageSize() %>" />
				<jsp:param name="spg_groupSize"
					value="<%=snvo.getSpg_groupSize() %>" />
				<jsp:param name="spg_curPage" value="<%=snvo.getSpg_curPage() %>" />
				<jsp:param name="spg_totalSize"
					value="<%=snvo.getSpg_totalSize() %>" />
			</jsp:include> 
			</div>
                    
        <%
     }
    	 %>
           </div>
           </div>
		</section>
	<%@include file="../common/footer.html"%>
</body>
</html>