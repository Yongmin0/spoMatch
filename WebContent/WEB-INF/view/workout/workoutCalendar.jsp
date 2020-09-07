<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="kosmo62.spomatch.workout.vo.SpoWorkoutVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- FullCalendar cdn -->
<link href="packages/core/main.css" rel="stylesheet">
<link href="packages/daygrid/main.css" rel="stylesheet">
<script src="packages/core/main.js"></script>
<script src="packages/core/locales/ko.js"></script>
<script src="packages/interaction/main.js"></script>
<script src="packages/daygrid/main.js"></script>

<!-- Chartjs cdn -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<style type="text/css">
</style>
<%
	HttpSession hs = request.getSession(false);
	if(hs != null){	
		String smb_no = String.valueOf(hs.getAttribute("smb_no"));
%>



<script type="text/javascript">
	$(document).ready(function(){
		dbCalendar();
		dbChart();
	});
	
	// ==================== Ajax로 event DB값 가져오기 ====================
	function dbCalendar(){
		var url = "/spoMatch/eventsWorkout.spo";
		var datas = {
			"smb_no" : "<%=smb_no%>"	
		};
		$.ajax({
			url:url,
			dataType:"json",
			data : datas,
			success : function(data){
				viewCalendar(data);						
			},
			error : function(){
				alert("error");
			}
		});
	}
	
	// ==================== FullCalendar 출력  ==================== 
	function viewCalendar(events){	
		var calendarEl = document.getElementById("calendar");
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : ['interaction','dayGrid'],
			customButtons : {
				addPlan : {
					text : "일정추가",
					click : function(){
						$("#exercisePlan").attr({
							"method" : "post",
							"enctype" : "application/x-www-form-urlencoded",
							"action" : "exerciseMain.spo"
						}).submit();	
					}
				}
			},
			header : {
				left:'prev,next',
				center:'title',
				right:'addPlan, dayGridMonth,dayGridWeek,dayGridDay'
			},
			events: events,
			editable : true,
			eventLimit : true,
			eventStartEditable : false,
			eventMouseEnter:function(info){
			    var el=$(info.el);
			    var layer='<div id="events-layer" class="fc-transparent"><span id="delbut'+info.event.id+'" class="btn btn-default trash btn-xs">삭제</span></div>';
			    el.append(layer);

			    el.find(".fc-bg").css("pointer-events","none");

			    $("#delbut"+info.event.id).click(function(){
			    	var actionUrl = "deleteWorkout.spo?swo_no="+info.event.id;
			    	if(confirm("일정을 삭제하시겠습니까?")){
						$("#exercisePlan").attr({
							"method" : "post",
							"enctype" : "application/x-www-form-urlencoded",
							"action" : actionUrl
						}).submit();					
					}
			    });
			},
			eventMouseLeave:function(info){
			    $("#events-layer").remove();
			},
			navLinks : true,	
			locale : 'ko'
		});
		calendar.render();
	}
	
	// ==================== Ajax로 Chart DB값 가져오기 ====================
	function dbChart(){
		var url = "/spoMatch/chartWorkout.spo";
		var datas = {
			"smb_no" : "<%=smb_no%>"	
		};
		$.ajax({
			url:url,
			dataType:"json",
			data : datas,
			success : function(data){
				printChart(data);						
			},
			error : function(){
				alert("error");
			}
		});
	}
	
	// ==================== Chart 출력 ====================
	function printChart(chartData){
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth()
		var day = today.getDate();
		var week = today.getDay();
		var dayArr = new Array();
		var dataArr = new Array();
		//오늘부터 1주일전까지 날짜 배열
		for(var i=6; i>=0; i--){
			  var newDate = new Date(year, month, day-i);
			  var newYear = newDate.getFullYear();
			  var newMonth = Number(newDate.getMonth()) + 1;
			  var newDay = newDate.getDate();
			  if(String(newMonth).length == 1){
				  newMonth = "0" + newMonth;
			  }
			  if(String(newDay).length == 1){
				  newDay = "0" + newDay;
			  }
			  dayArr.push(newYear + "-" + newMonth + "-" + newDay);
		}
		dayArr.push("목표 몸무게");
		
		//들어온 데이터와 만든 날짜 배열을 비교해 해당 날짜에 값을 받고 
		//들어온 값이 없으면 오늘날짜에 입력받은 데이터를 바인딩
		for(var i=0; i<dayArr.length; i++){	
			var datas = {
					"x" : dayArr[i],
					"y" : chartData[chartData.length-2].y
			};
			for(var j=0; j<chartData.length; j++){
				if(dayArr[i] == chartData[j].x){
					datas = {
						"x" : dayArr[i],
						"y" : chartData[j].y
					};
				}
			}
			dataArr.push(datas);
		}
		
		
		var ctx = document.getElementById('myChart').getContext('2d');
		var chart = new Chart(ctx, {
		    // The type of chart we want to create
		    type: 'line',

		    // The data for our dataset
		    data: {
		        labels: dayArr,
		        datasets: [{
		            label: '체중 변화 현황',
		            borderColor: 'rgb(255, 99, 132)',
		            data: dataArr,
		            lineTension:0,
		            fill:origin
		        }]
		    },

		    // Configuration options go here
		    // 목표 몸무게의 +-20를 y축 데이터 범위로 설정
		    options:{ 
		    	   scales: { 
		    	    yAxes : [{ 
		    	     ticks : { 
		    	      max : Number(dataArr[dataArr.length-1].y) + 20,  
		    	      min : Number(dataArr[dataArr.length-1].y) - 20
		    	     } 
		    	    }] 
		    	} 
		    } 
		});
	}
	
</script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<!-- Content -->
<section>
	<div class="container">
	<form id="exercisePlan" name="exercisePlan">
		<table>
			<tr>
				<td>
					<div id="calendar" width="1280" height="720">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<canvas id="myChart" width="500px" height="350px"></canvas>
				</td>
			</tr>		
		</table>
	</form>
<%
	}else{
%>
		<script>
			alert("로그인이 만료 되었습니다. 다시 로그인 해주세요");
			location.href="loginForm.spo";
		</script>
<%		
	}
%>
</div>
</section>
<%@include file="../common/footer.html" %>
</body>
</html>