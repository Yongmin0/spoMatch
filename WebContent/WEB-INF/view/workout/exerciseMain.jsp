<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exercise Main</title>
<style type="text/css">
	.img_class{
		width : 100px;
		height: 100px;
	}
	.text_class{
		width : 500px;
		height: 100px;
		text-align : center;
	}
	.exercise_main{
		 position:absolute;
		 top:50%;
		 left:50%;
		 transform:translate(-50%, -50%);
	}
</style>
</head>
<body>
<%@include file="../common/header.jsp" %>
<!-- Content -->
<section>
	<div class="container">
		<div class="exercise_main">
			<table>
				<tr>
					<td>
						<div class="img_class">
							<img src="img/point/chest_point.png" width="100" height="100">
						</div>
					</td>
					<td>
						<a href="selectExercise.spo?ses_no=01">
						<div class="text_class">
							<h3><b>가슴</b></h3>				
						</div>
						</a>
					</td>
				</tr>
				<tr>
					<td>
						<div class="img_class">
							<img src="img/point/back_point.png" width="100" height="100">
						</div>
					</td>
					<td>
						<a href="selectExercise.spo?ses_no=02">
						<div class="text_class">
							<h3><b>등</b></h3>				
						</div>
						</a>
					</td>
				</tr>
				<tr>
					<td>
						<div class="img_class">
							<img src="img/point/shoulder_point.png" width="100" height="100">
						</div>
					</td>
					<td>
						<a href="selectExercise.spo?ses_no=03">
						<div class="text_class">
							<h3><b>어깨</b></h3>				
						</div>
						</a>
					</td>
				</tr>
				<tr>
					<td>
						<div class="img_class">
							<img src="img/point/abs_point.png" width="100" height="100">
						</div>
					</td>
					<td>
						<a href="selectExercise.spo?ses_no=04">
						<div class="text_class">
							<h3><b>복근</b></h3>				
						</div>
						</a>
					</td>
				</tr>
				<tr>
					<td>
						<div class="img_class">
							<img src="img/point/arm_point.png" width="100" height="100">
						</div>
					</td>
					<td>
						<a href="selectExercise.spo?ses_no=05">
						<div class="text_class">
							<h3><b>팔</b></h3>				
						</div>
						</a>
					</td>
				</tr>
				<tr>
					<td>
						<div class="img_class">
							<img src="img/point/leg_point.png" width="100" height="100">
						</div>
					</td>
					<td>
						<a href="selectExercise.spo?ses_no=06">
						<div class="text_class">
							<h3><b>하체</b></h3>				
						</div>
						</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	</section>
<%@ include file="../common/footer.html" %>
</body>
</html>