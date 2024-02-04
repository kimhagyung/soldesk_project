package kr.co.softsoldesk.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
 
import kr.co.softsoldesk.beans.DetailCategoryBean;
import kr.co.softsoldesk.beans.ServiceCategoryBean;
import kr.co.softsoldesk.service.DetailCategoryService;
import kr.co.softsoldesk.service.ServiceCategoryService;

@Controller
@RequestMapping("/search")
public class SearchController {
	@Autowired
	ServiceCategoryService serviceCategoryService;
	
	@Autowired
	DetailCategoryService detailCategoryService;
	 
	@GetMapping("/findPro")
	public String findPro(Model model) {
	    
	    ArrayList<List<DetailCategoryBean>> detailCategoryList = new ArrayList<>();
	    ArrayList<String> service_Category_Name = new ArrayList<>();
	    
	    for (int i = 1; i <= 8; i++) {
	        List<DetailCategoryBean> list1 = detailCategoryService.getDetailCategoryList(i);
	        String categoryName = detailCategoryService.getServiceCategoryName(i);
	        
	        detailCategoryList.add(list1);
	        service_Category_Name.add(categoryName);
	    }
	    
	    model.addAttribute("detailCategoryList", detailCategoryList);
	    model.addAttribute("service_category_name", service_Category_Name); 
	    
	    return "search/findPro";
	}

}
