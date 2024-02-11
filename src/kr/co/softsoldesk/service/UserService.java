package kr.co.softsoldesk.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.dao.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	public boolean checkuserEmailExist(String user_email) {
		
		String user_name = userDao.checkUserEmailExist(user_email);
		if(user_name == null) {
	 
			return true;
		}else {
			return false;
		}	
	}
	
	public void addUserInfo(UserBean joinUserBean) {
		
		userDao.addUserInfo(joinUserBean);
	}
	
	
	public void getLoginUserInfo(UserBean tempLoginUserBean) {
		
		UserBean tempLoginUserBean2 = userDao.getLoginUserInfo(tempLoginUserBean);
		
		if(tempLoginUserBean2 != null) {
			loginUserBean.setUser_id(tempLoginUserBean2.getUser_id());
			loginUserBean.setUser_name(tempLoginUserBean2.getUser_name());
			loginUserBean.setUser_email(tempLoginUserBean2.getUser_email());
			loginUserBean.setUser_pwd(tempLoginUserBean2.getUser_pwd());
			loginUserBean.setUserLogin(true);
		}
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 이메일:"+tempLoginUserBean2.getUser_email());
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 이름:"+tempLoginUserBean2.getUser_name());
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 번호:"+tempLoginUserBean2.getUser_id());
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 비밀번호:"+tempLoginUserBean2.getUser_pwd());
	} 
	
	
	 
}

