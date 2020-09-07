<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kosmo62.spomatch.apply.vo.SpoApplyVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>신청서 수정</title>
<link rel="stylesheet" type="text/css" href="css/apply/updateApply.css" />
<% SpoApplyVO param =(SpoApplyVO)request.getAttribute("spoApplyVO"); %>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#sap_area').val("<%=param.getSap_area() %>");
			$('#updateApplyBtn').click(function() {
				$("#updateForm").attr({
					"method":"post",
					"enctype":"application/x-www-form-urlencoded",
					"action":"/spoMatch/updateApply.spo"
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
	<h1>신청서 수정</h1>
	<form id="updateForm">
		<input type="hidden" id="smc_no" name="smc_no" value="<%=svo.getSmc_no() %>">
		<input type="hidden" id="sap_acceptyn" name="sap_acceptyn" value="<%=svo.getSap_acceptyn() %>">
		<div class="card">
			<table class="updateMatchTable">
				<tr>
					<td>
						<div class="form-group">
							<label class="form-label">신청번호</label>
							<input type="text" class="form-control" id="sap_no" name="sap_no" value="<%=svo.getSap_no() %>" readonly>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label class="form-label">아이디</label>
							<input type="text" class="form-control" name="smb_id" id="smb_id" value="<%=svo.getSmb_id()%>" readonly>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label class="form-label">제목<span class="form-required">*</span></label>
							<input type="text" class="form-control" name="sap_subject" id="sap_subject" value="<%=svo.getSap_acceptyn()%>">
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
							<textarea rows="25" cols="100" class="form-control" name="sap_introduce" id="sap_introduce"><%=svo.getSap_introduce() %></textarea>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div align="center">
			<input class="btn btn-1 btn-primary" type="button" value="수정" id="updateApplyBtn"/>
			<input class="btn btn-1 btn-neutral" type="button" value="취소" id="cancelBtn"/>
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