package kr.co.softsoldesk.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.ProUserBean; 
import kr.co.softsoldesk.dao.ProUserDao;

@Service
public class ProUserService {

	@Autowired
	private ProUserDao proUserDao;
	
	@Resource(name = "ProUserBean")
	private ProUserBean ProUserBean;
	
	public boolean checkProuserEmailExist(String pro_email) {
		
		String pro_name = proUserDao.checkProuserEmailExist(pro_email);
		if(pro_name == null) {
	 
			return true;
		}else {
			return false;
		}	
		 
	}
	
	public void addProuserInfo(ProUserBean joinProuserBean) {
		 
		proUserDao.addProuserInfo(joinProuserBean);
	} 
	/*
	public void getLoginProuserInfo(ProUserBean tempLoginProuserBean) {
		
		 ProUserBean tempLoginProuserBean2 = proUserDao.get(tempLoginProuserBean);
		
		if(tempLoginProuserBean2 != null) {
			ProUserBean.set(tempLoginProuserBean2.getPro_id()());
			ProUserBean.setUser_email(tempLoginProuserBean2.getPro());
			ProUserBean.setUser_pwd(tempLoginProuserBean2.getUser_pwd());
			ProUserBean.setUserLogin(true);
		}
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 일류 이메일:"+tempLoginProuserBean2.getUser_email());
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 일류 이름:"+tempLoginProuserBean2.getUser_name());
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 일류 번호:"+tempLoginProuserBean2.getUser_id());
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 일류 비밀번호:"+tempLoginProuserBean2.getUser_pwd());
	} 
	*/
	
	 
}

