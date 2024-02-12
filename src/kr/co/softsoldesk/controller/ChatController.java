package kr.co.softsoldesk.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;  
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate; // 추가한 import

import kr.co.softsoldesk.beans.MessageBean;

@RestController
public class ChatController {

	
    @Autowired
    private SimpMessagingTemplate messagingTemplate; // 추가한 멤버 변수

    @MessageMapping("/sendMessage")
    @SendTo("/topic/messages")
    public MessageBean sendMessage(MessageBean message) {
        
        //System.out.println("출력된 메세지 : " + message.getText());
        //logger.debug("메시지 수신: {}", message.getText());
  
        
        // 메시지를 /topic/messages로 브로드캐스트합니다.
        // 클라이언트에게 알림을 보내려면 다음과 같이 알림 메시지를 만들고 전송합니다.
        String notification =  message.getText();
        notifyClients(notification); // 클라이언트에게 알림 보내기
       // logger.debug("메시지 전송: {}", notification);
        
        return message;
    }
    
    // 클라이언트에게 알림을 보내는 메소드
    private void notifyClients(String notification) {
    	
    	
    	  System.out.println("보내지는 알림: " + notification);
    	
        // SimpMessagingTemplate을 사용하여 알림을 특정 주제로 전송합니다.
        // 예를 들어, "/topic/notifications" 주제를 만들고 알림을 전송할 수 있습니다.
        messagingTemplate.convertAndSend("/topic/notifications", notification);
    }
}
