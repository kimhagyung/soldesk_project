package kr.co.softsoldesk.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.ChatHistoryBean;
import kr.co.softsoldesk.beans.ChatRoomBean;
import kr.co.softsoldesk.beans.ChatRoomSelect;

@Mapper
public interface ChatMapper {
    // 기존 채팅방 ID 조회
    @Select("SELECT room_id FROM chatroom WHERE pro_id = #{pro_id} AND user_id = #{user_id}")
    Integer findChatroomIdByProIdAndUserId(@Param("pro_id") int proId, @Param("user_id") int userId);

    // 채팅방 삽입 및 생성된 room_id 반환
    @Insert("INSERT INTO chatroom (room_id, pro_id, user_id, createdate) VALUES (chatroom_seq.NEXTVAL, #{pro_id}, #{user_id}, DEFAULT)")
    
    void insertChatroom(ChatRoomBean chatroom);
    
    @Select("SELECT c.room_id, p.pro_name, c.pro_id " +
            "FROM chatroom c JOIN pro_user p ON c.pro_id = p.pro_id " +
            "WHERE c.user_id = #{user_id}")
    List<ChatRoomSelect> findChatroomsWithProNameByUserId(@Param("user_id") int userId);
    
	/*
	 * @Insert("INSERT INTO chatHistory(chat_id, room_id, content, chattime) values(chatHistory_seq.NEXTVAL, #{room_id}, #{content}, DEFAULT"
	 * )
	 */

}


/*
 * @Mapper public interface ChatMapper {
 * 
 * @Insert("INSERT INTO chatroom (room_id, pro_id, user_id, createdate) VALUES (chatroom_seq.NEXTVAL, #{pro_id}, #{user_id}, DEFAULT)"
 * ) void insertChatroom(ChatroomBean chatroom); }
 */