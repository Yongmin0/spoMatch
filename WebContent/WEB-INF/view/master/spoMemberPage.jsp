<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="kosmo62.spomatch.master.vo.SpoMasterVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%
	    Object obj= request.getAttribute("memberList");
	 	Object obj1 = request.getAttribute("count");
		Object obj2 = request.getAttribute("count2");
		Object obj3 = request.getAttribute("newCount");
		Object obj4 = request.getAttribute("newMember");
		
		List<SpoMasterVO> list = (List<SpoMasterVO>)obj;
	 	List<SpoMasterVO> list1 = (List<SpoMasterVO>) obj1;
	 	List<SpoMasterVO> list2 = (List<SpoMasterVO>) obj2;
	 	List<SpoMasterVO> list3 = (List<SpoMasterVO>) obj3;
	 	List<SpoMasterVO> list4 = (List<SpoMasterVO>) obj4;
	 	
	 	SpoMasterVO smvo = null;
	 	boolean keywordBool = false;
		boolean searchBool = false;
			
		SpoMasterVO searchVO = (SpoMasterVO)request.getAttribute("searchVO");
		keywordBool = searchVO.getKeyword()!=null&&searchVO.getKeyword()!="";
		searchBool = searchVO.getSearchFilter()!=null&&searchVO.getSearchFilter()!="";
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/master/kwsMasterMemberP.css">
<style type="text/css">
	table {
		width: 500px;
	}
	
	fieldset {
		width: 470px;
	}
	
	td {
		padding: 10px;
		border: 1px solid #666666;
	}
</style>

<script type="text/javascript">

function acyncMovePage3(url) {

	
	var startVar = "";
	var endVar = "";

	startVar = document.getElementById("startDate").value;
	startVar = startVar.replace(/-/gi, "");
	endVar = document.getElementById("endDate").value;
	endVar = endVar.replace(/-/gi, "");

	//입력한 값이 오늘날짜보다 클때 경우 처리 메소드 데스 
	var dt = new Date();
	var yyyy = dt.getFullYear();
	var mm = "" + (dt.getMonth() + 1);
	var dd = "" + dt.getDate();

	if (mm.length < 2) {
		mm = "0" + mm;
	}
	if (dd.length < 2) {
		dd = "0" + dd;
	}
	var today = yyyy.toString() + mm + dd;
	today = parseInt(today);

	var updateDate = startVar;
	updateDate = parseInt(updateDate);
	var updateDate2 = endVar;
	updateDate2 = parseInt(updateDate2);
	
	if (today < updateDate || today < updateDate2) {
		alert("날짜를 수정해주세요");
	} else {
		var jaxData = {
			startDate : startVar,
			endDate : endVar
		};
		var ajaxOption = {

			url : url,
			async : true,
			type : "post",
			dataType : "json",
			data : jaxData,
			cache : false, //ajax로 통신중 캐시가 남아서 갱신된 데이터를 받아오지 못하는경우
			success : ws,
			error : we

		};
		function ws(data) {
		
			console.log(data);
			viewChart(data);

		}
		function we(request, status, error) {
			console.log("실패함");
			alert("error" + error);
		}

		$.ajax(ajaxOption).done(function(data) {
			// boardSearch 영역 교체
			$('#line-chart').html(data);
		});
	}
}
function acyncMovePage4(url) {

	var startVar = "";
	var endVar = "";

	startVar = document.getElementById("startDate2").value;
	startVar = startVar.replace(/-/gi, "");
	endVar = document.getElementById("endDate2").value;
	endVar = endVar.replace(/-/gi, "");

	var dt = new Date();
	var yyyy = dt.getFullYear();
	var mm = "" + (dt.getMonth() + 1);
	var dd = "" + dt.getDate();

	if (mm.length < 2) {
		mm = "0" + mm;
	}
	if (dd.length < 2) {
		dd = "0" + dd;
	}
	var today = yyyy.toString() + mm + dd;
	today = parseInt(today);

	var updateDate = startVar;
	updateDate = parseInt(updateDate);
	var updateDate2 = endVar;
	updateDate2 = parseInt(updateDate2);

	if (today < updateDate || today < updateDate2) {
		alert("날짜를 수정해주세요");
	} else {

		var jaxData = {
			startDate : startVar,
			endDate : endVar
		};
		var ajaxOption = {

			url : url,
			async : true,
			type : "post",
			dataType : "json",
			data : jaxData,
			cache : false, //ajax로 통신중 캐시가 남아서 갱신된 데이터를 받아오지 못하는경우
			success : ws,
			error : we

		};
		function ws(data) {
			console.log('성공 >>> ');
			console.log(data);
			$(data).find("movie").each(function(){

				var info = "title : " + $(this).find("title").text() +"<br/>";

				$('#wrap').append(info);

				});
				viewChart2(data);
		}
		function we(request, status, error) {
			console.log("실패함");
		
		}

		$.ajax(ajaxOption).done(function(data) {
			// boardSearch 영역 교체
			$('#line-chart').html(data);
		});

	}
}
var ctx = $("#line-chart");

/* 선택한 날짜 기준으로 매칭건수 가져오기*/

function viewChart(data) {

	var xArr = new Array();
	for (var i = 0; i < data.length; i++) {
		xArr.push(data[i].date);
		console.log(xArr);
	}

	var yArr = new Array();
	for (var i = 0; i < data.length; i++) {
		yArr.push(data[i].count);
		console.log(yArr);
	}

	var ctx = document.getElementById('myChart').getContext('2d');
	var chart = new Chart(ctx, {
		// The type of chart we want to create
		type : 'bar',

		// The data for our dataset
		data : {
			labels : xArr,
			datasets : [ {
				label : '',
				backgroundColor : 'rgb(255, 99, 132)',
				borderColor : 'rgb(255, 99, 132)',
				data : yArr
			} ]
		},

		// Configuration options go here
		options : {
			
		}
	});
}

/* 선택한 날짜 기준으로 회원가입건 가져오기*/

function viewChart2(data) {
	
	var xArr = new Array();
	
	for (var i = 0; i < data.length; i++) {
		
		xArr.push(data[i].date);
	
		console.log(xArr);
	}

	var yArr = new Array();
	for (var i = 0; i < data.length; i++) {
		
		yArr.push(data[i].count);
		console.log(yArr);
		
	}
	
	
	var ctx = document.getElementById('myChart2').getContext('2d');
	var chart = new Chart(ctx, {
		// The type of chart we want to create
		type : 'bar',

		// The data for our dataset
		data : {
			labels : xArr,
			datasets : [ {
				label : '',
				backgroundColor : 'rgb(255, 99, 132)',
				borderColor : 'rgb(255, 99, 132)',
				data : yArr
			} ]
		},

		// Configuration options go here
		options : {
			
		}
	});
}
function makingDatepicker(data){
	$.datepicker.regional['kr'] = {
			closeText : '닫기', // 닫기 버튼 텍스트 변경
			currentText : '오늘', // 오늘 텍스트 변경
			monthNames : [ '1 월', '2 월', '3 월', '4 월', '5 월', '6 월', '7 월',
					'8 월', '9 월', '10 월', '11 월', '12 월' ], // 개월 텍스트 설정
			monthNamesShort : [ '1 월', '2 월', '3 월', '4 월', '5 월', '6 월',
					'7 월', '8 월', '9 월', '10 월', '11 월', '12 월' ], // 개월 텍스트 설정
			dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일' ], // 요일 텍스트 설정
			dayNamesShort : [ '월', '화', '수', '목', '금', '토', '일' ], // 요일 텍스트 축약 설정&nbsp;   dayNamesMin: ['월','화','수','목','금','토','일'], // 요일 최소 축약 텍스트 설정
			dateFormat : 'dd/mm/yy' // 날짜 포맷 설정
		};

		// Seeting up default language, Korean
		$.datepicker.setDefaults($.datepicker.regional['kr']);

		// Start Datepicker UI
		$("#datepicker").datepicker();

		//daterPicker 날짜 형식 변경
		$(".inputDate").datepicker({
			dateFormat : "yy-mm-dd"
		});
};
$(function(){
	var url1 = '/spoMatch/goMCountPage5.spo';
	var url2 ='/spoMatch/goMCountPage3.spo';
	acyncMovePage3(url1);
	acyncMovePage4(url2);
	
	$.datepicker.regional['kr'] = {
		closeText : '닫기', // 닫기 버튼 텍스트 변경
		currentText : '오늘', // 오늘 텍스트 변경
		monthNames : [ '1 월', '2 월', '3 월', '4 월', '5 월', '6 월', '7 월',
				'8 월', '9 월', '10 월', '11 월', '12 월' ], // 개월 텍스트 설정
		monthNamesShort : [ '1 월', '2 월', '3 월', '4 월', '5 월', '6 월',
				'7 월', '8 월', '9 월', '10 월', '11 월', '12 월' ], // 개월 텍스트 설정
		dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일' ], // 요일 텍스트 설정
		dayNamesShort : [ '월', '화', '수', '목', '금', '토', '일' ], // 요일 텍스트 축약 설정&nbsp;   dayNamesMin: ['월','화','수','목','금','토','일'], // 요일 최소 축약 텍스트 설정
		dateFormat : 'dd/mm/yy' // 날짜 포맷 설정
	};

	// Seeting up default language, Korean
	$.datepicker.setDefaults($.datepicker.regional['kr']);

	// Start Datepicker UI
	$("#datepicker").datepicker();

	//daterPicker 날짜 형식 변경
	$(".inputDate").datepicker({
		dateFormat : "yy-mm-dd"
	});
});
// 하루 회원가입건 과 하루 매칭등록건 null 처리 함수l
$(function() {

	var ifNull1 = $("#checkNull1").text();
	var ifNull2 = $("#checkNull2").text();

	if (ifNull1 === "null") {
		$("#checkNull1").text('0');
	} else if (ifNull2 === "null") {
		$("#checkNull2").text('0');
	}
});
    function acyncMovePage5(url){
      
   		
        var keyVar = document.getElementById("keyword").value;
        var searchVar = document.getElementById("searchFilter").value;
        
        var jaxData = {
        		keyword : keyVar, 
        		searchFilter : searchVar
        		};
        alert(keyVar);
        alert(searchVar);
        
        $.ajax({	
                url : url,
                async : true,
                type : "POST",
                dataType : "html",
                data: jaxData,
                cache : false, //ajax로 통신중 캐시가 남아서 갱신된 데이터를 받아오지 못하는경우
              	success : function(data){
              		var e = $(data).find('#memberSection');
              	    $("#memberSection").html(e);
              },
              	error : we  
     });
      	function we(xhr, ajaxOptions, thrownError){
       	 alert(xhr.status);
         alert(thrownError);
       	}
 };
 </script>
 <style>
 .sub .sub_subject{
 	float : right;
 }
 .sub .sub_category_subject h1{
 	float : left;
 }
#searchFilter{
 font-size: 14px;
    font-weight: 600;
    background-color : #EFEFEF;
    color: var(--black);
    border-style: none;
    margin: 0px 10px;
    width: 70px;
    height: 36px;
    padding : 1px 6px;
    vertical-align: middle;
     border-radius:  3px;
}
#keyword{
	margin-top: 50px;
    height: 36;
    background-color: white;
   
}
.inputDate{
border: none;
    width: 167;
    border-right: 0px;
    border-top: 0px;
    height: 36;
}
.searchBoxs{
font-size: 14px;
    font-weight: 600;
    background-color: #EFEFEF;
    color: var(--black);
    border-style: none;
    margin: 0px 10px;
    width: 70px;
    height: 36px;
    vertical-align: middle;
    border-radius: 3px;
}
.masterPrivateZone{
 height : 305px;
 display:flex;
 border:2px solid;
 background-color: currentColor;
}
.masterImgSection{

}
.masterCircleImg{
 width: 200;
 height: 200;
 border-radius: 50%;
 background-color: aliceblue;
 display: block; 
 margin: 5% auto;
}
.masterImg2{
 width: 150;
    height: 150;
    margin: 10% 12% 10% 12%;
    border-radius: 30px;
    background-color: aliceblue;
}
.masterDetailSection{
 color: #EFEFEF;
 }
#masterDetailContent{
margin: 7% 2% 2% 3%;
font-size: 120%;
}
.todayCount{
width: 30;
 height: 30;
 background-color: red;
 border-radius: 50%;
}
dt{
display:flex;
}
 </style>
</head>
<body>
	<section style="padding-top: 7%;">
		<div class="container">
		<div class="masterZone">
			<div class="masterPrivateZone">
				<div  class="masterImgSection" style="width: 40%;">
					<div class="masterCircleImg">
					<img class="masterImg2" src="img/master/master(2).png">
					<p style="color: aliceblue;margin: 15% 10% 6% 20%;font-size: 130%;">SPOMATCH</p>
					</div>
				</div>
				<div  class="masterDetailSection" style="width: 60%;">
					<div id="masterDetailContent">
						
						&nbsp;	
							</br><dt>반갑습니다 관리자님</dt>
							&nbsp;	&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;
							<%
								if (list3 != null && list3.size() > 0) {
								for (int i = 0; i < list3.size(); i++) {
									smvo = list3.get(i);		
							%>							
							<div class="showCountToday">
								<dt>
									<div>오늘 하루 매칭 건수입니다.&nbsp&nbsp&nbsp&nbsp</div>
									<%
									if(smvo.getSmc_count().length()==1){										
									%>
										<div class="todayCount">
											<p style="margin: 3% 0% 3% 26%;">
											<%=smvo.getSmc_count()%></p>
										</div>
									<%
									}else{
									%>
									<div class="todayCount">
											<p style="margin: 3% 0% 3% 11%;">
											<%=smvo.getSmc_count()%></p>
									</div>
									<%
									}
										%>
									</dt>
							</div>
							&nbsp;	&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;
							<%
								}
							}
							%>
							<%
								if (list4 != null && list4.size() > 0) {
								for (int i = 0; i < list4.size(); i++) {
									smvo = list4.get(i);
							%>
							
							<div class="showCountToday">
							<dt>오늘 하루 회원가입 건수입니다.&nbsp&nbsp&nbsp&nbsp<div class="todayCount">
							<%
									if(smvo.getSmb_count().length()==1){										
							%>
							<p style="margin: 3% 0% 3% 30%;"><%=smvo.getSmb_count()%></div></dt>
							</div>
							<%
									}else{
							%>
							<p style="margin: 3% 0% 3% 11%;"><%=smvo.getSmb_count()%></div></dt>
							<%
								}
							}
								}
							%>
							
					</div>
				</div>
				</div>
			</div>
		<div class="allSection">
		
		<!-- 조건 검색 및 목록 뽑는 영역 -->
			
	<div class="countSession">
	<div id="memberSection">
		<form name="searchForm" id="detailForm">
				<input type="hidden" id="smb_no" name="smb_no">
				<div class="sub">
					<div class="sub_category_subject">
						<h1>회원검색</h1>
					</div>
					<div class="sub_subject">
							<select name="searchFilter" id="searchFilter">
								<option value="이름">이름</option>
								<option value="아이디">아이디</option>
							</select> 
							<input type="text" id="keyword"  name="keyword" placeholder="검색어 입력" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;">&nbsp;&nbsp; 
							<input type="button" class ="searchBoxs" onclick="acyncMovePage5('/spoMatch/goMemberPage3.spo')" id="search_btn" name="search_btn" value="검색">
					</div>
				</div>
			</form>
		<form class="selectForm" name="selectForm" id="selectForm" method="post">
				<input type="hidden" name="snt_no" id="snt_no">
			</form>
			<div class="board">
				<div class="board_info">
					<div class="info info_num" style="width: 20%;">회원번호</div>
					<div class="info info_category" style="width: 10%;">회원이름</div>
					<div class="info info_subject" style="width: 15%;">아이디</div>
					
					<div class="info info_author" style="width: 5%;">우편번호</div>
					<div class="info info_author" style="width: 35%;">주소</div>
					<div class="info info_author" style="width: 10%;">핸드폰 번호</div>
					<div class="info info_author" style="width: 5%;">성별</div>
				</div>
		<%
			if(list!=null && list.size()>0){
													
													for(int i=0;i<list.size();i++){
														smvo = list.get(i);
		%>
				<div class="board_content">
					<div class="content content_num" style="width: 20%;"><%=smvo.getSmb_no()%></div>
					<div class="content info_category"  style="width: 10%;"><%=smvo.getSmb_name()%></div>
					<div class="content info_author" style="width: 15%;"><%=smvo.getSmb_id()%></div>
					
					<div class="content info_author" style="width: 5%;"><%=smvo.getSmb_addrno()%></div>
					<div class="content info_author" style="width: 35%;"><%=smvo.getSmb_addr()%></div>
					<div class="content info_author" style="width: 10%;"><%=smvo.getSmb_hp()%></div>
					<div class="content info_author"  style="width: 5%;"><%=smvo.getSmb_gender()%></div>
				</div>
		<%
										}
								
										}
		%>
		<div class="paging_Box" style="margin-bottom: 12%;">
				<jsp:include page="../paging.jsp" flush="true">
					<jsp:param name="url" value="goMemberPage2.spo" />
					<jsp:param name="str" value="" />
					<jsp:param name="spg_pageSize" value="${memberList.get(0).spg_pageSize}" />
					<jsp:param name="spg_groupSize" value="${memberList.get(0).spg_groupSize}" />
					<jsp:param name="spg_curPage" value="${memberList.get(0).spg_curPage}" />
					<jsp:param name="spg_totalSize" value="${memberList.get(0).spg_totalSize}" />
				</jsp:include>
		</div>
			</div>
	</div>
		<form id="searchForm" name="searchForm">
			<input type="hidden" id="smc_insertdate" name="smc_insertdate">
			<div id="chart1">
			<div class="sub_category_subject" style="display: flex; justify-content: space-between; margin-top: 100px;">
						<h1>매칭건수 현황</h1>
				<div class="wrap_date" id="writeDate" style="float : right;">
					<input type="text" class="inputDate" name="startDate" id="startDate" size="12" placeholder="시작일" /> - 
					<input type="text" class="inputDate" name="endDate" id="endDate" 	size="12" placeholder="종료일"/>
					<input type="button" id="searchBox" value="검색" class ="searchBoxs" onclick="acyncMovePage3('/spoMatch/goMCountPage3.spo')">
				</div>
			</div>
				
				<div class="chart-container" id="chart-area">
					<canvas id="myChart"></canvas>
				</div>
			</div>
			<div id="chart2">
			<div class="sub_category_subject" style="display: flex; justify-content: space-between; margin-top: 100px;">
				<div>
						<h1>회원가입 현황</h1>
				</div>
				<div class="wrap_date" id="writeDate2">
					<input type="text" class="inputDate" name="startDate2" id="startDate2" size="12" placeholder="시작일" /> - 
					<input 	type="text" class="inputDate" name="endDate2" id="endDate2" size="12" placeholder="종료일" /> 
					<input type="button" id="searchBox2" class ="searchBoxs" value="검색" onclick="acyncMovePage4('/spoMatch/goMCountPage5.spo')">
				</div>
				</div>
				<div class="chart-container" id="chart-area2">
					<canvas id="myChart2"></canvas>
				</div>
			</div>
			<br /> <br /> <br /> <br />
		</form>
		</div>
	</section>
</body>
</html>