package kr.co.softsoldesk.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.CateProuserBean;
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
	
	
	public String getProUserName(int pro_id) {
		
		return proUserDao.getProUserName(pro_id);
	}
	
	//이름 수정
	public void modifyProName(String pro_name, int pro_id) {
		
		proUserDao.modifyProName(pro_name, pro_id);
	}
	//public List<Map<String, String>> getCategoryList(int pro_id) {
		
		//return proUserDao.getCategoryList(pro_id);
	//}
	
	//public ProUserBean getCategoryList(int pro_id) {
		
	//	return proUserDao.getCategoryList(pro_id);
	//}
	
	public String getCategory1(int pro_id) {
		
		return proUserDao.getCategory1(pro_id);
	}
	
	public String getCategory2(int pro_id) {
			
			return proUserDao.getCategory2(pro_id);
		}
	
	public String getCategory3(int pro_id) {
		
		return proUserDao.getCategory3(pro_id);
	}
	
	//카테고리 수정
	public void modifyCategory(String active_detailcategory1,int pro_id) {
		
		proUserDao.modifyCategory(active_detailcategory1,pro_id);
	}
	
	public void modifyCategory2(String active_detailcategory2,int pro_id) {
		
		proUserDao.modifyCategory2(active_detailcategory2,pro_id);
	}
	
	public void modifyCategory3(String active_detailcategory3,int pro_id) {
		
		proUserDao.modifyCategory3(active_detailcategory3,pro_id);
	}
	
	//카테고리 삭제
	public void deleteCategory1(int pro_id) {
		
		proUserDao.deleteCategory1(pro_id);
	}
	
	public void deleteCategory2(int pro_id) {
			
		proUserDao.deleteCategory2(pro_id);
	}
	
	public void deleteCategory3(int pro_id) {
		
		proUserDao.deleteCategory3(pro_id);
	}
	
	//일류 지역
	//ProUserService
   public String getActive_location(int pro_id) {
         
         return proUserDao.getActive_location(pro_id);
      }
   
   public void modifyActive_location(String active_location, int pro_id) {
         
         proUserDao.modifyActive_location(active_location, pro_id);
      }

}

