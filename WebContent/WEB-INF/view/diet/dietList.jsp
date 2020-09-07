<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="kosmo62.spomatch.diet.vo.SpoDietVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>식단관리</title>
<!-- Bootstrap core CSS -->
<!--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->
<!-- Custom styles for this template -->
<!--<link href="css/scrolling-nav.css" rel="stylesheet">-->
<!-- Style -->
<link rel="stylesheet" type="text/css" href="css/diet/dietList.css"/>

<%
		//식단데이터 있을 때 리스트
		Object obj = request.getAttribute("list");
		//식단데이터가 없을 때 날짜데이터
		Object objDate = request.getAttribute("date");
		System.out.println(obj);
		if(obj != null || objDate != null){
			List<SpoDietVO> list = (List<SpoDietVO>)obj;
			System.out.println(list);
			//식단데이터가 있는지 없는지 구분
			if(list != null && list.size() > 0){
				
					SpoDietVO sdVO = (SpoDietVO)list.get(0);
					String dietdate[] = (sdVO.getSdi_dietdate()).split("/");
					System.out.println(" >>>>" + dietdate[0]);
					System.out.println(" >>>>" + dietdate[1]);
					System.out.println(" >>>>" + dietdate[2]);
					String date = dietdate[0] + "년 " + dietdate[1] + "월 " + dietdate[2] + "일 " + sdVO.getSmb_id() + "님의 식단";			
		%>
<script type="text/javascript">
  $(document).ready(function() {
	var breakfast = $("#sdi_breakfast").val();
   	var lunch = $("#sdi_lunch").val();
    var dinner = $("#sdi_dinner").val();
    if(breakfast != null || lunch != null || dinner != null){
	    dietDataSet();    	
    }
	// ========== 날짜 검색 ==========
    $("#sdi_dietdate").datepicker();
    $("#sdi_dietdate").datepicker("option","dateFormat","yy/mm/dd");
    
    $("#dateSearch").click(function(){
    	var dietdate = $("#sdi_dietdate").val();
    	if(dietdate != null && dietdate.length > 0){
	    	$("#dateSearchForm").attr({
					"method":"post",
					"enctype":"application/x-www-form-urlencoded",
					"action":"/spoMatch/selectDiet.spo"
			}).submit();	    		
    	}else{
    		alert("날짜를 선택해 주세요");
    		return false;
    	}
    });
    
 	// ========== 해당 날짜에 데이터가 있을 시 데이터 상세조회버튼 ==========
    $("#updateB").click(function(){
    	$("#dietForm").attr({
    		"method":"post",
			"enctype":"application/x-www-form-urlencoded",
			"action":"/spoMatch/detailDiet.spo"
    	}).submit();
    });
    
 	// ========== 해당 날짜에 데이터가 있을 시 데이터 삭제 버튼 ==========
    $("#deleteB").click(function(){
    	if(confirm("내용을 삭제하시겠습니까?")){
	    	$("#dietForm").attr({
	    		"method":"post",
	    		"enctype":"application/x-www-form-urlencoded",
				"action":"/spoMatch/deleteDiet.spo"
	    	}).submit();    		
    	}else{
    		alert("삭제가 취소 되었습니다");
    		return false;
    	}
    });
    
  });
  
  function dietDataSet(){ 
	  var breakfast = $("#sdi_breakfast").val();
   	  var lunch = $("#sdi_lunch").val();
      var dinner = $("#sdi_dinner").val();
      
      if(breakfast != "null"){
	      var breakfastArr = breakfast.split("^");
	      for(var i=0; i<breakfastArr.length; i++){
	          var bl = "<li><span name='breakList'>"+breakfastArr[i]+"</span></li>";
	    	  $("#breakfast_list").append(bl);
	      }    	  
      }else{
    	  var nbl = "<li><span name='breakList'>저장된 식단이 없습니다</span></li>";
    	  $("#breakfast_list").append(nbl);
      }
	  
      if(lunch != "null"){
	      var lunchArr = lunch.split("^");
	      for(var i=0; i<lunchArr.length; i++){
	    	  var ll = "<li><span name='lunchList'>"+lunchArr[i]+"</span></li>";
	    	  $("#lunch_list").append(ll);
	      }    	  
      }else{
    	  var nll = "<li><span name='lunchList'>저장된 식단이 없습니다</span></li>";
    	  $("#lunch_list").append(nll);
      }
      
      if(dinner != "null"){
	      var dinnerArr = dinner.split("^");
	      for(var i=0; i<dinnerArr.length; i++){
	    	  var dl = "<li><span name='dinnerList'>"+dinnerArr[i]+"</span></li>";
	    	  $("#dinner_list").append(dl);
	      }    	  
      }else{
    	  var ndl = "<li><span name='dinnerList'>저장된 식단이 없습니다</span></li>";
    	  $("#dinner_list").append(ndl);
      }
    
      var calValue = <%=sdVO.getSdi_cal()%>
      var tanValue = <%=sdVO.getSdi_tan()%>
      var danValue = <%=sdVO.getSdi_dan()%>
      var fatValue = <%=sdVO.getSdi_fat()%>
      var saltValue = <%=sdVO.getSdi_salt()%>
      var sugarValue = <%=sdVO.getSdi_sugar()%>
      var colValue = <%=sdVO.getSdi_col()%>
      var fatacidValue = <%=sdVO.getSdi_fatacid()%>
      var transValue = <%=sdVO.getSdi_trans()%>
      
      var barArr = new Array();
      barArr.push(tanValue);
      barArr.push(danValue);
      barArr.push(fatValue);
      barArr.push(saltValue);
      barArr.push(sugarValue);
      barArr.push(colValue);
      barArr.push(fatacidValue);
      barArr.push(transValue);
     
      barChartPrint(barArr);
      
      var pieArr = new Array();
      
      pieArr.push(tanValue);
      pieArr.push(danValue);
      pieArr.push(fatValue);
      
      pieChartPrint(pieArr);
  }
  
  function barChartPrint(chartData){
		var ctx = document.getElementById('myChart').getContext('2d');
		var chart = new Chart(ctx, {
		    // The type of chart we want to create
		    type: 'horizontalBar',

		    // The data for our dataset
		    data: {
		        labels: ['탄수화물','단백질','지방','나트륨','당','콜레스테롤','포화지방산','트랜스지방'],
		        datasets: [{
		            label: '식품 성분 표',
		            borderColor: 'rgb(255, 99, 132)',
		            backgroundColor : 'rgb(255, 99, 132)',
		            data: chartData
		        }]
		    },
		    // Configuration options go here
		    options: {
            maintainAspectRatio: false,
            responsive: false,
            legend: {
              display: true,
              position: 'center',
              labels: {
                fontSize: 12,
                fontFamily: 'Noto Sans KR',
                fontStyle: 'bold'
              }
            }
          }
		});
	}
  
  function pieChartPrint(chartData){
		var ctx = document.getElementById('myChartPie').getContext('2d');
		var chart = new Chart(ctx, {
		    // The type of chart we want to create
		    type: 'pie',

		    // The data for our dataset
		    data: {
		        labels: ['탄수화물','단백질','지방'],
		        datasets: [{
		            label: '식품 성분 표',
		            borderColor: 'rgb(255, 99, 132)',
		            backgroundColor : ['rgb(255, 000, 000, 0.3)','rgb(000, 000, 255, 0.3 )','rgb(255, 255, 000, 0.3)'],
		            data: chartData
		        }]
		    },

		    // Configuration options go here
		    options: {
            maintainAspectRatio: false,
            responsive: false,
            legend: {
              display: true,
              position: 'left',
              labels: {
                fontSize: 12,
                fontFamily: 'Noto Sans KR',
                fontStyle: 'bold'
              }
            }
          }
		});
	}
  </script>
</head>
<body id="page-top">
<%@include file="../common/header.jsp" %>

<section>
	<div class="container">
		<%-- ==================== 날짜검색 ==================== --%>
		<div class="row col-lg-8 mx-auto date">
			<div>
				<h5>날짜검색</h5>
				<form id="dateSearchForm" name="dateSearchForm">	
					<div>
						<p>
							Date: <input type="text" id="sdi_dietdate" name="sdi_dietdate" readOnly>
							<input type="button" id="dateSearch" name="dateSearch" value="검색"/>	
						</p>
					</div>
				</form>
			</div>
		</div>
		<!-- Today & 식단 & 영양소  -->
		<form id="dietInsertForm" name="dietInsertForm">
			<h2><%=date %></h2>
			<div class="dietInsertForm_diet_nutrient">
				<!-- 식단 -->
				<div id="diet">
					<div class="diet_subject">Menu</div>
					<div class="diet_meal">
						<%-- 아침 --%>
						<div class="diet_breakfast">
							<p class="subject">아침</p>
							<input type="hidden" id="sdi_breakfast" name="sdi_breakfast" value="<%=sdVO.getSdi_breakfast() %>" readOnly/>
							<ul id="breakfast_list">
							</ul>
						</div>
						<div class="diet_lunch">
							<p class="subject">점심</p>
							<input type="hidden" id="sdi_lunch" name="sdi_lunch" value="<%=sdVO.getSdi_lunch() %>" readOnly/>
							<ul id="lunch_list">
							</ul>
						</div>
						<div class="diet_dinner">
							<p class="subject">저녁</p>
							<input type="hidden" id="sdi_dinner" name="sdi_dinner" value="<%=sdVO.getSdi_dinner() %>" readOnly/>
							<ul id="dinner_list">
							</ul>
						</div>
					</div>
				</div>
				<!-- 영양성분 -->
				<div id="nutrient">
					<div class="nutrient_subject">Nutrition</div>
					<div class="nutrient_content">
						<!-- 칼로리 -->
						<div class="nutrient_kcal">
							<div>
								<p>일일 권장량</p>
								<input type="text" id="smb_dailycal" name="smb_dailycal" value="<%=sdVO.getSmb_dailycal()%>kcal" readOnly/>
							</div>
							<div>
								<p>현재 식단 칼로리</p>
								<input type="text" id="sdi_cal" name="sdi_cal" value="<%=sdVO.getSdi_cal() %>kcal" readOnly/>
							</div>
						</div>
						<div class="nutrient_mainnutrie">
						<!-- 3대 영양소 -->
							<div>
								<p>탄수화물</p>
								<input type="text" id="sdi_tan" name="sdi_tan" value="<%=sdVO.getSdi_tan() %>g" readOnly/>
							</div>
							<div>
								<p>단백질</p>
								<input type="text" id="sdi_dan" name="sdi_dan" value="<%=sdVO.getSdi_dan() %>g"  readOnly/>
							</div>
							<div>
								<p>지방</p>
								<input type="text" id="sdi_fat" name="sdi_fat" value="<%=sdVO.getSdi_fat() %>g" readOnly/>
							</div>
						</div>		
						<div class="nutrient_subnutrie">
						<!-- 부 영양성분 -->
							<div>
								<p>당</p>
								<input type="text" id="sdi_sugar" name="sdi_sugar" value="<%=sdVO.getSdi_sugar() %>g"  width="5" readOnly/>
							</div>
							<div>
								<p>나트륨</p>
								<input type="text" id="sdi_salt" name="sdi_salt" value="<%=sdVO.getSdi_salt() %>g"  readOnly/>
							</div>
							<div>
								<p>콜레스테롤</p>
								<input type="text" id="sdi_col" name="sdi_col" value="<%=sdVO.getSdi_col() %>g"  readOnly/>
							</div>
							<div>
								<p>포화지방산</p>
								<input type="text" id="sdi_fatacid" name="sdi_fatacid" value="<%=sdVO.getSdi_fatacid() %>g"  readOnly/>
							</div>
							<div>
								<p>트랜스지방</p>
								<input type="text" id="sdi_trans" name="sdi_trans" value="<%=sdVO.getSdi_trans() %>g"  readOnly/>
							</div>
						</div>
					</div>
					<input type="hidden" id="sdi_no" name="sdi_no" value="<%=sdVO.getSdi_no()%>">
					<input type="hidden" id="u_sdi_dietdate" name="u_sdi_dietdate" value="<%=sdVO.getSdi_dietdate()%>">
				</div>
				<div class="dietInsertForm_btn">
					<input type="button" id="deleteB" name="deleteB" value="초기화">
				</div>
			<div class="graph">
				<div class="graph_pie">
					<canvas id="myChartPie" width="500px" height="450px"></canvas>
				</div>
				<div class="graph_bar">
					<canvas id="myChart" width="500px" height="350px"></canvas>
				</div>
			</div>
		</div>
	</form>
	</div>
</section>
<%@include file="../common/footer.html" %>

	<!-- ==================== 날짜 검색 할때 식단데이터가 없을 경우  ==================== -->
		<%
					
				}else{				
					if(objDate != null){
						SpoDietVO sVO = (SpoDietVO)objDate;
						String searchDate = sVO.getSdi_dietdate();
						System.out.println("searchDate >>> "+searchDate);
						String noDataDate[] = searchDate.split("/");
						System.out.println(" >>>>" + noDataDate[0]);
						System.out.println(" >>>>" + noDataDate[1]);
						System.out.println(" >>>>" + noDataDate[2]);
						String date = noDataDate[0] + "년 " + noDataDate[1] + "월 " + noDataDate[2] + "일 " + sVO.getSmb_id() + "님의 식단";
		%>
			<script type="text/javascript">
				$(document).ready(function(){
					// ========== 날짜 검색 ==========
				    $("#sdi_dietdate").datepicker();
				    $("#sdi_dietdate").datepicker("option","dateFormat","yy/mm/dd");
				    
				    $("#dateSearch").click(function(){
				    	var dietdate = $("#sdi_dietdate").val();
				    	if(dietdate != null && dietdate.length > 0){
					    	$("#dateSearchForm").attr({
									"method":"post",
									"enctype":"application/x-www-form-urlencoded",
									"action":"/spoMatch/selectDiet.spo"
							}).submit();	    		
				    	}else{
				    		alert("날짜를 선택해 주세요");
				    		return false;
				    	}
				    });
					
					// ========== 해당 날짜에 데이터가 없을 시 데이터 입력 버튼 ==========
				    $("#insertB").click(function(){
					    $("#noDataForm").attr({
				    		"method":"post",
							"enctype":"application/x-www-form-urlencoded",
							"action":"/spoMatch/insertDietForm.spo"
				    	}).submit(); 
					});
				})
				
			</script>
			
		<%@include file="../common/header.jsp" %>
		<section>
			<div class="container">
				<div class="row col-lg-8 mx-auto date">
					<div>
						<h5>날짜검색</h5>
						<form id="dateSearchForm" name="dateSearchForm">	
							<div>
								<p>
									Date: <input type="text" id="sdi_dietdate" name="sdi_dietdate" readOnly>
									<input type="button" id="dateSearch" name="dateSearch" value="검색"/>	
								</p>
							</div>
						</form>
					</div>
				</div>
				<div>
					<form id="noDataForm" name="noDataForm">
						<h2><%=date %></h2>
						<div style="font-size: 30px; font-family: sans-serif; text-align: center; margin: 93px;">저장된 식단이 없습니다...😥</div><br>
						<input type="button" id="insertB" name="insertB" value="입력">
						<input type="hidden" id="_sdi_dietdate" name="_sdi_dietdate" value="<%=searchDate%>">
					</form>
				</div>
			</div>
		</section>
		<%@include file="../common/footer.html" %>
		<%
					}				
		%>
	<%		
			}
		}
	%>

<!-- Bootstrap core JavaScript -->
<!-- <script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<!-- <script src="vendor/jquery-easing/jquery.easing.min.js"></script> -->
</body>
</html>
