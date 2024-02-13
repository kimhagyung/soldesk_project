package kr.co.softsoldesk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.softsoldesk.beans.ChatHistoryBean;
import kr.co.softsoldesk.beans.ChatroomBean;
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
	
	private final ChatMapper chatMapper;

    @Autowired
    public ChatService(ChatMapper chatMapper) {
        this.chatMapper = chatMapper;
    }

    public void createChatroom(ChatroomBean chatroom) {
        chatMapper.insertChatroom(chatroom);
    }

}
