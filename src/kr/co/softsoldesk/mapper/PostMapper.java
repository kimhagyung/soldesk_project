package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.PostBean;

public interface PostMapper {
	
	@Insert("insert into board(board_id, user_id, pro_id, title, photo, content, category, location, ReportedPostSt, board_date) "
			+ "values(board_seq.nextval, #{user_id}, #{pro_id}, #{title}, #{photo, jdbcType=VARCHAR}, #{content}, #{category}, #{location}, #{ReportedPostSt}, sysdate)")
	void addBoardPostInfo(PostBean boardPostBean);
	
	@Select("select category, location, title, content, photo "
			+ "from board ")
	List<PostBean> getAllPostList();
}
