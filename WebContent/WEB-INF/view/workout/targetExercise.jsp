<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="kosmo62.spomatch.workout.vo.SpoWorkoutVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		.img_exercise{
			width : 100px;
			height: 100px;
		}
		.text_exercise{
			width : 500px;
			height: 100px;
			text-align : center;
		}
		.target_exercise{
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
		<div class="target_exercise">
		<%
			Object obj = request.getAttribute("exercise");
			if(obj != null){
				List<SpoWorkoutVO> list = (List<SpoWorkoutVO>)obj;
				if(list != null && list.size() > 0){
					for(int i=0; i<list.size(); i++){
						SpoWorkoutVO swVO = (SpoWorkoutVO)list.get(i);
						System.out.println("swVO >>> "+swVO.getSes_no());
						System.out.println("swVO >>> "+swVO.getSes_name());
						System.out.println("swVO >>> "+swVO.getSes_img());
						System.out.println("swVO >>> "+swVO.getSes_explain());
		%>
			<table>
				<tr>
					<td>
						<div class="img_exercise">
							<img src="img/exercise/<%=swVO.getSes_img()%>" width="100" height="100">
						</div>
					</td>
					<td>
						<a href="exerciseInfo.spo?ses_name=<%=swVO.getSes_name()%>">
						<div class="text_exercise">
							<h3><b><%=swVO.getSes_name() %></b></h3>				
						</div>
						</a>
					</td>
				</tr>
			</table>
		<%
					}
				}
			}
		%>
		</div>
	</div>
	</section>
<%@include file="../common/footer.html" %>
</body>
</html>