<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kosmo62.spomatch.diet.vo.SpoDietVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
	$(document).ready(function() {
	    $("#sdi_dietdate").datepicker();
	    $("#sdi_dietdate").datepicker("option","dateFormat","yy/mm/dd");
	    
	    $("#dateSearch").click(function(){
	    	$("#_sdi_dietdate").val("$('#sdi_dietdate')");
	    	$("#dateSearchForm").attr({
					"method":"post",
					"enctype":"application/x-www-form-urlencoded",
					"action":"/spoMatch/selectDiet.spo"
			}).submit();	
	    });
	 
	    $("#updateBt").click(function(){
	    	$("#dietUpdate").attr({
	    		"method":"post",
				"enctype":"application/x-www-form-urlencoded",
				"action":"/spoMatch/updateDiet.spo"
	    	}).submit();
	    });
	  });
</script>
</head>
<body>
	<!-- ==================== 날짜 검색 ==================== -->
	<div>
		<form id="dateSearchForm" name="dateSearchForm">	
			<div>
				<p>
					Date: <input type="text" id="sdi_dietdate" name="sdi_dietdate">
					<input type="button" id="dateSearch" name="dateSearch" value="검색"/>	
				</p>
			</div>
		</form>
	</div>
	<hr>
	<%
		Object obj = request.getAttribute("detailList");
		if(obj != null){
		    List<SpoDietVO> list = (List<SpoDietVO>)obj;
		    if(list != null && list.size() >0){
		    	for(int i=0; i<list.size(); i++){
		    	 SpoDietVO sdVO = (SpoDietVO)list.get(i);
		    	 System.out.println("sdVO데이터 >>> "+sdVO.getSdi_no());
		    	 System.out.println("sdVO데이터 >>> "+sdVO.getSdi_breakfast());
		    	 System.out.println("sdVO데이터 >>> "+sdVO.getSdi_lunch());
		    	 System.out.println("sdVO데이터 >>> "+sdVO.getSdi_dinner());
		    	 System.out.println("sdVO데이터 >>> "+sdVO.getSmb_dailycal());
		    	 System.out.println("sdVO데이터 >>> "+sdVO.getSdi_cal());
		    	 System.out.println("sdVO데이터 >>> "+sdVO.getSdi_tan());
		    	 System.out.println("sdVO데이터 >>> "+sdVO.getSdi_dan());
		    	 System.out.println("sdVO데이터 >>> "+sdVO.getSdi_fat());
		    	 System.out.println("sdVO데이터 >>> "+sdVO.getSdi_sugar());
		    	 System.out.println("sdVO데이터 >>> "+sdVO.getSdi_salt());
		    	 System.out.println("sdVO데이터 >>> "+sdVO.getSdi_dietdate());
		    	 System.out.println("sdVO데이터 >>> "+sdVO.getSmb_no());
		    	 System.out.println("sdVO데이터 >>> "+sdVO.getSmb_id());
		    	 
				 String dietdate[] = (sdVO.getSdi_dietdate()).split("/");
				 System.out.println("dietDate[] >>> "+dietdate);
				 System.out.println(" >>>>" + dietdate[0]);
				 System.out.println(" >>>>" + dietdate[1]);
				 System.out.println(" >>>>" + dietdate[2]);
				 String date = dietdate[0] + "년 " + dietdate[1] + "월 " + dietdate[2] + "일 " + sdVO.getSmb_id() + "님의 식단";
	%>
	<form id="dietUpdate" name="dietUpdate">
		<h2><%=date %></h2>
		<!-- ==================== 식단 입력 ==================== -->	
		<div id="diet">
			<p>아침</p>
			<input type="text" id="sdi_breakfast" name="sdi_breakfast" value="<%=sdVO.getSdi_breakfast() %>"/>
			<p>점심</p>
			<input type="text" id="sdi_lunch" name="sdi_lunch" value="<%=sdVO.getSdi_lunch() %>"/>
			<p>저녁</p>
			<input type="text" id="sdi_dinner" name="sdi_dinner" value="<%=sdVO.getSdi_dinner() %>"/>
		</div>
 		<!-- ==================== 영양소 출력 ==================== -->
		<div id="nutrient">
			<p>일일 권장 칼로리</p>
			<input type="text" id="smb_dailycal" name="smb_dailycal" value="<%=sdVO.getSmb_dailycal()%>"/>
			<p>현재 식단 칼로리</p>
			<input type="text" id="sdi_cal" name="sdi_cal" value="<%=sdVO.getSdi_cal() %>"/>
			<p>탄수화물</p>
			<input type="text" id="sdi_tan" name="sdi_tan" value="<%=sdVO.getSdi_tan()%>"/>
			<p>단백질</p>
			<input type="text" id="sdi_dan" name="sdi_dan" value="<%=sdVO.getSdi_dan()%>"/>
			<p>지방</p>
			<input type="text" id="sdi_fat" name="sdi_fat" value="<%=sdVO.getSdi_fat()%>"/>
			<p>당</p>
			<input type="text" id="sdi_sugar" name="sdi_sugar" value="<%=sdVO.getSdi_sugar()%>"/>
			<p>나트륨</p>
			<input type="text" id="sdi_salt" name="sdi_salt" value="<%=sdVO.getSdi_salt()%>"/>
			<p>콜레스테롤</p>
			<input type="text" id="sdi_col" name="sdi_col" value="<%=sdVO.getSdi_col() %>" readOnly/>
			<p>포화지방산</p>
			<input type="text" id="sdi_fatacid" name="sdi_fatacid" value="<%=sdVO.getSdi_fatacid() %>" readOnly/>
			<p>트랜스지방</p>
			<input type="text" id="sdi_trans" name="sdi_trans" value="<%=sdVO.getSdi_trans() %>" readOnly/>
		
			<input type="hidden" id="sdi_no" name="sdi_no" value="<%=sdVO.getSdi_no() %>"/>
			<input type="hidden" id="_sdi_dietdate" name="_sdi_dietdate" value="<%=sdVO.getSdi_dietdate()%>"/>	
		</div>
		<div>
			<input type="button" id="updateBt" name="updateBt" value="수정">
		</div>
	<%
		    	}		    	
		    }
		}
	%>
	</form>
</body>
</html>