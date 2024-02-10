
package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.CommentBean;
import kr.co.softsoldesk.beans.PostBean;
import kr.co.softsoldesk.beans.ReportBean;
import kr.co.softsoldesk.controller.CommentController;
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
	 
}
