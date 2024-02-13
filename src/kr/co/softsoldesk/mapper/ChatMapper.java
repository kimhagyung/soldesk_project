package kr.co.softsoldesk.mapper;



import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

import kr.co.softsoldesk.beans.ChatHistoryBean;
import kr.co.softsoldesk.beans.ChatroomBean;

/*
 * @Mapper public interface ChatMapper {
 * 
 * @Insert("INSERT INTO chatHistory (chatHistoryID, user_id, pro_id, chatContent, chattime) VALUES (chatHistory_seq.NEXTVAL, #{userId}, #{proId}, #{chatContent}, DEFAULT)"
 * ) void insertChatHistory(ChatHistoryBean chatHistory);
 * 
 * }
 */
@Mapper
public interface ChatMapper {

	@Insert("INSERT INTO chatroom (room_id, pro_id, user_id, createdate) VALUES (chatroom_seq.NEXTVAL, #{pro_id}, #{user_id}, DEFAULT)")
	void insertChatroom(ChatroomBean chatroom);
}