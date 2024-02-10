package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.softsoldesk.beans.CommentBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.service.PostService;

@RestController
public class CommentController {
	
	@Resource(name="loginUserBean")
	private UserBean loginUserBean;
	
	@Resource(name = "loginProuserBean")
	private ProUserBean loginProuserBean;
	
	@Autowired
	private PostService postService;
	
	//댓글 작성
	@PostMapping("/comment")
	public CommentBean addComment(@RequestBody CommentBean writeCommentBean) {
	
		postService.addComment(writeCommentBean);
		System.out.println("로그인 " + loginUserBean.getUser_name());
		return writeCommentBean;
	}
	
	//댓글 목록
	@GetMapping("/comments")
	public List<CommentBean> getAllComments(@RequestParam("board_id") int board_id){
		List<CommentBean> comments = postService.getAllComments(board_id);
		return comments;
	}
	
	//댓글 개수
	@GetMapping("/commentCnt")
	public int commentCnt(@RequestParam("board_id") int board_id) {
		
		System.out.println(postService.commentCnt(board_id));
		
		return postService.commentCnt(board_id);
	}
	
	//댓글 수정
	@PostMapping("/modifyComment")
	public CommentBean modifyComment(@RequestBody CommentBean modifyCommentBean) {
		postService.modifyComment(modifyCommentBean);
		return modifyCommentBean;
	}
	
	
	//댓글 삭제
	@GetMapping("/deleteComment")
	public void deleteComment(@RequestParam("comment_id") int comment_id) {
		 postService.deleteComment(comment_id);
	 }
	
}