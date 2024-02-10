package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.softsoldesk.beans.CommentBean;
import kr.co.softsoldesk.beans.PostBean;
import kr.co.softsoldesk.beans.ReportBean;

public interface PostMapper {
	
	@SelectKey(statement = "select board_seq.nextval from dual", keyProperty = "board_id", 
				before = true, resultType = int.class)
	@Insert("insert into board(board_id, user_id, pro_id, title, content, category, location, photos, ReportedPostSt, board_date, viewCnt) "
			+ "values(board_seq.nextval, #{user_id, jdbcType=INTEGER, javaType=Integer}, #{pro_id, jdbcType=INTEGER, javaType=Integer}, #{title}, #{content}, #{category}, #{location}, #{photos, jdbcType=VARCHAR}, #{ReportedPostSt}, sysdate, #{viewCnt})")
	void addBoardPostInfo(PostBean boardPostBean);
	
	@Select("select b.board_id, b.user_id, b.pro_id, b.category, b.location, b.title, b.content, b.photos, b.viewCnt, b.board_date, NVL(c.commentCnt,0) as commentCnt "
			+ "from board b, "
			+ "(select board_id, count(*) as commentCnt from comments "
			+ "group by board_id) c "
			+ "where b.board_id = c.board_id(+) "
			+ "order by b.board_id desc")
	List<PostBean> getAllPostList(RowBounds rowBounds);
	
	@Select("SELECT b.board_id, b.user_id, b.pro_id, u.user_name AS writer_name, pu.pro_name AS prowriter_name, b.title, b.content, b.category, b.location, "
	         + " b.viewCnt, b.board_date, b.photos "
	         + "FROM board b "
	         + "LEFT JOIN users u ON b.user_id = u.user_id "
	         + "LEFT JOIN pro_user pu ON b.pro_id = pu.pro_id "
	         + "WHERE b.board_id = #{b.board_id}")
	PostBean getPostInfo(int board_id);
	
	@Update("update board "
			+ "set title=#{title}, content=#{content}, category=#{category}, location=#{location}, photos=#{photos, jdbcType=VARCHAR} " 
			+ "where board_id = #{board_id}")
	void modifyPostInfo(PostBean modifyPostBean);
	
	@Delete("delete from board where board_id=#{board_id}")
	void deletePostInfo(int board_id);

	
	@Update("update board set viewcnt = viewcnt+1 where board_id=#{board_id}")
	void plusCnt(int board_id);
	
	@Select("select count(*) from board")
	int getPostCnt();
	
	//----------------신고-----------------------------
	
	@Insert("insert into report(report_id, board_id, report_state, report_msg) "
			+ "values(report_seq.nextval, #{board_id}, #{report_state}, #{report_msg})")
	void addReportInfo(ReportBean writeReportBean);
	
	//------------------댓글---------------------------------
	
	@Insert("insert into comments(comment_id, board_id, user_id, pro_id, comment_content, comments_date) "
			+ "values(comments_seq.nextval, #{board_id}, #{user_id, jdbcType=INTEGER, javaType=Integer}, #{pro_id, jdbcType=INTEGER, javaType=Integer}, #{comment_content}, sysdate)")
	void addComment(CommentBean writeCommentBean);
	
	@Select("SELECT c.board_id, c.user_id, c.pro_id, u.user_name as comment_writer_name, "
			+ "p.pro_name as comment_prowriter_name, c.comment_id, c.comment_content, "
			+ "c.comments_date "
			+ "FROM comments c "
			+ "LEFT JOIN users u ON c.user_id = u.user_id "
			+ "LEFT JOIN pro_user p ON c.pro_id = p.pro_id "
			+ "LEFT JOIN board b ON c.board_id = b.board_id "
			+ "WHERE b.board_id = #{board_id}")
	List<CommentBean> getAllComments(int board_id);
	
	@Select("select count(*) from comments where board_id = #{board_id}")
	int commentCnt(int board_id);
	
	@Update("update comments "
			+ "set comment_content = #{comment_content} "
			+ "where comment_id = #{comment_id}")
	void modifyComment(CommentBean modifyCommentBean);
	
	@Delete("delete from comments where comment_id=#{comment_id}")
	void deleteComment(int comment_id);
	
	@Select("select count(*) from board b, comments c "
			+ "where b.board_id = c.board_id and b.board_id = #{board_id}")
	int commentCntAtPost(int board_id);
	
	
	
}