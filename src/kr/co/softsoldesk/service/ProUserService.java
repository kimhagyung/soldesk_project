package kr.co.softsoldesk.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.ExpertBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.dao.ProUserDao;

@Service
public class ProUserService {

	@Autowired
	private ProUserDao proUserDao;
	
	@Resource(name = "loginProuserBean")
	private ProUserBean loginProuserBean;
	
	@Autowired
	private ProUserBean prouserbean;
	
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

	    /*
	    // get pro_id from joinProuserBean
	    int proId = joinProuserBean.getPro_id()+1;
	    System.out.println("서비스에서 찍는 프로 아이디:"+proId);
	    // Create ExpertBean and set pro_id
	    ExpertBean expertBean = new ExpertBean();
	    expertBean.setPro_id(proId);

	    // Call addProProfileInfo with the expertBean
	    proUserDao.addProProfileInfo(expertBean);
	    */
	} 
/*
	public void addProProfileInfo(ExpertBean expertBean) { 
	    proUserDao.addProProfileInfo(expertBean);
	}
	*/
	
	public void getLoginProuserInfo(ProUserBean tempLoginUserBean2) {
		
		 ProUserBean tempLoginProuserBean3 = proUserDao.getLoginProuserInfo(tempLoginUserBean2);
		
		if(tempLoginProuserBean3 != null) {
			loginProuserBean.setPro_id(tempLoginProuserBean3.getPro_id());
			loginProuserBean.setPro_email(tempLoginProuserBean3.getPro_email());
			loginProuserBean.setPro_name(tempLoginProuserBean3.getPro_name());
			loginProuserBean.setPro_pwd(tempLoginProuserBean3.getPro_pwd());
			loginProuserBean.setProuserLogin(true);
		}
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 일류 이메일:"+tempLoginProuserBean3.getPro_email());
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 일류 이름:"+tempLoginProuserBean3.getPro_name());
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 일류 번호:"+tempLoginProuserBean3.getPro_id());
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 일류 비밀번호:"+tempLoginProuserBean3.getPro_pwd());
	} 
	
	
	 
}

