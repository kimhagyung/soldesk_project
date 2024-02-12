package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;
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
	//
	public ProUserBean getDetailCategoriesByName(String pro_name) {
        return ProuserMapper.getDetailCategoriesByName(pro_name);
    }
	
	public ProUserBean getCategoriesByProId(Long proId) {
		return ProuserMapper.getCategoriesByProId(proId);
	}
	
	//
	public List<String> getRecoProUserByName(String reco) {
		
		return ProuserMapper.getRecoProUserByName(reco);
		
	}  
	
	public List<ProUserBean> getProUserByName(RowBounds rowBounds) { 
		return ProuserMapper.getProUserByName(rowBounds); 
	} 


	public int getProCnt() {
		return ProuserMapper.getProCnt();
	}
	
	public List<String> getselectedCategory(String selectedCategory) { 
		return ProuserMapper.getselectedCategory(selectedCategory); 
	} 

	public List<String> getselectedLocation(String active_location) { 
		return ProuserMapper.getselectedLocation(active_location); 
	} 
	
	public List<String> getProCategoryAndLocation(String selectedCategory,String active_location) { 
		return ProuserMapper.getProCategoryAndLocation(selectedCategory,active_location); 
	} 
	 
	public void ProupdateAccountUser(ProUserBean ProAccountModifyCom){
		
		ProuserMapper.ProupdateAccountUser(ProAccountModifyCom);
	}
	
	public int ProAccountResign(int pro_id) {
		return ProuserMapper.ProAccountResign(pro_id);
	} 
}
