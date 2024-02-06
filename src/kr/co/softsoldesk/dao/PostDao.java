
package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.PostBean;
import kr.co.softsoldesk.mapper.PostMapper;

@Repository
public class PostDao {
	
	@Autowired
	private PostMapper postMapper;
	
	public void addBoardPostInfo(PostBean boardPostBean) {
		
		postMapper.addBoardPostInfo(boardPostBean);
	}
	
	public List<PostBean> getAllPostList(){
		return postMapper.getAllPostList();
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

}
