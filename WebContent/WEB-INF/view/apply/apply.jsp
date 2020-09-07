<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kosmo62.spomatch.apply.vo.SpoApplyVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Maching 신청</title>
<link rel="stylesheet" type="text/css" href="css/apply/apply.css" />
<script type="text/javascript">
	$(document).ready(function() {
		/* ============ 신청 버튼 클릭시 =============== */
		$("#applyMatchBtn").click(function(){
			$("#viewApplyForm").attr({
				"method":"post",
				"enctype":"application/x-www-form-urlencoded",
				"action":"/spoMatch/applyMatch.spo"
			}).submit();
		});
		$("#cancelApplyBtn").click(function(){
			$("#viewApplyForm").attr({
				"method":"post",
				"enctype":"application/x-www-form-urlencoded",
				"action":"/spoMatch/listMatch.spo"
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
	Object obj = request.getAttribute("spoApplyVO");
	if(obj != null){
	SpoApplyVO svo = (SpoApplyVO)obj;
%>
		<h1>매칭 신청</h1>
		<form id="viewApplyForm">
			<input type="hidden" name="smc_no" id="smc_no" value="<%=svo.getSmc_no() %>" />
			<div class="card">
			<table>
				<tr>
					<td>
						<div class="form-group">
							<label class="form-label">제목<span class="form-required">*</span></label>
    						<input type="text" class="form-control" name="sap_subject" id="sap_subject">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label class="form-label">지역(거주지)<span class="form-required">*</span></label>
							<select class="form-control" name="sap_area" id="sap_area">
								<option value="00">-</option>
								<option value="01">서울</option>
								<option value="02">경기</option>
								<option value="03">인천</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label class="form-label">간단 소개<span class="form-required">*</span></label>
							<textarea rows="25" cols="100" class="form-control" name="sap_introduce" id="sap_introduce"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="button" class="btn btn-1 btn-primary" value="신청" id="applyMatchBtn" name="applyMatchBtn"/>
						<input type="button" class="btn btn-1 btn-neutral" value="취소" id="cancelApplyBtn"/>
					</td>
				</tr>
			</table>
			</div>
		</form>
	<% } %>
	</div>
</section>
<%@include file="../common/footer.html" %>
</body>
</html>