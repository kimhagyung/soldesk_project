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
	@Insert("insert into board(board_id, user_id, pro_id, title, content, category, location, photos, ReportedPostSt, board_date, viewCnt) "
			+ "values(board_seq.nextval, #{user_id, jdbcType=INTEGER, javaType=Integer}, #{pro_id, jdbcType=INTEGER, javaType=Integer}, #{title}, #{content}, #{category}, #{location}, #{photos, jdbcType=VARCHAR}, #{ReportedPostSt}, sysdate, #{viewCnt})")
	void addBoardPostInfo(PostBean boardPostBean);
	
	@Select("select board_id, user_id, pro_id, category, location, title, content, photos, viewCnt, board_date " //댓글 수
			+ "from board "
			+ "order by board_date desc")
	List<PostBean> getAllPostList();
	
	@Select("select a2.board_id, a2.user_id, a1.user_name as writer_name, a2.title, a2.content, a2.category, a2.location, a2.viewCnt, a2.board_date, a2.photos " //추가 필요
			+ "from users a1, board a2 "
			+ "where a1.user_id = a2.user_id and board_id = #{board_id}")
	PostBean getPostInfo(int board_id);
	
	@Update("update board "
			+ "set title=#{title}, content=#{content}, category=#{category}, location=#{location}, photos=#{photos, jdbcType=VARCHAR} " // 사진 추가
			+ "where board_id = #{board_id}")
	void modifyPostInfo(PostBean modifyPostBean);
	
	@Delete("delete from board where board_id=#{board_id}")
	void deletePostInfo(int board_id);

	
	@Update("update board set viewcnt = viewcnt+1 where board_id=#{board_id}")
	void plusCnt(int board_id);
}
