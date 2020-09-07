<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="kosmo62.spomatch.workout.vo.SpoWorkoutVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>운동량 입력</title>
<link rel="stylesheet" href="css/workout/exerciseInfo.css">
<script type="text/javascript">
	$(document).ready(function(){
		 $("#swo_workoutdate").datepicker();
		 $("#swo_workoutdate").datepicker("option","dateFormat","yy/mm/dd");
		 
		 $("#addExercise").click(function(){
			 $("#exerciseForm").attr({
				"method" : "post",
				"enctype" : "application/x-www-form-urlencoded",
				"action" : "insertWorkout.spo"
			 }).submit();
		 });
	});
</script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<!-- Content -->
<section>
	<div class="container">
	<%
		Object obj = request.getAttribute("exerciseInfo");
		if(obj != null){
			List<SpoWorkoutVO> list = (List<SpoWorkoutVO>)obj;
			if(list != null && list.size() > 0){
				for(int i=0; i<list.size(); i++){
					SpoWorkoutVO swVO = (SpoWorkoutVO)list.get(i);
					System.out.println("exerciseInfo data >>> "+swVO.getSes_no());
					System.out.println("exerciseInfo data >>> "+swVO.getSes_name());
					System.out.println("exerciseInfo data >>> "+swVO.getSes_img());
					System.out.println("exerciseInfo data >>> "+swVO.getSes_explain());
	%>
		<form id="exerciseForm" name="exerciseForm">
			<div class="exercise-content form-group">
			<div>
				<h2><%= swVO.getSes_name() %></h2>
				<hr class="divider">
			</div>
			<input type="hidden" id="swo_name" name="swo_name" value="<%=swVO.getSes_name() %>"/>
			
				<div width="600" height="600">
					<img src="img/exercise/<%=swVO.getSes_img() %>" width="600" height="600"/>					
				</div>
				<p class="item-info">
					<%=swVO.getSes_explain() %>
				</p>
				<div class ="fields">
					<div class="exercise-item-box col-xs-3">
						<div class="exercise-item">
							<label class="exercise-item-name"><h6>중량</h6></label>
							<div><input type="text form-group" id="swo_weight" name="swo_weight" class="form-control" /> kg</div>
						</div>
						<div class="exercise-item col-xs-3">
							<label class="exercise-item-name"><h6>세트</h6></label>
							<div><input type="text form-group" id="swo_sets" name="swo_sets" class="form-control" /> sets</div>
						</div>
						<div class="exercise-item col-xs-3">
							<label class="exercise-item-name"><h6>횟수</h6></label>
							<div><input type="text form-group" id="swo_count" name="swo_count" class="form-control" /> 회</div>
						</div>
						<div class="exercise-item col-xs-3">
							<label class="exercise-item-name"><h6>날짜</h6></label>
							<input type="text form-group" id="swo_workoutdate" name="swo_workoutdate" class="form-control" />	
						</div>
					</div>
				</div>
				<div align="center ">
					<input type="button" class="btn btn-primary" id="addExercise" name="addExercise" value="입력">
					<input type="button" class="btn btn-default" id="goBack" name="goBack" value="취소" onclick="history.go(-1)">
				</div>
			</div>
		</div>
	</form>
	<%
				}
			}else{
				
			}
		}else{
			
		}	
	%>
	</div>
</section>
<%@ include file="../common/footer.html" %>
</body>
</html>