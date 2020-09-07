<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kosmo62.spomatch.chat.vo.SpoChatVO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>채팅</title>
<link rel="stylesheet" type="text/css" href="css/chat/chat.css" />
<script type="text/javascript">

	$(document).ready(function(){
		
		setInterval(listChat,2000);
		setInterval(getChatList,2000);
		//listChat();

		
		/* 채팅목록 클릭 시 해당 채팅방으로 이동 */
		$(document).on("click",".main-list-item-box",function(){
			$(".header-chat-subject").text($(this).find(".list-item-subject").text());
			$("#smc_no").val($(this).find(".chatNUM").val());
			getChatList();
		});
		
		/* 보내기 버튼 클릭 시 함수 실행 */
		$("#sendBtn").click(function() {
			insertChat();
		});
		
		/* 엔터키 입력 시 입력 함수 실행 */
		$("#sch_chat").keypress(function(event) {
			var kcode = event.keyCode;
			if(kcode =='13'){
				insertChat();
			}
		});
		
	});

	/* ============================= 채팅 리스트 불러오기 함수 ================================== */
	function listChat() {
		
		var urlVal = "listMatchChat.spo";
		console.log("urlVal >>> : " + urlVal);
		var typeVal = "POST";
		console.log("typeVal >>> : " + typeVal);
		var dataVal = {
			sch_resiver : "<%=String.valueOf(session.getAttribute("smb_no")) %>"
		};
		
		$.ajax({
			url : urlVal,
			type : typeVal,
			data : dataVal,
			success: listSuccess,
			error : listError
		});
		// success 시 호출 함수
	};
	function listSuccess(data) {
		
		var chatList = "";
		var countInt = 0;  //전체 안읽은 갯수 카운트 변수
		
		//오늘날짜  설정하는 구문
		var toDay = new Date;
		var todayVal;
		if(String((toDay.getMonth() + 1)).length == 1){
			todayVal = toDay.getFullYear() + "-0" +String(toDay.getMonth() + 1) + "-" +toDay.getDate();
		}else{
			todayVal = toDay.getFullYear() + "-" +String(toDay.getMonth() + 1) + "-" +toDay.getDate();
		}
		
		//채팅목록을 구현
		for(var i = 0 ; i < data.length; i++){
			countInt += parseInt(data[i].sch_checkcnt);
			if((data[i].smc_no) ==  $("#smc_no").val()){
				chatList +="<div class='main-list-item-box isActive'>";
			}else{
				chatList +="<div class='main-list-item-box'>";
			}
			chatList +="<input type='hidden' class='chatNUM' value="+ data[i].smc_no +" />";
			chatList +="<div class='list-item-image'><i class='far fa-user-circle fa-3x'></i></div>";
			chatList +="<div class='list-item-about'>";
			chatList +="<p class='list-item-id'>"+ data[i].smb_id +"</p>";
			chatList +="<p class='list-item-subject'>"+ data[i].smc_subject +"</p>";
			chatList +="<p class='list-item-chat'>"+ data[i].sch_chat +"</p>";
			chatList +="</div>";
			chatList +="<div class='list-item-right'>";
			
			if(todayVal == data[i].sch_insertdate){
				chatList +="<div class='list-item-date'>"+ data[i].sch_inserttime +"</div>";
			}else{
				chatList +="<div class='list-item-date'>"+ data[i].sch_insertdate +"</div>";
			}
			if(data[i].sch_checkcnt != '0'){
				chatList +="<span class='list-item-count'>"+ data[i].sch_checkcnt +"</span>";
			}
			chatList +="</div></div>";
		}
		$(".main-list-Box").empty();
		$(".main-list-Box").append(chatList);
		$("#countAll").text(countInt);
		$(".nav-chat-badge").text(countInt);
	}
	
	function listError(){
		alert("3");
	}

	/* ============================= 채팅 보내는 함수 구현 ================================== */
	function insertChat() {
		console.log("insertChat >>>");
		
		// 메세지가 입력되지 않았을 경우
		if($("#sch_chat").val().length == 0){
			alert("메세지를 입력해주세요!!");
			return;
		}
		var urlVal = "sendChat.spo";
		console.log("urlVal >>> : " + urlVal);
		var typeVal = "POST";
		console.log("typeVal >>> : " + typeVal);
		var dataVal = {
				sch_chat: $("#sch_chat").val(),
				smc_no : $("#smc_no").val(),
				smb_no : "<%=String.valueOf(session.getAttribute("smb_no")) %>",
		};
		console.log("dataVal >>> : " + dataVal);	
		
	
		$.ajax({
			url : urlVal,
			type : typeVal,
			data : dataVal,
			success: function(data){
				if(data == 'ok'){
					alert(">>>>>>>>");
					$('#sch_chat').val("");
					$("#sch_chat").focus();
				}
				getChatList();
			},
		});
	}
	
	/* ================================== 채팅 내용 불러오는 함수 ================================== */
	function getChatList(){
		
			var urlVal = "selectChat.spo";
			console.log("urlVal >>> : " + urlVal);
			var typeVal = "POST";
			console.log("typeVal >>> : " + typeVal);
			var dataVal = {
				smc_no: $("#smc_no").val(),
			};
			console.log("dataVal >>> : " + dataVal);	
		$.ajax({
			url : urlVal,
			type : typeVal,
			data : dataVal,
			success : selectSuccess,
			error : selectError
		});
	}
	function selectSuccess(data) {
		
		// 채팅방 제목 불러와서 설정
		$(".header-chat-subject").text(data[0].smc_subject);
		
		var messageContent = "";
		for(var i = 0; i <data.length; i++){
			// 채팅 날짜가 다를 경우 날짜를 표시 영역 생성
			if(i == 0 || (i > 0 && data[i-1].sch_insertdate != data[i].sch_insertdate)){
				messageContent += "<div class='message-date-check'><span>" + data[i].sch_insertdate + "</span></div>";
			}
			// 불러온 채팅 내용의 받는이가 현재 접속한 회원 no일 경우
			if(data[i].sch_resiver == "<%=String.valueOf(session.getAttribute("smb_no")) %>"){
				messageContent += "<div class='messages'>";
				messageContent += "<div class='messages-photo'><i class='far fa-user-circle fa-3x'></i></div>";
				messageContent += "<div class='messages-about'>";
				messageContent += "<p class='messages-id'>" + data[i].smb_id + "</p>";
				messageContent += "<p class='messages-text'>" + data[i].sch_chat + "</p>";
				messageContent += "</div>"
				messageContent += "<div class='messages-time time'>" + data[i].sch_inserttime + "</div>";
				messageContent += "</div>";
			}else{
				messageContent += "<div class='messages text-only'>";
				messageContent += "<div class='response'>";
				messageContent += "<div class='response-time time'>" + data[i].sch_inserttime + "</div>";
				messageContent += "<p class='messages-text'>" + data[i].sch_chat + "</p>";
				messageContent += "</div>";
				messageContent += "</div>";
			}
		}

		$(".chat_group").empty();
		$(".chat_group").append(messageContent);
		$(".main-chat").scrollTop($(".main-chat")[0].scrollHeight);
	}		
	
	function selectError(){
		alert("4");
	}
	
</script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<!-- Content -->
<section>
	<div class="container">
		<input type="hidden" id="smc_no" name="smc_no" />
		<h1>매칭 채팅</h1>
		 <!-- 대화 목록 리스트 -->
		 <div class="list-Area">
			<div class="match-list" id="match-list">
				<div class="header-list">
					<div class="searchChat1">
						<div clss="selectAll">
							<i class="far fa-comments fa-3x"></i>
							<p>전체</p>
						</div>
						<div class="notCheckAll">
							<p id="countAll"></p>
							<p>미확인</p>
						</div>
					</div>
				</div>
				<div class="main-list" id="main-list">
					<div class="main-list-Box"></div>
				</div>
				<div class="footer-list">
					<div class="right_area">
						<label for="all-delete" class="_delete_action_ui hide"> <!-- [D] 체크가 안되어있으면 class="hide" 추가 1개 이상 체크되면 class="hide" 제거 -->
							<a href="#" class="button_txt_delete" role="button" data-event="DELETE_MARKED_NOTIS"><strong class="_delete_target_count">3개</strong> 삭제하기</a>
							<span class="bar_vertical"></span>
						</label>
						<a href="#" class="button_txt_cancel _delete_mode_ui hide" role="button" data-event="DELETE_MODE_OFF">취소</a>
						<a href="#" class="button_delete _delete_mode_on_button" role="button" data-event="DELETE_MODE_ON">
							<i class="far fa-trash-alt fa-2x" aria-label="삭제"></i>
				            <span class="blind" role="alert">대화목록에서 선택해주세요</span>
			        	</a> 
				    </div>
				    <span class="footer-border_top"></span>
				</div>
			</div>
		</div>
		<!-- 채팅 내역 리스트 -->
		<div class="chat-list">
			<div>
				<!-- 채팅내용 위 채팅방 제목 표현 부분 -->
				<div class="header-chat">
					<div class="header-chat-box">
						<img src="https://img.icons8.com/color/64/000000/speech-bubble-with-dots.png"/>
						<p class="header-chat-subject" />
					</div>
				</div>
				<!-- 진짜 채팅 내용 리스트가 나오는 부분 -->
				<div class="main-chat">
					<div class="chat_group">
					</div>
				</div>
			</div>
			<!-- 채팅 보내는 채팅 창 나올 부분 -->
			<div class="footer-chat">
				<i class="chat-footer-emoticonBtn far fa-smile fa-4"></i>
				<div class="text">
				<input type="text" id="sch_chat" name="sch_chat" class="chat-footer-write-message" placeholder="메세지를 입력해주세요." />
				</div>
				<i id="sendBtn" class="chat-footer-input-sendBtn far fa-paper-plane fa-2x"></i>
			</div>
		</div>
	</div>
</section>
<%@ include file="../common/footer.html" %>
</body>
</html>