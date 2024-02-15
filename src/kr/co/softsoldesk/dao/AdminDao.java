package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.AdminBean;
import kr.co.softsoldesk.beans.PostBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.ServiceCategoryBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.mapper.AdminMapper; 

@Repository
public class AdminDao {
	@Autowired
	private AdminMapper adminMapper;
	
	public AdminBean getLoginadminInfo(AdminBean adminTempLoginBean) {
		
		return adminMapper.getLoginadminInfo(adminTempLoginBean);
	}
	//user
	public List<UserBean> getAllUsers() { 
		return  adminMapper.getAllUsers();
	}
  
	public void deleteUser(int user_id) {
		adminMapper.deleteUser(user_id);
	}
	
	//pro
	public List<ProUserBean> getAllUProUsers() { 
		return  adminMapper.getAllUProUsers();
	}
	
	public void deleteProUser(int pro_id) {
		adminMapper.deleteProUser(pro_id);
	} 
	//Board
	public List<PostBean> getAllUBoard() { 
		return  adminMapper.getAllUBoard();
	}
	
	//작성자 이름 조회 
	public String getPostUserName(int board_id) {
        return adminMapper.getPostUserName(board_id);
    }

    public String getPostProUserName(int board_id) {
        return adminMapper.getPostProUserName(board_id);
    }
    
    // !!! 관리자 게시글 삭제 !!!
    public void deletePost(int board_id) {
    	adminMapper.deletePost(board_id);
    }
    
    // !!! 유저 게시글 카운트 !!!
	 public int getUserPostCnt(int user_id) {
		 
		 return adminMapper.getUserPostCnt(user_id);
		 
	 }
	 
	 public int getProPostCnt(int pro_id) {
		 
		 return adminMapper.getProPostCnt(pro_id);
		 
	 }
	
}
