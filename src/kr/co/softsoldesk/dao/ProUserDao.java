package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
	 
	public ProUserBean getLoginProuserInfo(ProUserBean tempLoginUserBean2) {
		
		return ProuserMapper.getLoginProuserInfo(tempLoginUserBean2);
	
	} 
	
	public List<String> getSearchProUserByName(String pro_name) {
		
		return ProuserMapper.getSearchProUserByName(pro_name);
		
	}  
	
	public String getCategory1(Long pro_id) {
	      
	      return ProuserMapper.getCategory1(pro_id);
	   }
	   
	public String getCategory2(Long pro_id) {
	      
	      return ProuserMapper.getCategory2(pro_id);
	   }

	public String getCategory3(Long pro_id) {
	   
	   return ProuserMapper.getCategory3(pro_id);
	}
	
	// 
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
	 
	public void addProuserInfo(ProUserBean joinProuserBean) {
			
			ProuserMapper.addProuserInfo(joinProuserBean);
		}
	  
	
	public String getProUserName(int pro_id) {
		
		return ProuserMapper.getProUserName(pro_id);
	}
	
	//사용자 이름 수정
	public void modifyProName(String pro_name, int pro_id) {
		
		ProuserMapper.modifyProName(pro_name, pro_id);
	}  
	 
	//카테고리 수정
	public void modifyCategory(String active_detailcategory1,int pro_id) {
		
		ProuserMapper.modifyCategory(active_detailcategory1,pro_id);
	}
	
	public void modifyCategory2(String active_detailcategory2,int pro_id) {
		
		ProuserMapper.modifyCategory2(active_detailcategory2,pro_id);
	}
	
	public void modifyCategory3(String active_detailcategory3,int pro_id) {
		
		ProuserMapper.modifyCategory3(active_detailcategory3,pro_id);
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
	
	//일류 지역
	//ProUserDao
   public String getActive_location(int pro_id) {
         
         return ProuserMapper.getActive_location(pro_id);
    }
   
   public void modifyActive_location(String active_location, int pro_id) {
         
      ProuserMapper.modifyActive_location(active_location, pro_id);
   }
   
}
