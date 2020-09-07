<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾기</title>
<link href="css/diet/iteminfo.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript">
	$(document).ready(function(){
		// ==================== 식품리스트 ajax ====================
		$("#search_button").click(function(){
			$("#item_list").empty();
			$("#search_size").empty();
			var urls = "http://openapi.foodsafetykorea.go.kr/api/ea4aa540a8a64fd8afcb/I2790/json/1/500/DESC_KOR="+$("#item_search").val();
			console.log(urls);
			$.ajax({
				url : urls,
				dataType : "json",
				type : "post",
				success : searchOk,
				error : searchFail
			});
		});
		// ==================== 식품리스트 ajax 성공 ====================
		function searchOk(data){
			console.log(data);
			var dataJson = data.I2790.row;
			var dataSize = data.I2790.row.length;
			var sizeView = "<p>검색된 데이터 수 = "+dataSize+"</p>";
			var view = "";
			console.log(dataSize);
			for(var i=0; i<dataSize; i++){
				view += "<p class='data' onclick='selectItem(this)'>"+dataJson[i].DESC_KOR+"</p>";
			}
			$("#search_size").append(sizeView);
			$("#item_list").append(view);
		}
		
		 // ==================== 식품리스트 ajax 실패 ====================
		function searchFail(){
			alert("통신에 오류가 있습니다");
		}
		
		
		// ==================== 섭취량증가 function ====================
		$("#check_button").click(function(){
			//증가할 섭취량
			var intakeVal = $("#intake").val();
			//증가하기 전 기본 데이터를 위해 저번 증가값을 저장 
			var historyVal = $("#intake_history").val();
			
			var ss = $("#sdi_serving_size").val();
			var cal = $("#sdi_cal").val();
			var tan = $("#sdi_tan").val();
			var dan = $("#sdi_dan").val();
			var fat = $("#sdi_fat").val();
			var sugar = $("#sdi_sugar").val();
			var salt = $("#sdi_salt").val();
			var col = $("#sdi_col").val();
			var fatasid = $("#sdi_fatasid").val();
			var trans = $("#sdi_trans").val();
			
			//소수점 두자리수 까지 출력
			var ssVal = Math.round(((ss/historyVal)*intakeVal) * 100)/100;
			var calVal = Math.round(((cal/historyVal)*intakeVal) * 100)/100;
			var tanVal = Math.round(((tan/historyVal)*intakeVal) * 100)/100;
			var danVal = Math.round(((dan/historyVal)*intakeVal) * 100)/100;
			var fatVal = Math.round(((fat/historyVal)*intakeVal) * 100)/100;
			var sugarVal = Math.round(((sugar/historyVal)*intakeVal) * 100)/100;
			var saltVal = Math.round(((salt/historyVal)*intakeVal) * 100)/100;
			var colVal = Math.round(((col/historyVal)*intakeVal) * 100)/100;
			var fatasidVal = Math.round(((fatasid/historyVal)*intakeVal) * 100)/100;
			var transVal = Math.round(((trans/historyVal)*intakeVal) * 100)/100;
			
			//현재 값에 저번 증가값을 나눠 기본데이터를 구해서 새롭게 검색할 증가량을 구함 
			$("#sdi_serving_size").val(ssVal);
			$("#sdi_cal").val(calVal);
			$("#sdi_tan").val(tanVal);
			$("#sdi_dan").val(danVal);
			$("#sdi_fat").val(fatVal);
			$("#sdi_sugar").val(sugarVal);
			$("#sdi_salt").val(saltVal);
			$("#sdi_col").val(colVal);
			$("#sdi_fatasid").val(fatasidVal);
			$("#sdi_trans").val(transVal);
			
			//과정 종료 후에 검색한 증가량을 history value에 저장 
			historyVal = $("#intake_history").val($("#intake").val());
		});
	});
	
	// ==================== 선택 식품 정보 ajax ====================
	function selectItem(item){
		console.log(">>>>>>>>>"+item);
		var value = item.innerHTML;
		console.log(value);
		var urlInfo = "http://openapi.foodsafetykorea.go.kr/api/ea4aa540a8a64fd8afcb/I2790/json/1/500/DESC_KOR=";
		console.log(urlInfo);
		var datas = {
				"url" : urlInfo,
				"item" : value
		}
		var urls = "/spoMatch/readJSON.spo";
		console.log(urls);
		console.log(datas);
		$.ajax({
			url: urls,
			dataType : "JSON",
			type : "post",
			data : datas,
			success : detailInfo,
			error : errorInfo
		});
	}
	
	function detailInfo(data){
		console.log(data);	
		console.log(data.DESC_KOR);
		console.log(data.SERVING_SIZE);
		console.log(data.NUTR_CONT1);
		console.log(data.NUTR_CONT2);
		console.log(data.NUTR_CONT3);
		console.log(data.NUTR_CONT4);
		console.log(data.NUTR_CONT5);
		console.log(data.NUTR_CONT6);
		console.log(data.NUTR_CONT7);
		console.log(data.NUTR_CONT8);
		console.log(data.NUTR_CONT9);
		
		$("#sdi_desc_kor").val("");
		$("#sdi_serving_size").val("");
		$("#sdi_cal").val("");
		$("#sdi_tan").val("");
		$("#sdi_dan").val("");
		$("#sdi_fat").val("");
		$("#sdi_sugar").val("");
		$("#sdi_salt").val("");
		$("#sdi_col").val("");
		$("#sdi_fatasid").val("");
		$("#sdi_trans").val("");
		
		if(data.sdi_serving_size == null || data.SERVING_SIZE.length <=0){
			data.sdi_serving_size = 0;
		}
		if(data.NUTR_CONT1 == null || data.NUTR_CONT1.length <=0){
			data.NUTR_CONT1 = 0;
		}
		if(data.NUTR_CONT2 == null || data.NUTR_CONT2.length <=0){
			data.NUTR_CONT2 = 0;
		}
		if(data.NUTR_CONT3 == null || data.NUTR_CONT3.length <=0){			
			data.NUTR_CONT3 = 0;
		}
		if(data.NUTR_CONT4 == null || data.NUTR_CONT4.length <=0){
			data.NUTR_CONT4 = 0;
		}
		if(data.NUTR_CONT5 == null || data.NUTR_CONT5.length <=0){
			data.NUTR_CONT5 = 0;
		}
		if(data.NUTR_CONT6 == null || data.NUTR_CONT6.length <=0){
			data.NUTR_CONT6 = 0;
		}
		if(data.NUTR_CONT7 == null || data.NUTR_CONT7.length <=0){
			data.NUTR_CONT7 = 0;
		}
		if(data.NUTR_CONT8 == null || data.NUTR_CONT8.length <=0){
			data.NUTR_CONT8 = 0;
		}
		if(data.NUTR_CONT9 == null || data.NUTR_CONT9.length <=0){
			data.NUTR_CONT9 = 0;
		}	
		
		$("#sdi_desc_kor").val(data.DESC_KOR);
		$("#sdi_serving_size").val(data.SERVING_SIZE);
		$("#sdi_cal").val(data.NUTR_CONT1);
		$("#sdi_tan").val(data.NUTR_CONT2);
		$("#sdi_dan").val(data.NUTR_CONT3);
		$("#sdi_fat").val(data.NUTR_CONT4);
		$("#sdi_sugar").val(data.NUTR_CONT5);
		$("#sdi_salt").val(Math.round((data.NUTR_CONT6 / 1000)*100)/100);
		$("#sdi_col").val(data.NUTR_CONT7);
		$("#sdi_fatasid").val(data.NUTR_CONT8);
		$("#sdi_trans").val(data.NUTR_CONT9);
		
		var barChartArr = new Arr();
		barChartArr.push(data.NUTR_CONT2);
		barChartArr.push(data.NUTR_CONT3);
		barChartArr.push(data.NUTR_CONT4);
		barChartArr.push(data.NUTR_CONT5);
		barChartArr.push(data.NUTR_CONT6);
		barChartArr.push(data.NUTR_CONT7);
		barChartArr.push(data.NUTR_CONT8);
		barChartArr.push(data.NUTR_CONT9);
		barChartPrint(barChartArr);
				
		var pieChartArr = new Arr();
		pieChartArr.push(data.NUTR_CONT2);
		pieChartArr.push(data.NUTR_CONT3);
		pieChartArr.push(data.NUTR_CONT4);
		pieChartPrint(pieChartArr);
	}
	
	function errorInfo(){
		alert("2번쨰 통신에 오류가 있습니다");	
	}
	
	// ==================== 추가버튼 form ==================== 
	function addButton(){
		var returnValue = {
				"flag" : $("#mealFlag").val(), 
			    "name": $("#sdi_desc_kor").val(),
			    "cal": $("#sdi_cal").val(),
		   		"tan": $("#sdi_tan").val(),
		   		"dan": $("#sdi_dan").val(),
		   		"fat": $("#sdi_fat").val(),
		   		"sugar": $("#sdi_sugar").val(),
		   		"salt": $("#sdi_salt").val(),
		   		"col": $("#sdi_col").val(),
		   		"fatacid": $("#sdi_fatasid").val(),
		   		"trans": $("#sdi_trans").val()
			  };		
		var storageData = localStorage.getItem("returnValue");
		
		// 해당 스토리지에 데이터가 없을 때(처음 식단 등록할 때)
		if(storageData == null){
			var storageArr = new Array();
			storageArr.push(returnValue);
			localStorage.setItem("returnValue", JSON.stringify(storageArr));
		// 해당 스토리지에 데이터가 있을 때(이후 등록할 때)
		}else{
			var storageJSON = JSON.parse(storageData);
			console.log(storageJSON);
			storageJSON.push(returnValue);
			localStorage.setItem("returnValue", JSON.stringify(storageJSON));
		}
		window.opener.location.reload();
		window.close();
	}
	
	function barChartPrint(chartData){
		var ctx = document.getElementById('myChart').getContext('2d');
		var chart = new Chart(ctx, {
		    // The type of chart we want to create
		    type: 'horizontalBar',

		    // The data for our dataset
		    data: {
		        labels: ['칼로리','탄수화물','단백질','지방','나트륨','당','콜레스테롤','포화지방산','트랜스지방'],
		        datasets: [{
		            label: '식품 성분 표',
		            borderColor: 'rgb(255, 99, 132)',
		            backgroundColor : 'rgb(255, 99, 132)',
		            data: chartData
		        }]
		    },

		    // Configuration options go here
		    options: {}
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
		    options: {}
		});
	}
</script>
</head>
<body>
	<%
		Object obj = request.getAttribute("flag");
		String mealFlag = (String)obj;
		Object obj2 = request.getAttribute("dailycal");
		String dailyCal = (String)obj2;
	%>
	<!-- 1차 검색으로 검색한 식품을 item_list에 출력 -->
	<div>
		<div id="container">
			<div class="search_meal">
				<input type="text" id="item_search" placeholder="검색할 식품을 입력해 주세요">
				<input type="button" id="search_button" value="찾기">
			</div>
			<div class="search_result">	
				<div id="search_size"></div>
				<div id="item_list"></div>
			</div>
		<!-- 2차 검색으로 원하는 식품을 선택해서 식품의 정보를 출력 -->
			<div id="item_info">
				<form id="itemInfoForm" name="itemInfoForm">
					<div class="itemInfoForm_content">
						<div class="item_subject">
							<p>섭취량</p>
							<p>일일 권장 칼로리</p>
							<p>식품명</p>
							<p>식품 칼로리</p>
							<p>총 내용량</p>
							<p>탄수화물</p>
							<p>단백질</p>
							<p>지방</p>
							<p>나트륨</p>
							<p>당</p>
							<p>콜레스테롤</p>
							<p>포화지방산</p>
							<p>트랜스지방</p>
						</div>
						<div class="item">
							<div class="iteminfo">
								<div>
									<input type="hidden" id="intake_history" name="intake_history" value="1">
									<input type="hidden" id="mealFlag" name="mealFlag" value="<%=mealFlag %>">
									<input type="text" id="intake" name="intake" placeholder="총 내용량당 1회 기준" size="">
									<input type="button" id="check_button" name="check_button" value="확인">
								</div>
							</div>
							<div class="iteminfo">
								
								<input type="text" id="smb_dailycal" name="smb_dailycal" value="<%=dailyCal %>" readOnly>&nbsp;kcal
							</div>
							<div class="iteminfo">
								
								<input type="text" id="sdi_desc_kor" name="sdi_desc_kor" readOnly>
							</div>
							<div class="iteminfo">
								
								<input type="text" id="sdi_cal" name="sdi_cal" readOnly>&nbsp;kcal
							</div>
							<div class="iteminfo">
								
								<input type="text" id="sdi_serving_size" name="sdi_serving_size" readOnly>&nbsp;g
							</div>
							<div class="iteminfo">
								
								<input type="text" id="sdi_tan" name="sdi_tan" readOnly>&nbsp;g
							</div>
							<div class="iteminfo">
								
								<input type="text" id="sdi_dan" name="sdi_dan" readOnly>&nbsp;g
							</div>
							<div class="iteminfo">
								
								<input type="text" id="sdi_fat" name="sdi_fat" readOnly>&nbsp;g
							</div>
							<div class="iteminfo">
								
								<input type="text" id="sdi_salt" name="sdi_salt" readOnly>&nbsp;g
							</div>
							<div class="iteminfo">
								
								<input type="text" id="sdi_sugar" name="sdi_sugar" readOnly>&nbsp;g
							</div>
							<div class="iteminfo">
								
								<input type="text" id="sdi_col" name="sdi_col" readOnly>&nbsp;g
							</div>
							<div class="iteminfo">
								
								<input type="text" id="sdi_fatasid" name="sdi_fatasid" readOnly>&nbsp;g
							</div>
							<div class="iteminfo">
								
								<input type="text" id="sdi_trans" name="sdi_trans" readOnly>&nbsp;g
							</div>
						</div>
					</div>
					<div class="itemInfoForm_btn">
						<input type="button" id="add_button" name="add_button" value="추가" onclick="addButton()"/>
						<input type="button" id="cancel_button" name="cancel_button" value="취소" onclick="window.close()"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>