package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.beans.PostBean;

public interface PostMapper {
	
	@SelectKey(statement = "select board_seq.nextval from dual", keyProperty = "board_id", 
				before = true, resultType = int.class)
	@Insert("insert into board(board_id, user_id, pro_id, title, photos, content, category, location, ReportedPostSt, board_date, viewCnt) "
			+ "values(board_seq.nextval, #{user_id}, #{pro_id}, #{title}, #{photos}, #{content}, #{category}, #{location}, #{ReportedPostSt}, sysdate, #{viewCnt})")
	void addBoardPostInfo(PostBean boardPostBean);
	
	@Select("select board_id, category, location, title, content, photos, viewCnt, board_date " //댓글 수, 시간 값 추가로
			+ "from board ")
	List<PostBean> getAllPostList();
	
	@Select("select a2.board_id, a2.user_id, a1.user_name as writer_name, a2.title, a2.content, a2.category, a2.location, a2.viewCnt, a2.board_date " //추가 필요
			+ "from users a1, board a2 "
			+ "where a1.user_id = a2.user_id and board_id = #{board_id}")
	PostBean getPostInfo(int board_id);
	
	@Update("update board "
			+ "set title=#{title}, content=#{content}, category=#{category}, location=#{location} " //시간, 사진 추가
			+ "where board_id = #{board_id}")
	void modifyPostInfo(PostBean modifyPostBean);
	
	@Delete("delete from board where board_id=#{board_id}")
	void deletePostInfo(int board_id);
	
	@Select("select board_id, category, location, title, content, photos " //댓글 수, 조회 수, 시간 값 추가로
			+ "from board "
			+ "where location = #{location}")
	List<PostBean> getPostLocationInfo(int board_id);
	
	@Update("update board set viewcnt = viewcnt+1 where board_id=#{board_id}")
	void plusCnt(int board_id);
}
