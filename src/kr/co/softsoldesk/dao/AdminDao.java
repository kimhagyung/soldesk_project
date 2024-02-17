package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.AdminBean;
import kr.co.softsoldesk.beans.PostBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.ReportBean;
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
    
    //신고 목록 불러오기
    public List<ReportBean> getReportList(){
    	return adminMapper.getReportList();
    }
    
    //신고 반려
    public void deleteReportInfo(int board_id) {
    	adminMapper.deleteReportInfo(board_id);
    }
    
    //게시글 삭제
    public void deletePostInfo(int board_id){
    	adminMapper.deletePostInfo(board_id);
    }
    
	//신고 누적 횟수
    public void updateUserReportCnt(int user_id) {
    	adminMapper.updateUserReportCnt(user_id);
    }
    
    public void updateProuserReportCnt(int pro_id) {
    	adminMapper.updateProuserReportCnt(pro_id);
    }
    
    //신고 개수
    public int getCntReport() {
    	return adminMapper.getCntReport();
    }
    
    
	
}
