<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="kosmo62.spomatch.answer.vo.SpoAnswerVO" %>
<%@ page import="kosmo62.spomatch.question.vo.SpoQuestionVO" %>

<%
	String siq_no = request.getParameter("siq_no");
	System.out.println("siq_no >> : " + siq_no);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>댓글</title>
	<!-- css -->
	<link rel="stylesheet" href="css/question/questionAnswer.css" type="text/css">
	<script type="text/javascript">
	
		var siq_no = "<%=siq_no%>";
		console.log('siq_no >> : ' + siq_no);
		
		$(document).ready(function(){
			// 댓글전체목록 호출 함수 불러오기
			callListAnswer();
			// 댓글 등록 함수
			insertAnswer();
			//등록 댓글 글자수 제한 함수
			contentTextLeng();
			
			// 댓글 수정 버튼 클릭 후 수정폼 출력 이벤트
			$(document).on("click","#updateForm_btn",function(){
				console.log('수정버튼 클릭!');
				
				//기존 댓글 내용 불러오기(saw_content)
				//tr태그-> 자식태그(td) -> 자식태그(p)의 1번째 인덱스에 해당하는 요소 선택 -> html()를 통해 해당내용을 가져옴.
				var saw_content = $(this).parents("tr").children().children().children().eq(1).html();
				console.log(saw_content);
				
				// 수정버튼, 삭제버튼 숨기기
				$(this).parents("tr").find("input[type='button']").hide();
				
				// 댓글정보 데이터 가져오기(info_p)
				var info_p = $(this).parents("tr").children().children().children().eq(0).html();
				console.log(info_p);
				
				// 댓글내용 출력되던 saw_content_p 영역
				var saw_content_p = $(this).parents("tr").children().children().children().eq(1);
				console.log(saw_content_p);
				saw_content_p.html("");
				
				// 댓글 수정폼 데이터 뿌려셔 출력
				var count = '###';
				var data = "<textarea name='saw_contentUp' id='saw_contentUp' class='saw_contentUp' maxlength='300' placeHolder='수정하실 댓글을 입력해주세요.'>" + saw_content + "</textarea>";
				data += "<input type='button' id='update_btn' value='등록'/>";				
				data += "<input type='button' id='updateReset_btn' value='취소'>";
				data += "<span class='counterUp'>"+"</span>";
				console.log('data >> : ' + data);
				
				saw_content_p.html(data);
				console.log('수정폼 등록 완료!!!');
				
				//수정 댓글 글자수 제한 함수
				contentUpTextLeng();
				console.log('글자 제한 함수 준비!');
			});// end of 댓글 수정 버튼 클릭 후 수정폼 출력 이벤트
			
			// 수정 취소 버튼 클릭 이벤트
			$(document).on("click", "#updateReset_btn", function(){
				console.log('수정 취소 버튼 클릭!');
				
				var saw_content = $(this).parents("tr").find("textarea").html();
				console.log('수정 취소 버튼 saw_content >> : ' + saw_content);
				$(this).parents("tr").find("input[type='button']").show();
				var saw_content_p = $(this).parents("tr").children("td").children("div").children("p").eq(1);
				saw_content_p.html(saw_content);
			});// end of 수정 취소 버튼 클릭 이벤트 - 수정폼
			
			//수정 등록 버튼 클릭 이벤트
			$(document).on("click", "#update_btn", function(){
				console.log('댓글 수정 완료 버튼 클릭!!');
				
				console.log('수정버튼 siq_no >> : ' + siq_no);
				var saw_no = $(this).parents("tr").attr("data-saw_no");
				console.log('수정버튼 saw_no >> : ' + saw_no);
				var saw_content = $("#saw_contentUp").val();
				console.log('수정버튼 saw_content >> : ' + saw_content);
				var urlVal = "/spoMatch/answer/updateAnswer.spo";
				console.log('수정버튼 urlVal >> : ' + urlVal);
				var typeVal = "POST";
				console.log('수정버튼 typeVal >> : ' + typeVal);
				var dataType = "HTML";
				console.log('수정버튼 dataType >> : ' + dataType);
				var dataVal = {siq_no:siq_no,
						  	   saw_no:saw_no,
						  	   saw_content:saw_content};
				console.log('수정버튼 data >> : ' + dataVal);
				
				$.ajax({
					url: urlVal,
					type: typeVal,
					dataType: dataType,
					data: dataVal,
					success: whenSuccess,
					error: whenError
				});// end of 댓글 수정 ajax
				
				function whenSuccess(updateAnswer){
					console.log('댓글 수정 ajax 성공!! >> updateAnswer >> : ' + updateAnswer);
					var saw_contentUp = $("#saw_contentUp").parents("tr").find("textarea").html();
					console.log('이게되나? saw_contentUp >> : ' + saw_contentUp);
					
					//수정한 댓글 목록 호출
					callListAnswer();
				}
				
				function whenError(request, status, error){
					alert('댓글 수정에 실패했습니다.');
	            	alert('code='+request.status+" message=" + request.responseText + " error=" + error);
				}
			});
			
			
			/*===================댓글삭제========================*/
			// 댓글 삭제 버튼 클릭 후 이벤트
			$(document).on("click","#delete_btn",function(){
				console.log('삭제버튼 클릭!');
				
				var saw_no = $(this).parents("tr").attr("data-saw_no");
				
				var urlVal = "/spoMatch/answer/deleteAnswer.spo";
				console.log("삭제버튼 클릭! deleteAnswer >> : " + urlVal);
				var typeVal = "POST";
				console.log("삭제버튼 클릭! deleteAnswer >> : " + typeVal);
				var dataVal = {saw_no: saw_no, siq_no: siq_no};
				console.log("삭제버튼 클릭! deleteAnswer >> : " + dataVal);
				var dataType = "HTML";
				console.log("삭제버튼 클릭! deleteAnswer >> : " + dataType);
				
				if(confirm("댓글을 삭제하시겠습니까?")){
					
					$.ajax({
						url: urlVal,
						type: typeVal,
						dataType: dataType,
						data: dataVal,
						success: whenSuccess,
						error: whenError
					});//end of ajax
					
					function whenSuccess(deleteResult){
						console.log("댓글 삭제를 성공했습니다.");
						console.log("댓글 삭제 성공 ajax >> : deleteAnswer >> : " + deleteResult);
						
						//댓글 전체목록 출력
						callListAnswer();
					}
					function whenError(request, status, error){
						console.log("댓글 삭제를 실패했습니다.");	
						alert('code = ' + request.status + "message = " + request.responseText + "error = " + error);
					}
					
				}// end of if confirm
				
			});// end of 댓글 삭제 버튼 클릭 후 이벤트
			
		}); // end of document ready
		
		
		//댓글 등록 함수
		function insertAnswer(){
			// 등록버튼 클릭 이벤트
			$("#insert_btn").click(function(){
				console.log("댓글등록버튼 클릭!");
				console.log('siq_no >> : ' + siq_no);
				
				var saw_content = $("#saw_content").val();
				var urlVal = "/spoMatch/answer/insertAnswer.spo";
				console.log(urlVal);
				var dataVal = {
							   siq_no : siq_no, 
							   saw_content : saw_content};
				console.log(dataVal);
				var typeVal = "POST";
				console.log(typeVal);
				
				if(saw_content == null || saw_content == ""){
					alert('내용을 입력해주세요.');
				}else{
					$.ajax({
						url: urlVal,
						type: typeVal,
						data: dataVal,
						dataType: "HTML",
						success: whenSuccess,
						error: whenError
						
					});// end of ajax
				} 
				// ajax 댓글 등록 성공 알림 & 댓글 등록 후 입력 데이터 초기화 & 등록한 댓글만 출력 
				function whenSuccess(insertResult){
				console.log('댓글 등록 ajax 성공 >> insertResult >> : ' + insertResult);
					//입력 데이터 초기화 함수
					dataReset();
					
					//댓글 전체 목록 호출
					callListAnswer();

				}
				// ajax 댓글 등록 실패 알림 함수 
				function whenError(request, status, error){
					alert('댓글 등록에 실패했습니다.');
					alert('code='+request.status+" message=" + request.responseText + " error=" + error);
				}
				
			}); // end of 등록버튼 클릭 이벤트
		}//end of 댓글 등록 함수
		
		// 댓글 전체 목록 호출 함수
		function callListAnswer(){
			console.log('callListAnswer 함수 호출!');
			console.log('siq_no : ' + siq_no);
			$("#replyList_ul").html("");
			
			var urlVal = "/spoMatch/answer/listAnswer.spo";
			console.log('urlVal >>> : ' + urlVal);
			var dataVal = {siq_no: siq_no};
			console.log('dataVal >>> : ' + dataVal);
			var typeVal = "POST";
			console.log('typeVal >>> : ' + typeVal);
			
			$.ajax({
				url: urlVal,
				type: typeVal,
				data: dataVal,
				dataType:"JSON",
				success:whenSuccess,
				error:whenError
			});// end of ajax
			
			function whenSuccess(map){
				console.log('댓글전체목록조회 ajax 성공 >>> ' + map.listAnswer);
				var listAnswer = map.listAnswer;
				console.log('success listAnswer >> : ' + listAnswer);
				addNewAnswer(listAnswer);
			}
			function whenError(){
				alert('댓글전체목록 조회 ajax 실패');
			}
		} // end of 댓글 전체 목록 호출 함수
		
		
		//등록 댓글 글자수 제한 함수
		function contentTextLeng(){
			$('.saw_content').keyup(function(e){
				var content = $(this).val();
				$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
				$('.counter').html(content.length + '/300');
			});
			
			$('.saw_content').keyup();
			
		}// end of 글자수 제한 함수
		
		// 수정 댓글 글자수 제한 함수
		function contentUpTextLeng(){
			$('.saw_contentUp').keyup(function(e){
				var contentUp = $(this).val();
				$(this).height(((contentUp.split('\n').length + 1) * 1.5) + 'em');
				$('.counterUp').html(contentUp.length + '/300');
			});
			
			$('.saw_contentUp').keyup();
		}//end of 수정 댓글 글자수 제한 함수
		
		//입력 데이터 초기화 함수
		function dataReset(){
			$("#saw_content").val("");
		}// end of 입력 데이터 초기화 함수
		
		// 댓글 목록 TAG 조립 함수
		function addNewAnswer(listAnswer){
			console.log('addNewAnswer 함수 호출! >> 조회된 댓글 갯수 listAnswer.length : ' + listAnswer.length);
			console.log('listAnswer >> : ' + listAnswer);

			for(var i=0; i<listAnswer.length; i++){
				var saw_no = listAnswer[i].saw_no;
				var saw_content = listAnswer[i].saw_content;
				var saw_deleteyn = listAnswer[i].saw_deleteyn;
				var saw_insertdate = listAnswer[i].saw_insertdate;
				var saw_updatedate = listAnswer[i].saw_updatedate;
				var siq_no = listAnswer[i].siq_no;
				
				console.log('listAnswer['+i+'] >> : 댓글번호: ' + saw_no + ', 댓글내용: ' + saw_content + ', 댓글삭제여부: ' + saw_deleteyn + ', 댓글입력일: ' + saw_insertdate + ', 댓글수정일: ' + saw_updatedate + ', 게시글번호: ' + siq_no);
				
				// 새 댓글 추가할 li태그 객체
				var newRe_li = $("<tr>");
				newRe_li.attr("data-saw_no", saw_no);
				newRe_li.attr("data-siq_no", siq_no);
				
				var newRe_td = $("<td>");
				newRe_td.addClass("first");
				newRe_td.addClass("last");
				var newRe_div = $("<div>");
				//newRe_div.addClass("bytes-wrapper")
				
				// 작성정보가 출력될 <p>태그
				var info_p = $("<p>");
				info_p.addClass("marT5 marL5 marB5");
				
				// 댓글번호
				var num_span = $("<span>");
				num_span.addClass("bold");
				num_span.html("댓글 번호: " + i+1);
				
				// 내용
				var saw_content_p = $("<p>");
				saw_content_p.addClass("marT5 marL5 marB5");
				saw_content_p.html(saw_content);
				
				//삭제여부
				/*var saw_deleteyn_span = $("<span>");
				saw_deleteyn_span.addClass("marL6");
				saw_deleteyn_span.html(saw_deleteyn);*/
					
				// 작성일
				var saw_insertdate_span = $("<span>");
				saw_insertdate_span.addClass("marL10");
				saw_insertdate_span.html("작성일: " + saw_insertdate);
				
				//수정일
				var saw_updatedate_span = $("<span>");
				saw_updatedate_span.addClass("marL15");
				saw_updatedate_span.html("수정일: " + saw_updatedate);
				
				//수정폼 출력버튼
				var updateForm_btn_input = $("<input>");
				updateForm_btn_input.attr({"type":"button","id":"updateForm_btn","value":"수정"});
				updateForm_btn_input.addClass("reply_btn");
				
				//삭제 버튼
				var delete_btn_input = $("<input>");
				delete_btn_input.attr({"type":"button","id":"delete_btn","value":"삭제"});
				delete_btn_input.addClass("reply_btn");
				
				//조립하기
				$("#replyList_ul").append(newRe_li);
				newRe_li.append(newRe_td);
				newRe_td.append(newRe_div);
				newRe_div.append(info_p);
				info_p.append(num_span).append(saw_insertdate_span).append(saw_updatedate_span).append(updateForm_btn_input).append(delete_btn_input);
				newRe_div.append(info_p).append(saw_content_p);
				/*.append(saw_deleteyn) 삭제여부 출력뺌*/
			}
		}// end of 댓글 목록 TAG 조립 함수
	</script>
</head>
<body>
	<div class="table_wrap" style="padding-bottom: 141px;">
			<!-- 댓글 출력폼 -->
			<table class="reply_list_wrap" style="width:98%">
				<tbody id="replyList_ul">
				
					<!-- 동적생성요소 댓글리스트 들어갈 자리 -->	
		
				</tbody>
			</table>
		<form id="replyInsertForm">
			<table class="reply_insert_wrap" style="width: 98%">
				<tr class="marT5 marL5 marB5">
					<td>
						<div class="bytes-wrapper">
							<textarea name="saw_content" id="saw_content" class="saw_content" maxlength="300" placeHolder="댓글을 입력해주세요."></textarea>
							<span class="counter"></span>
							<input type="button" class="blue_btn" id="insert_btn" value="등록" style="vertical-align:middle;"/>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>