package kosmo62.spomatch.chat.controller;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

import org.apache.log4j.Logger;

//WebSocket의 호스트 주소 설정
@ServerEndpoint("/websocket")
public class Websocket {
	private Logger log = Logger.getLogger(Websocket.class);
	
	@OnOpen
	public void handleOpen(){
		log.info("Websocket handleOpen start >>>");
		log.info("client is now connected...");
		log.info("Websocket handleOpen end >>>");
	}
	
	// WebSocket으로 메시지가 오면 요청되는 함수
	@OnMessage
	public String handleMessage(String message) {
		log.info("Websocket handleMessage start >>>");
		String resultMessage = "each " + message;
		log.info("Websocket handleMessage resultMessage >>>" + resultMessage);
		log.info("Websocket handleMessage end >>>");
		
		return resultMessage;
	}
	// WebSocket과 브라우저가 접속이 끊겼을 경우 요청 함수
	@OnClose
	public void handleClose() {
		log.info("Websocket handleClose start >>>");
		log.info("client is now disconnected...");
		log.info("Websocket handleClose end >>>");
	}
}
