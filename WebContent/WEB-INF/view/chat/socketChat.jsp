<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kosmo62.spomatch.chat.vo.SpoChatVO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>

<link rel="stylesheet" type="text/css" href="/spoMatch/css/chat.css" />
<script type="text/javascript" src="js/socket.js"></script>
<script type="text/javascript">
	var es;
	$(document).ready(function(){
		/*if ('WebSocket' in window) {  
		    var oSocket = new WebSocket("ws://localhost:8088/spoMatch");
	
		    oSocket.onmessage = function (e) { 
		        console.log(e.data); 
		    };
	
		    oSocket.onopen = function (e) {
		        console.log("open");
		    };
	
		    oSocket.onclose = function (e) {
		        console.log("close");
		    };
	
		    oSocket.send("message");
		    oSocket.close();
		}
		var sch_chat = $("#sch_chat");
		ws = new WebSocket("ws://192.168.1.178:8088/spoMatch");
		
		// 소켓 서버에 연결되었을 떄 연결메세지 출력
		ws.onopen = function(e){
			sch_chat.append("socket connected<br>");
		}
		
		// 소켓 서버에 수신한 메세지 화면 출력
		ws.onmessage  = function(e){
			sch_chat.append("e.data<br>");
		}
		
		// websocket 세션 종료시 화면 출력
		ws.onclose  = function(e){
			sch_chat.append("session closed<br>");
		}*/
		
	});
	// 사용자가 입력한 메시지를 서버로 전송
	function sendMessage() {
		var txtSend = $("#sch_chat");
		oSocket.send(txtSend);
		txtSend.val("");
	}
</script>
</head>
<body>

<input type="hidden" id="smc_no" name="smc_no" value=''>
<div id="header">
</div>
<!-- <form class="chatForm"> -->
<div id="container">
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
						<p>전체</p>
					</div>
				</div>
				<div class="searchChat2">
					<input type="text" id="smc_subject" name="smc_subject" placeholder="대화방 이름 검색">
					<i id="searchChatBtn" class="fa fa-search fa-4" aria-hidden="true"></i>
				</div>
			</div>
			<div class="main-list" id="main-list">
				<ul class="main-list-ul">
		
				</ul>
			</div>
			<div class="footer-list">
				<div class="right_area">
			        <img src="https://image.flaticon.com/icons/svg/3299/3299921.svg" width="40" height="40" title="Trash can free icon" />
			    </div>
			</div>
		</div>
	</div>
	<!-- 채팅 내역 리스트 -->
	<div class="chat-list">
		<div class="header-chat">
			<div class="header-chat-box">
				<img src="https://img.icons8.com/bubbles/50/000000/user-male.png"/>
				<p class="header-chat-subject"></p>
			</div>
		</div>
		<div class="main-chat">
			<ul class="chat_group">
			</ul>
		</div>
		<div class="footer-chat">
			<i class="chat-footer-emoticonBtn far fa-smile fa-4"></i>
			<div class="text">
			<textarea id="sch_chat" name="sch_chat" class="chat-footer-write-message" placeholder="메세지를 입력해주세요."></textarea>
			</div>
			<img class="chat-footer-input-fileBtn" src="https://img.icons8.com/emoji/30/000000/paperclip-emoji.png"/>
			<i id="sendBtn" class="chat-footer-input-sendBtn far fa-paper-plane fa-4" onclick="sendMessage()"></i>
		</div>
	</div>
</div>
 <div id="output"></div>
<!-- </form> -->
<div id="footer">
</div>
</body>
</html>