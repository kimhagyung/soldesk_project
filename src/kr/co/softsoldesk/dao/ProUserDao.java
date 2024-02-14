package kr.co.softsoldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.CateProuserBean;
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
	
	//사용자 이름 수정
	public void modifyProName(String pro_name, int pro_id) {
		
		ProuserMapper.modifyProName(pro_name, pro_id);
	}
	//public List<Map<String, String>> getCategoryList(int pro_id) {
		
	//	return ProuserMapper.getCategoryList(pro_id);
	//} 
	
	//public ProUserBean getCategoryList(int pro_id) {
		
	//	return ProuserMapper.getCategoryList(pro_id);
	//}
	
	public String getCategory1(int pro_id) {
		
		return ProuserMapper.getCategory1(pro_id);
	}
	
	public String getCategory2(int pro_id) {
			
			return ProuserMapper.getCategory2(pro_id);
		}
	
	public String getCategory3(int pro_id) {
		
		return ProuserMapper.getCategory3(pro_id);
	}
	
	//카테고리 수정
	public void modifyCategory(CateProuserBean modifyCategoryBean) {
		
		ProuserMapper.modifyCategory(modifyCategoryBean);
	}
	
	//카테고리 삭제
	public void deleteCategory1(int pro_id) {
		
		ProuserMapper.deleteCategory1(pro_id);
	}
	
	public void deleteCategory2(int pro_id) {
			
		ProuserMapper.deleteCategory2(pro_id);
	}
	
	public void deleteCategory3(int pro_id) {
		
		ProuserMapper.deleteCategory3(pro_id);
	}
}
