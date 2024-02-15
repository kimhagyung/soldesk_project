package kr.co.softsoldesk.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.AdminBean;
import kr.co.softsoldesk.beans.PostBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.dao.AdminDao;
@Service
public class AdminService {
	@Autowired
	private AdminDao adminDao; 
	
	/*@Resource(name = "AdminloginBean")
	private AdminBean AdminloginBean;
	
	public void getLoginadminInfo(AdminBean adminTempLoginBean) {
		
		AdminBean AdminLoginBean2 = adminDao.getLoginadminInfo(adminTempLoginBean);
		if(AdminLoginBean2 != null) {
			AdminloginBean.setAdmin_id(AdminLoginBean2.getAdmin_id());
			AdminloginBean.setAdmin_pwd(AdminLoginBean2.getAdmin_pwd()); 
			AdminloginBean.setAdminLogin(true);
		}else {
		    System.out.println("로그인 사용자 정보가 없습니다.");
		}
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 관리자 이메일:"+AdminLoginBean2.getAdmin_id());
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 관리자 비번:"+AdminLoginBean2.getAdmin_pwd());  
	} 
	*/
	//모든 회원 정보 가져오기
	public List<UserBean> getAllUsers() { 
		return  adminDao.getAllUsers();
	}
	
	public void deleteUser(int user_id) {
		adminDao.deleteUser(user_id);
	}
	
	//pro
	public List<ProUserBean> getAllUProUsers() { 
		return adminDao.getAllUProUsers();
	}
	
	public void deleteProUser(int pro_id) {
		adminDao.deleteProUser(pro_id);
	}
	
	//board
	public List<PostBean> getAllUBoard() { 
		return adminDao.getAllUBoard();
	}
	
	//작성자 이름 조회 
	public String getPostUserName(int board_id) {
        return adminDao.getPostUserName(board_id);
    }

    public String getPostProUserName(int board_id) {
        return adminDao.getPostProUserName(board_id);
    }
    
    // !!! 관리자 게시글 삭제 !!!
    public void deletePost(int board_id) {
    	adminDao.deletePost(board_id);
    }
    
    // !!! 유저 게시글 카운트 !!!
	public int getUserPostCnt(int user_id) {
		 
		 return adminDao.getUserPostCnt(user_id);
		 
	 }
	
	public int getProPostCnt(int pro_id) {
		 
		 return adminDao.getProPostCnt(pro_id);
		 
	 }
	
	
}
