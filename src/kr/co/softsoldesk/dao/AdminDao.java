package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.AdminBean;
import kr.co.softsoldesk.beans.DetailCategoryBean;
import kr.co.softsoldesk.beans.PortFolioBean;
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
	
    //포트폴리오 조회 
    public  List<PortFolioBean> getAllPortfolio() { 
		return  adminMapper.getAllPortfolio();
	}
    //포폴 검수 완료 
    public void CompPort(int portfolio_id) {
    	adminMapper.CompPort(portfolio_id);
    }
    
    //포폴 이름 조회 
    public String getPortfolioName(int portfolio_id) {
        return adminMapper.getPortfolioName(portfolio_id);
    }
      
    //포폴 삭제
    public void DelPortfolio(int portfolio_id) {
    	adminMapper.DelPortfolio(portfolio_id);
    }
    
    //관리자 게시글 삭제  
    public void deletePost(int board_id) {
    	adminMapper.deletePost(board_id);
    }
    //카테고리 조회....
    public List<DetailCategoryBean> getDetailList() {
    	
    	return adminMapper.getDetailList();
    }
    
    //서비스 카테고리 이름 조회...
    public List<ServiceCategoryBean> getServiceCategoryName() {
    	
    	return adminMapper.getServiceCategoryName();
    }
    
    //카테고리 추가..
    public void addCategory(DetailCategoryBean addCategoryBean) {
    	
    	adminMapper.addCategory(addCategoryBean);
    }
   
    // !!! 유저 게시글 카운트 !!!
 	 public int getUserPostCnt(int user_id) {
 		 
 		 return adminMapper.getUserPostCnt(user_id);
 		 
 	 }
 	 
 	 public int getProPostCnt(int pro_id) {
 		 
 		 return adminMapper.getProPostCnt(pro_id);
 		 
 	 }
}
