package kr.co.softsoldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.ChatRoomBean;
import kr.co.softsoldesk.beans.ChatRoomSelect;
import kr.co.softsoldesk.mapper.ChatMapper;

@Service
public class ChatService {

	/*
	 * private final ChatMapper chatHistoryMapper;
	 * 
	 * @Autowired public ChatService(ChatMapper chatHistoryMapper) {
	 * this.chatHistoryMapper = chatHistoryMapper; }
	 * 
	 * public void saveChatHistory(String text, int room_id) { ChatHistoryBean
	 * chatHistory = new ChatHistoryBean();
	 * 
	 * chatHistory.setUserId(userId); chatHistory.setProId(proId);
	 * 
	 * chatHistory.setRoom_id(room_id); chatHistory.setContent(text); // 현재 시간은
	 * 데이터베이스에서 자동으로 설정되므로 여기서는 설정하지 않습니다.
	 * 
	 * chatHistoryMapper.insertChatHistory(chatHistory); }
	 */
	
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
    public Integer findChatroomIdByProIdAndUserId(int proId, int userId) {
        return chatMapper.findChatroomIdByProIdAndUserId(proId, userId);
    }
    
    public void createChatroom(ChatRoomBean chatroom) {
        chatMapper.insertChatroom(chatroom);
    }
    
 // 사용자 ID를 기반으로 채팅방 목록과 전문가 이름을 조회하는 메서드
    public List<ChatRoomSelect> findChatroomsWithProNameByUserId(int userId) {
        return chatMapper.findChatroomsWithProNameByUserId(userId);
    }

}
