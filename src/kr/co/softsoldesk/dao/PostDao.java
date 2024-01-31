package kr.co.softsoldesk.dao;

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
}
