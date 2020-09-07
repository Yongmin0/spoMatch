<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="kosmo62.spomatch.diet.vo.SpoDietVO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<title>입력</title>
		<link rel="stylesheet" href="css/workout/weightinsertForm.css">
		<script type="text/javascript">
		$(document).ready(function(){
			$("#insertWeight").click(function(){
				$("#weightForm").attr({
					"method":"post",
					"enctype":"application/x-www-form-urlencoded",
					"action":"/spoMatch/insertWeightWorkout.spo"
				}).submit();		
			});
		});
		</script>
	</head>
	<body>
	<%@include file="../common/header.jsp" %>
	<section>
		<div class="container">
		<%
			Object obj = request.getAttribute("weightList");
			System.out.println("obj >>> "+obj);
			if(obj != null){
				List<SpoDietVO> list = (List<SpoDietVO>)obj;
				System.out.println("list >>> "+list);	
				if(list != null && list.size() > 0){
					for(int i=0; i<list.size(); i++){
						SpoDietVO sdVO =  (SpoDietVO)list.get(i);
						String height = sdVO.getSmb_height();
						String weight = sdVO.getSmb_weight();
						String g_weight = sdVO.getSmb_g_weight();
						String activity = sdVO.getSmb_activity();
						String dailycal = sdVO.getSmb_dailycal();
						
						Boolean bool = height != null && height.length() > 0;
						Boolean bool2 = weight != null && weight.length() > 0;
						Boolean bool3 = g_weight != null && g_weight.length() > 0;
						Boolean bool4 = activity != null && activity.length() > 0;
						Boolean bool5 = dailycal != null && dailycal.length() > 0;
						Boolean bool6 = bool && bool2 && bool3 && bool4 && bool5;
						System.out.println("bool6 >>>"+bool6);
						
						if(bool6){
							response.sendRedirect("/spoMatch/workoutMain.spo");		
						}else{
		%>
				<div class="weight-content">
					<h2 class="weight-content col-lg-8 text-center">신체 정보 입력</h2>
					<hr class="divider">
					<div class="weight_insertDiet" style="text-align:-webkit-center;">
						<form id="weightForm" name="weightForm">
						<input type="hidden" id="smb_no" name="smb_no" value="<%=sdVO.getSmb_no()%>"/>
							<table>
								<tr>
									<th>키</th>
									<td>
										<input type="text" id="smb_height" name="smb_height">
									</td>
								</tr>
								<tr>
									<th>체중</th>
									<td>
										<input type="text" id="smb_weight" name="smb_weight">
									</td>
								</tr>
								<tr>
									<th>목표체중</th>
									<td>
										<input type="text" id="smb_g_weight" name="smb_g_weight">
									</td>
								</tr>
								<tr>
									<th>활동지수</th>
									<td>
									<select id="smb_activity" name="smb_activity">
										<option value="25">앉아서 하는 일</option>
										<option value="30">서서 하는 일</option>
										<option value="35">활동량이 많은 일</option>
										<option value="40">운동선수, 농사등 활동량이 많은 일</option>
									</select>
									</td>
								</tr>
	                        </table>
							<a class="btn btn-primary btn-xl js-scroll-trigger" id="insertWeight" name="insertWeight" href="#">입력</a>
						</form>
					</div>
				</div>
		<%					
						}
					}
				}	
			}
		%>
			</div>
		</section>
		<%@include file="../common/footer.html" %>
	</body>
</html>