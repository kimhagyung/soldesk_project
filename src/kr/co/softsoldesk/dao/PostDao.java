
package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.CommentBean;
import kr.co.softsoldesk.beans.PostBean;
import kr.co.softsoldesk.beans.ReportBean;
import kr.co.softsoldesk.mapper.PostMapper;

@Repository
public class PostDao {
	
	@Autowired
	private PostMapper postMapper;
	
	public void addBoardPostInfo(PostBean boardPostBean) {
		
		postMapper.addBoardPostInfo(boardPostBean);
	}
	
	public List<PostBean> getAllPostList(RowBounds rowBounds){
		return postMapper.getAllPostList(rowBounds);
	}
	
	public PostBean getPostInfo(int board_id) {
		return postMapper.getPostInfo(board_id);
	}
	
	
	public void modifyPostInfo(PostBean modifyPostBean) {
		postMapper.modifyPostInfo(modifyPostBean);
	}
	
	public void deletePostInfo(int board_id) {
		postMapper.deletePostInfo(board_id);
	}
	
	
	 public void plusCnt(int board_id)
	   {
		 postMapper.plusCnt(board_id);
	   }
	 
	 public int getPostCnt() {
		 return postMapper.getPostCnt();
	 }
	 
	 //내가 쓴 글
	 public List<PostBean> getMyPosts(Integer user_id, Integer pro_id, RowBounds rowBounds) {
		 
		 return postMapper.getMyPosts(user_id, pro_id, rowBounds);
	 }
	 
	 //내가 쓴 글들 갯수
	 public int getMyPostsCnt(Integer user_id, Integer pro_id) {
		 
		return postMapper.getMyPostsCnt(user_id, pro_id);
	 }
	 
 //--------------------신고-------------------------------
	 
	 public void addReportInfo(ReportBean writeReportBean) {
		 postMapper.addReportInfo(writeReportBean);
	 }
	 
	 //-------------------댓글----------------------------------
	 
	 public void addComment(CommentBean writeCommentBean) {
		 
		 postMapper.addComment(writeCommentBean);
	 }
	 
	 public List<CommentBean> getAllComments(int board_id){
		 return postMapper.getAllComments(board_id);
	 }
	 
	 public int commentCnt(int board_id) {
		 return postMapper.commentCnt(board_id);
	 }
	 
	 public void modifyComment(CommentBean modifyCommentBean) {
		   postMapper.modifyComment(modifyCommentBean);
	 }
	 
	 public void deleteComment(int comment_id) {
		 postMapper.deleteComment(comment_id);
	 }
	 
	 public int commentCntAtPost(int board_id) {
		 return postMapper.commentCntAtPost(board_id);
	 }
	 
	 //내가 쓴 댓글
	 public List<CommentBean> getMyComment(Integer user_id, Integer pro_id, RowBounds rowBounds) {
		 
		 return postMapper.getMyComment(user_id, pro_id, rowBounds);
	 }
	 
	 //내가 쓴 댓글 갯수
	 int getMyCommentCnt(Integer user_id, Integer pro_id) {
		 
		 return postMapper.getMyCommentCnt(user_id, pro_id);
	 }

}
