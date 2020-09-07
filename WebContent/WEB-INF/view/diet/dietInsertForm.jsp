<%-- 2020/08/30 16:40 function deleteItem 수정 (식단 전체적으로 한번에 삭제되는 현상 수정)--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kosmo62.spomatch.diet.vo.SpoDietVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/diet/dietInsertForm.css"/>
<script type="text/javascript">
	$(document).ready(function() {
		// ==================== localStorage 데이터 세팅 ====================
		setData();
	    // ==================== DB insert 버튼 ====================
	    $("#insertB").click(function(){
	    	var bl = $("span[name=breakList]");
	    	var ll = $("span[name=lunchList]");
	    	var dl = $("span[name=dinnerList]");
	    	
	    	var blStr = "";
	    	var llStr = "";
	    	var dlStr = "";
	    	
	    	for(var i=0; i<bl.length; i++){
				if(i == 0){
					blStr = bl[i].innerHTML;
				}else{
					blStr += "^" + bl[i].innerHTML;					
				}
	    	}
			$("#sdi_breakfast").val(blStr);    
	    	
			for(var i=0; i<ll.length; i++){
				if(i == 0){
					llStr = ll[i].innerHTML;
				}else{
					llStr += "^" + ll[i].innerHTML;					
				}
	    	}
			$("#sdi_lunch").val(llStr);    
	    	
			for(var i=0; i<dl.length; i++){
				if(i == 0){
					dlStr = dl[i].innerHTML;
				}else{
					dlStr += "^" + dl[i].innerHTML;					
				}
	    	}
			$("#sdi_dinner").val(dlStr);   
			
	    	$("#dietInsertForm").attr({
	    		"method":"post",
				"enctype":"application/x-www-form-urlencoded",
				"action":"/spoMatch/insertDiet.spo"
	    	}).submit();
	    });
	    
	    
	    // ==================== 식품 검색 팝업창 ====================
	    $("#sdi_breakfast").click(function(){
	    	$("#mealFlag").val("1");
	    	window.open("","pop","width=440, height=820");
	    	$("#dietInsertForm").attr({
	    		"enctype":"application/x-www-form-urlencoded",
	    		"method":"post",
	    		"target":"pop",
	    		"action":"/spoMatch/itemInfo.spo"
	    	}).submit();
	    });
	    
	    $("#sdi_lunch").click(function(){
	    	$("#mealFlag").val("2");
	    	window.open("","pop","width=460, height=820");
	    	$("#dietInsertForm").attr({
	    		"enctype":"application/x-www-form-urlencoded",
	    		"method":"post",
	    		"target":"pop",
	    		"action":"/spoMatch/itemInfo.spo"
	    	}).submit();
	    });
	    
	    $("#sdi_dinner").click(function(){
	    	$("#mealFlag").val("3");
	    	window.open("","pop","width=440, height=820");
	    	$("#dietInsertForm").attr({
	    		"enctype":"application/x-www-form-urlencoded",
	    		"method":"post",
	    		"target":"pop",
	    		"action":"/spoMatch/itemInfo.spo"
	    	}).submit();
	    });
	});
	
	// ==================== 선택한 Item 삭제 ====================
	function deleteItem(flag,length){
		var storageArr = JSON.parse(localStorage.getItem("returnValue"));
		var spanBreak = $("span[name=breakList]");
		var spanLunch = $("span[name=lunchList]");
		var spanDinner = $("span[name=dinnerList]");
		if(confirm("삭제하시겠습니까?")){
			if(flag == "1"){
				for(var i=0; i<spanBreak.length; i++){
					if(storageArr[length].flag == "1"){
						if(spanBreak[i].innerHTML == storageArr[length].name){
							storageArr.splice(length,1);
						}
					}
				}	
			}else if(flag == "2"){
				for(var i=0; i<spanLunch.length; i++){
					if(storageArr[length].flag == "2"){
						if(spanLunch[i].innerHTML == storageArr[length].name){
							storageArr.splice(length,1);
						}
					}
				}	
			}else if(flag == "3"){
				for(var i=0; i<spanDinner.length; i++){
					if(storageArr[length].flag == "3"){
						if(spanDinner[i].innerHTML == storageArr[length].name){
							storageArr.splice(length,1);
						}
					}
				}	
			}
		}
		localStorage.setItem("returnValue",JSON.stringify(storageArr));
		location.reload();
	}
	
	// ==================== reload될 때 로컬스토리지의 데이터 출력 ====================
	function setData(){
		// ==================== localStorage Data 가공  ====================
		if(localStorage.getItem("returnValue") != null){
			var storageArr = JSON.parse(localStorage.getItem("returnValue"));
			var arrLength = storageArr.length;
			var calValue = 0;
			var tanValue = 0;
			var danValue = 0;
			var fatValue = 0;
			var saltValue = 0;
			var sugarValue = 0;
			var colValue = 0;
			var fatacidValue = 0;
			var transValue = 0;
				
			for(var i=0; i<arrLength; i++){
				// 아침식단 저장
				if(storageArr[i].flag == "1"){
					var breakli = "<li><span name='breakList'>"+storageArr[i].name+"</span>&nbsp;<span onclick='deleteItem("+storageArr[i].flag+","+i+")'><img src='https://img.icons8.com/metro/26/000000/trash.png'  width='20' height='20'/></span><input type='hidden' value='"+storageArr[i].name+"'/></li>";
					$("#breakfast_list").append(breakli);
				}
				// 점심식단 저장
				if(storageArr[i].flag == "2"){
					var lunchli = "<li><span name='lunchList'>"+storageArr[i].name+"</span>&nbsp;<span onclick='deleteItem("+storageArr[i].flag+","+i+")'><img src='https://img.icons8.com/metro/26/000000/trash.png'  width='20' height='20'/></span></li>";
					$("#lunch_list").append(lunchli);
				}
				// 저녁식단 저장
				if(storageArr[i].flag == "3"){
					var dinnerli = "<li><span name='dinnerList'>"+storageArr[i].name+"</span>&nbsp;<span onclick='deleteItem("+storageArr[i].flag+","+i+")'><img src='https://img.icons8.com/metro/26/000000/trash.png'  width='20' height='20'/></span></li>";
					$("#dinner_list").append(dinnerli);
				}
				
				calValue += parseFloat(storageArr[i].cal);
				$("#sdi_cal").val(calValue.toFixed(2));
				
				tanValue += parseFloat(storageArr[i].tan);
				$("#sdi_tan").val(tanValue.toFixed(2));
				
				danValue += parseFloat(storageArr[i].dan);
				$("#sdi_dan").val(danValue.toFixed(2));
				
				fatValue += parseFloat(storageArr[i].fat);
				$("#sdi_fat").val(fatValue.toFixed(2));
				
				saltValue += parseFloat(storageArr[i].salt);
				$("#sdi_salt").val(saltValue.toFixed(2));
				
				sugarValue += parseFloat(storageArr[i].sugar);
				$("#sdi_sugar").val(sugarValue.toFixed(2));
				
				colValue += parseFloat(storageArr[i].col);
				$("#sdi_col").val(colValue.toFixed(2));
				
				fatacidValue += parseFloat(storageArr[i].fatacid);
				$("#sdi_fatacid").val(fatacidValue.toFixed(2));
				
				transValue += parseFloat(storageArr[i].trans);
				$("#sdi_trans").val(transValue.toFixed(2));
				
				var chartArr = new Array();
				chartArr.push(tanValue.toFixed(2));
				chartArr.push(danValue.toFixed(2));
				chartArr.push(fatValue.toFixed(2));
				chartArr.push(saltValue.toFixed(2));
				chartArr.push(sugarValue.toFixed(2));
				chartArr.push(colValue.toFixed(2));
				chartArr.push(fatacidValue.toFixed(2));
				chartArr.push(transValue.toFixed(2));
				
				barChartPrint(chartArr);
			}	
		}else{
			var stoArr = new Array();
			barChartPrint(stoArr);
			localStorage.setItem("returnValue",JSON.stringify(stoArr));
		}
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
		    options: {}
		});
	}
</script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<section>
	<div class="container">
	<%
		Object obj = request.getAttribute("date");
		if(obj != null){
			SpoDietVO sdVO = (SpoDietVO)obj;
			String dietdate[] = (sdVO.getSdi_dietdate()).split("/");
			System.out.println(" >>>>" + dietdate[0]);
			System.out.println(" >>>>" + dietdate[1]);
			System.out.println(" >>>>" + dietdate[2]);
			String date = dietdate[0] + "년 " + dietdate[1] + "월 " + dietdate[2] + "일 " + sdVO.getSmb_id() + "님의 식단";
	%>
	
	<form id="dietInsertForm" name="dietInsertForm">
		<h2><%=date %></h2>
		<div class="dietInsertForm_diet_nutrient">
			<!-- ==================== 식단 입력 ==================== -->	
			<div id="diet">
				<div class="diet_subject">MENU</div>
				<div class="diet_meal">
					<!-- 아침 -->
					<div class="diet_breakfast">
						<p class="subject">아침</p>
						<input type="text" id="sdi_breakfast" name="sdi_breakfast" placeholder="아침 식단을 선택해주세요." readOnly/>
						<ul id="breakfast_list">
						</ul>
					</div>
					<!-- 점심 -->
					<div class="diet_lunch">
						<p class="subject">점심</p>
						<input type="text" id="sdi_lunch" name="sdi_lunch" placeholder="점심 식단을 선택해주세요." readOnly/>
						<ul id="lunch_list">
						</ul>
					</div>
					<!-- 저녁 -->
					<div class="diet_dinner">
						<p class="subject">저녁</p>
						<input type="text" id="sdi_dinner" name="sdi_dinner" placeholder="저녁 식단을 선택해주세요." readOnly/>
						<ul id="dinner_list">
						</ul>
					</div>
					<input type="hidden" id="mealFlag" name="mealFlag"/>
				</div>
			</div>
	 		<!-- ==================== 영양소 출력 ==================== -->
			<div id="nutrient">
				<div class="nutrient_subject">Nutrition</div>
				<div class="nutrient_content">
					<!-- 칼로리 부분 -->
	                 <div class="nutrient_kcal">
						<div>
							<p>일일 권장 칼로리</p>
							<input type="text" id="smb_dailycal" name="smb_dailycal" value="<%=sdVO.getSmb_dailycal()%>" readOnly/><span>&nbsp;kcal</span>
						</div>
						<div>
							<p>현재 식단 칼로리</p>
						<input type="text" id="sdi_cal" name="sdi_cal" readOnly/><span>&nbsp;kcal</span>
						</div>
					</div>
					<!-- 3대 영양소 부분 -->
					<div class="nutrient_mainnutrie">
						<div>
							<p>탄수화물</p>
							<input type="text" id="sdi_tan" name="sdi_tan" readOnly/><span>&nbsp;g</span>
						</div>
						<div>
						<p>단백질</p>
						<input type="text" id="sdi_dan" name="sdi_dan" readOnly/><span>&nbsp;g</span>
						</div>
						<div>
							<p>지방</p>
						<input type="text" id="sdi_fat" name="sdi_fat" readOnly/><span>&nbsp;g</span>
						</div>
					</div>
					<!-- 나머지 영양소 부분 -->
	                <div class="nutrient_subnutrie">
						<div>
							<p>나트륨</p>
							<input type="text" id="sdi_salt" name="sdi_salt" readOnly/><span>&nbsp;g</span>
						</div>
						<div>
							<p>당</p>
							<input type="text" id="sdi_sugar" name="sdi_sugar" readOnly/><span>&nbsp;g</span>
						</div>
						<div>
							<p>콜레스테롤</p>
							<input type="text" id="sdi_col" name="sdi_col" readOnly/><span>&nbsp;mg</span>
						</div>
						<div>
							<p>포화지방산</p>
							<input type="text" id="sdi_fatacid" name="sdi_fatacid" readOnly/><span>&nbsp;g</span>
						</div>
						<div>
							<p>트랜스지방</p>
							<input type="text" id="sdi_trans" name="sdi_trans" readOnly/><span>&nbsp;g</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 그래프 부분 -->
		<div>
			<canvas id="myChart"></canvas>
		</div>
		<!-- 입력 버튼 -->
		<div class="dietInsertForm_btn">
			<input type="button" id="insertB" name="insertB" value="입력">
			<input type="hidden" id="_sdi_dietdate" name="_sdi_dietdate" value="<%=sdVO.getSdi_dietdate()%>">	
		</div>
	</form>
	<%
		}
	%>
	</div>
</section>
<%@include file="../common/footer.html" %>
</body>
</html>