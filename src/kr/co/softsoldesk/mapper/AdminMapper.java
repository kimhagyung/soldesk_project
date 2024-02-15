package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.AdminBean;
import kr.co.softsoldesk.beans.PostBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;

public interface AdminMapper {
	
	@Select("select * from admin where admin_id=#{admin_id} and admin_pwd=#{admin_pwd}")
	AdminBean getLoginadminInfo(AdminBean adminTempLoginBean);
	
	//user
	@Select("select * from users order by user_id asc")
	List<UserBean> getAllUsers();
	
	@Delete("delete from users where user_id=#{user_id}")
	void deleteUser(int user_id);
	
	//pro
	@Select("select * from pro_user order by pro_id asc")
	List<ProUserBean> getAllUProUsers();
	
	@Delete("delete from pro_user where pro_id=#{pro_id}")
	void deleteProUser(int pro_id);
	
	//커뮤니티 조회 
	@Select("select * from board order by board_id asc")
	List<PostBean> getAllUBoard();
	
	//게시글 올린 사람 이름 조회 
	@Select("select user_name from users, board where users.user_id=board.user_id and board_id=${board_id}")
	String getPostUserName(int board_id);
	
	@Select("select pro_name from pro_user, board where pro_user.pro_id=board.pro_id and board_id=${board_id}")
	String getPostProUserName(int board_id); 
	
	// !!! 게시글 삭제 !!!
	@Delete("delete from board where board_id=#{board_id}")
	void deletePost(int board_id);
	
	
	// !!! 내가 쓴 게시글 갯수 !!!

	@Select("SELECT COUNT(*)\r\n"
			+ "FROM board\r\n"
			+ "WHERE (user_id = #{user_id, jdbcType=INTEGER})")
	int getUserPostCnt(@Param("user_id") Integer user_id);
	
	@Select("SELECT COUNT(*)\r\n"
			+ "FROM board\r\n"
			+ "WHERE (pro_id = #{pro_id, jdbcType=INTEGER})")
	int getProPostCnt(@Param("pro_id") Integer pro_id);
	
	
}
