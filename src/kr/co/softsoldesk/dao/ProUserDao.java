package kr.co.softsoldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.ProUserBean; 
import kr.co.softsoldesk.mapper.ProUserMapper; 

@Repository
public class ProUserDao {

	@Autowired
	private ProUserMapper ProuserMapper;
	
	public String checkProuserEmailExist(String pro_email) {
		
		return ProuserMapper.checkProuserEmailExist(pro_email);
	}
	
	public void addUserInfo(ProUserBean joinProuserBean) {
		
		ProuserMapper.addProuserInfo(joinProuserBean);
	}
	 
	
	 
	
	
}
