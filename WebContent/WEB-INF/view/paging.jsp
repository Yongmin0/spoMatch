<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Collection" %>  
<%@ page import="java.util.List" %>  
<%@page import="kosmo62.spomatch.match.vo.SpoMatchVO"%>
<%
		 
	 
	String url = null;
	String str = null;
	
	url = request.getParameter("url");
	str = request.getParameter("str");

%>
<script type="text/javascript">
$(document).ready(function(){
	$(".linkPage").on("click",function(){
		alert($(this).attr("spg_curPage").val());
		//$("#spg_curPage").val($(this).attr("spg_curPage").val());
	});
});
</script>
<%
	//페이지 네비게이션 관련 변수
	
	//한 페이지에 보여질 게시물 수 
	int spg_pageSize = 0;

	//그룹의 크기
	int spg_groupSize = 0;
	
	// 전체 게시물의 개수
	int spg_totalSize = 0;
	
	//현재 페이지
	int spg_curPage = 0;
	
	// 전체 페이지의 개수
	int pageCount = 0;
	
	if(request.getParameter("spg_pageSize") != null){
		spg_pageSize = Integer.parseInt(request.getParameter("spg_pageSize"));
	}
	if(request.getParameter("spg_groupSize") != null){
		spg_groupSize = Integer.parseInt(request.getParameter("spg_groupSize"));
	}
	if(request.getParameter("spg_curPage") != null){
		spg_curPage = Integer.parseInt(request.getParameter("spg_curPage"));
	}
	if(request.getParameter("spg_totalSize") != null){
		spg_totalSize = Integer.parseInt(request.getParameter("spg_totalSize"));
	}
	
	// 전체게시물수와 페이지크기를 가지고 전체 페이지 개수를 계산함.
	// 소수점에 따라 계산상의 오류가 없도록 한것임.
	pageCount = (int)Math.ceil(spg_totalSize / (spg_pageSize+0.0));
	
	// 현재그룹 설정
	int curGroup = (spg_curPage-1) / spg_groupSize;
	int linkPage = curGroup * spg_groupSize;

%>
<p align="center">
<input type="hidden" id="spg_curPage" name="spg_curPage">
<ul class="paging model">
<%
	// 첫번째 그룹인 아닌경우
	if(curGroup > 0) {
%>
	<li><a href="<%=url%>" spg_curPage="1" class="linkPageBtn"><i class="fa fa-angle-double-left fa-2" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;</a></li>
	<li><a href="<%=url%>" spg_curPage="<%=linkPage%>" class="prev linkPageBtn"><i class="fa fa-angle-left fa-2" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;</a></li>
<%
	}
	else
	{
%>
	<li><a class="noLink"><i class="fa fa-angle-double-left fa-2" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;</a></li>
	<li><a class="noLink"><i class="fa fa-angle-left fa-2" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;</a></li>
<%
	}
	
	// 다음 링크를 위해 증가시킴
	linkPage++;
	System.out.println("totalCount >>> : " + spg_totalSize);
	System.out.println("linkPage >>> : "+linkPage);
	System.out.println("pageCount >>> : "+pageCount);
	int loopCount = spg_groupSize;
	// 그룹범위내에서 페이지 링크만듬.
	while((loopCount > 0) && (linkPage <= pageCount))
	{
		if(linkPage == spg_curPage)
		{
%>
	<li><a href="<%=url%>" spg_curPage="<%=linkPage%>" class="active linkPageBtn"><%=linkPage%>&nbsp;</a></li>
<%
		}
		else
		{
%>
	<li><a href="<%=url%>" spg_curPage="<%=linkPage%>" class="linkPageBtn"><%=linkPage%>&nbsp;</a></li>
<%
		}
		
		linkPage++;
		loopCount--;
	}
	
	// 다음그룹이 있는 경우
	if(linkPage <= pageCount)
	{
%>
	<li class="next"><a href="<%=url%>" spg_curPage="<%=linkPage%>" class="linkPageBtn"><i class="fa fa-angle-right fa-2" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;</a></li>
	<li><a href="<%=url%>" spg_curPage="<%=pageCount%>" class="linkPageBtn"><i class="fa fa-angle-double-right fa-2" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;</a></li>
<%
	}
	else
	{
%>
	<li><a class="noLink"><i class="fa fa-angle-right fa-2" aria-hidden="true" ></i>&nbsp;&nbsp;&nbsp;</a></li>
	<li><a class="noLink"><i class="fa fa-angle-double-right fa-2" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;</a></li>
<%
	}
%>
</ul>
</p>
