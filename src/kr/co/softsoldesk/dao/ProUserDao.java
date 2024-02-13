package kr.co.softsoldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.ExpertBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.mapper.ProUserMapper; 

@Repository
public class ProUserDao {

	@Autowired
	private ProUserMapper ProuserMapper;
	
	public String checkProuserEmailExist(String pro_email) {
		
		return ProuserMapper.checkProuserEmailExist(pro_email);
	}
	
/*
	public void addProProfileInfo(ExpertBean expertBean) { 
		ProuserMapper.addProProfileInfo(expertBean);
	}
	*/
	public void addProuserInfo(ProUserBean joinProuserBean) {
		
		ProuserMapper.addProuserInfo(joinProuserBean);
	}
	 
	public ProUserBean getLoginProuserInfo(ProUserBean tempLoginUserBean2) {
		
		return ProuserMapper.getLoginProuserInfo(tempLoginUserBean2);
	
	} 
	
	public String getProUserName(int pro_id) {
	      
	      return ProuserMapper.getProUserName(pro_id);
	   }
	
	public void modifyActive_location(String active_location, int pro_id) {
	      
		ProuserMapper.modifyActive_location(active_location, pro_id);
	   }
	
}
