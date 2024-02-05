package kr.co.softsoldesk.dao;

import java.util.List;

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
	
	public void addProuserInfo(ProUserBean joinProuserBean) {
		
		ProuserMapper.addProuserInfo(joinProuserBean);
	}
	 
	public ProUserBean getLoginProuserInfo(ProUserBean tempLoginUserBean2) {
		
		return ProuserMapper.getLoginProuserInfo(tempLoginUserBean2);
	
	} 
	
	public List<String> getSearchProUserByName(String pro_name) {
		
		return ProuserMapper.getSearchProUserByName(pro_name);
		
	} 
	
	public List<ProUserBean> getProUserByName() { 
		return ProuserMapper.getProUserByName(); 
	} 
	
	public List<String> getProCategoryAndLocation(String activeData) { 
		return ProuserMapper.getProCategoryAndLocation(activeData); 
	} 
	
	
}
