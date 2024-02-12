package kr.co.softsoldesk.service;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.PageBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.dao.ProUserDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class ProUserService {

	@Autowired
	private ProUserDao proUserDao;
	
	@Resource(name = "loginProuserBean")
	private ProUserBean loginProuserBean;
	
	@Value("${page.listcnt}")
	private int page_listcnt;
	
	@Value("${page.paginationcnt}")
	private int page_paginationcnt;
	
	public boolean checkProuserEmailExist(String pro_email) {
		System.out.println("ProUserService pro_email:"+pro_email);
		String pro_name = proUserDao.checkProuserEmailExist(pro_email);
		if(pro_name == null) {
			System.out.println("ProUserService pro_name:"+pro_name);
			return true;
		}else {
			return false;
		}	 
	}
	
	public void addProuserInfo(ProUserBean joinProuserBean) {
		 
		proUserDao.addProuserInfo(joinProuserBean);
	} 
	

	public void getLoginProuserInfo(ProUserBean tempLoginUserBean2) {
		
		 ProUserBean tempLoginProuserBean3 = proUserDao.getLoginProuserInfo(tempLoginUserBean2);
		
		if(tempLoginProuserBean3 != null) {
			loginProuserBean.setPro_id(tempLoginProuserBean3.getPro_id());
			loginProuserBean.setPro_email(tempLoginProuserBean3.getPro_email());
			loginProuserBean.setPro_pwd(tempLoginProuserBean3.getPro_pwd());
			loginProuserBean.setPro_name(tempLoginProuserBean3.getPro_name());
			loginProuserBean.setProuserLogin(true);
		}
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 일류 이메일:"+tempLoginProuserBean3.getPro_email());
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 일류 이름:"+tempLoginProuserBean3.getPro_name());
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 일류 번호:"+tempLoginProuserBean3.getPro_id());
		System.out.println("Service 현재 로그ㅡㅡ그으ㅡㅇ 일류 비밀번호:"+tempLoginProuserBean3.getPro_pwd());
	} 
	
	
	 public List<String> getSearchProUserByName(String pro_name) {
	        return proUserDao.getSearchProUserByName(pro_name);
	    } 
	 
	 //
	    public ProUserBean getDetailCategoriesByName(String pro_name) { 
	        return proUserDao.getDetailCategoriesByName(pro_name);
	    }
	    
	    //
	    public ProUserBean getCategoriesByProId(Long proId) { 
	    	return proUserDao.getCategoriesByProId(proId);
	    }
	 //
	 public List<String> getRecoProUserByName(String reco) {
		 return proUserDao.getRecoProUserByName(reco);
	 }
	
	 public List<ProUserBean> getProUserByName(int page, int size) {

		 int offset = (page - 1) * size;
	        RowBounds rowBounds = new RowBounds(offset, size);
	        return proUserDao.getProUserByName(rowBounds);
	 }
	 
	 public PageBean getProCnt(int currentPage) { 
			int content_cnt = proUserDao.getProCnt();
			
			PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
			
			return pageBean;
		}
	 
	 public List<String> getProCategoryAndLocation(String selectedCategory,String active_location) {
		 System.out.println("ProUserService-getProCategoryAndLocation 호출!");
		 return proUserDao.getProCategoryAndLocation(selectedCategory,active_location);
	 }
	 
	 public List<String> getselectedCategory(String selectedCategory) { 
		 System.out.println("ProUserService-getselectedCategory 호출!");
			return proUserDao.getselectedCategory(selectedCategory); 
		} 

	public List<String> getselectedLocation(String active_location) { 
		 System.out.println("ProUserService-getselectedLocation 호출!");
		return proUserDao.getselectedLocation(active_location); 
	}  
	
	public void ProupdateAccountUser(ProUserBean ProAccountModifyCom)  {
		if(ProAccountModifyCom != null) {
			loginProuserBean.setPro_id(loginProuserBean.getPro_id());
			loginProuserBean.setPro_email(ProAccountModifyCom.getPro_email());
			loginProuserBean.setPro_pwd(ProAccountModifyCom.getPro_pwd());
			loginProuserBean.setPro_name(ProAccountModifyCom.getPro_name());
			loginProuserBean.setProuserLogin(true);
		} 
		
		System.out.println("============UserService-updateAccountUser수행========================");
		System.out.println("수정된 일류 아이디:"+ProAccountModifyCom.getPro_id());
		System.out.println("수정된 일류 이름:"+ProAccountModifyCom.getPro_email());
		System.out.println("수정된 일류 이메일:"+ProAccountModifyCom.getPro_pwd());
		System.out.println("수정된 일류 비밀번호:"+ProAccountModifyCom.getPro_name());
		System.out.println("========================================================================");

		proUserDao.ProupdateAccountUser(ProAccountModifyCom);
	}
	public int ProAccountResign(int pro_id) {
		return proUserDao.ProAccountResign(pro_id);
	}

	public List<ProUserBean> getProCategoryname(List<String> pro_name) {
		// TODO Auto-generated method stub
		return null;
	}
}

