package kr.co.softsoldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.DetailCategoryBean;
import kr.co.softsoldesk.dao.DetailCategoryDAO;
import kr.co.softsoldesk.dao.ServiceCategoryDAO;

@Service
public class DetailCategoryService {
	
	@Autowired
	private DetailCategoryDAO detailCategoryDao;


	public List<DetailCategoryBean> getDetailCategoryList(int service_category_id) {
		
		List<DetailCategoryBean> detailCategoryList = detailCategoryDao.getDetailCategoryList(service_category_id);
		
		
		return detailCategoryList;
	}
	
	public String getServiceCategoryName(int service_category_id) {
		
		return detailCategoryDao.getServiceCategoryName(service_category_id);
	}
	
}
