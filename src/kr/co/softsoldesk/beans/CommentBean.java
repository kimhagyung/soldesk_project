package kr.co.softsoldesk.beans;

import java.sql.Timestamp;

public class CommentBean {
	private int comments_id;
    private int board_id;
    private int user_id;
    private String commentContent;
    private Timestamp comments_date;
    private int pro_id;
	public int getComments_id() {
		return comments_id;
	}
	public void setComments_id(int comments_id) {
		this.comments_id = comments_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Timestamp getComments_date() {
		return comments_date;
	}
	public void setComments_date(Timestamp comments_date) {
		this.comments_date = comments_date;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
    
    
}
