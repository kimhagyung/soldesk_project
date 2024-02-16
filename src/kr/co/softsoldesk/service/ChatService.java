package kr.co.softsoldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.ChatHistoryBean;
import kr.co.softsoldesk.beans.ChatRoomBean;
import kr.co.softsoldesk.beans.ChatRoomSelect;
import kr.co.softsoldesk.mapper.ChatMapper;

@Service
public class ChatService {


	  
	
	  
	 
	 
	
	/*
	 * private final ChatMapper chatMapper;
	 * 
	 * @Autowired public ChatService(ChatMapper chatMapper) { this.chatMapper =
	 * chatMapper; }
	 * 
	 * public void createChatroom(ChatroomBean chatroom) {
	 * chatMapper.insertChatroom(chatroom); }
	 */
	
    private final ChatMapper chatMapper;

    @Autowired
    public ChatService(ChatMapper chatMapper) {
        this.chatMapper = chatMapper;
    }

    public Integer createOrGetExistingChatroom(int proId, int userId) {
        Integer existingRoomId = chatMapper.findChatroomIdByProIdAndUserId(proId, userId);
        if (existingRoomId == null) {
            ChatRoomBean chatroom = new ChatRoomBean();
            chatroom.setPro_id(proId);
            chatroom.setUser_id(userId);
            chatMapper.insertChatroom(chatroom);
            return chatroom.getRoom_id(); // 생성된 채팅방의 ID 반환
        } else {
            return existingRoomId; // 이미 존재하는 채팅방의 ID 반환
        }
    }
    
    //채팅 기록 저장
    public void saveChatHistory(int roomId, String content, int senderId) {
        ChatHistoryBean chatHistory = new ChatHistoryBean();
        chatHistory.setRoom_id(roomId);
        chatHistory.setContent(content);
        chatHistory.setSenderId(senderId);
        chatMapper.insertChatHistory(chatHistory);
    }
    
    //채팅 리스트 띄울때 채팅방 찾는 메서드
    public Integer findChatroomIdByProIdAndUserId(int proId, int userId) {
        return chatMapper.findChatroomIdByProIdAndUserId(proId, userId);
    }
    
  //채팅 리스트 띄울때 채팅방 찾는 메서드
    public Integer findChatroomIdByProId(int proId) {
        return chatMapper.findChatroomIdByProId(proId);
    }
    
    
    //채팅방 만들때 메서드 (insert)
    public void createChatroom(ChatRoomBean chatroom) {
        chatMapper.insertChatroom(chatroom);
    }
    
    //사용자 ID를 기반으로 채팅방 목록과 전문가 이름을 조회하는 메서드
    public List<ChatRoomSelect> findChatroomsWithProNameByUserId(int userId) {
        return chatMapper.findChatroomsWithProNameByUserId(userId);
    }
    
    //프로 ID를 기반으로 채팅방 목록과 일반인 이름을 조회하는 메서드
    public List<ChatRoomSelect> findChatroomsWithUserNameByProId(int proId) {
        return chatMapper.findChatroomsWithUserNameByProId(proId);
    }
    
    //채팅방에서 채팅기록 불러올때 사용하는 메서드
    public List<ChatHistoryBean> findChatHistoryByRoomId(int roomId) {
        return chatMapper.findChatHistoryByRoomId(roomId);
    }

}
