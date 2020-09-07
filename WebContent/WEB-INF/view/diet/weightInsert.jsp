<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="kosmo62.spomatch.diet.vo.SpoDietVO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>입력</title>
		<script type="text/javascript">
		$(document).ready(function(){
			$("#insertWeight").click(function(){
				$("#weightForm").attr({
					"method":"post",
					"enctype":"application/x-www-form-urlencoded",
					"action":"/spoMatch/insertWeight.spo"
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
							response.sendRedirect("/spoMatch/listDiet.spo");		
						}else{
		%>
				<div>
					<form id="weightForm" name="weightForm">
					<input type="hidden" id="smb_no" name="smb_no" value="<%=sdVO.getSmb_no()%>"/>
						<table>
							<tr>
								<td>키 : </td>
								<td>
									<input type="text" id="smb_height" name="smb_height">
								</td>
							</tr>
							<tr>
								<td>체중 : </td>
								<td>
									<input type="text" id="smb_weight" name="smb_weight">
								</td>
							</tr>
							<tr>
								<td>목표체중 : </td>
								<td>
									<input type="text" id="smb_g_weight" name="smb_g_weight">
								</td>
							</tr>
							<tr>
								<td>활동지수 : </td>
								<td>
								<select id="smb_activity" name="smb_activity">
									<option value="25">앉아서 하는 일</option>
									<option value="30">서서 하는 일</option>
									<option value="35">활동량이 많은 일</option>
									<option value="40">운동선수, 농사등 활동량이 많은 일</option>
								</select>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="button" id="insertWeight" name="insertWeight" value="입력">
								</td>
							</tr>
						</table>
					</form>
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