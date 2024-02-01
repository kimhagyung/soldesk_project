package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;
import kr.co.softsoldesk.beans.DetailCategoryBean;
import kr.co.softsoldesk.beans.ServiceCategoryBean;
import kr.co.softsoldesk.service.ServiceCategoryService;

@Controller
public class MainController {
	@GetMapping("/index")
	public String main() {	

	@Autowired
	ServiceCategoryService serviceCategoryService;
	
	@Autowired
	DetailCategoryService detailCategoryService;

	@GetMapping("/index")
	public String index(Model model) {

		List<ServiceCategoryBean> categoryList = serviceCategoryService.getCategoryList();

		model.addAttribute("categoryList", categoryList);

		return "index";
	}

	// @GetMapping("/index")
	// public String main() {

	// return "index"; }

	@GetMapping("/detailCategory")
	public String detailCategory(@RequestParam("service_category_id") int service_category_id, Model model) {

		List<ServiceCategoryBean> categoryList = serviceCategoryService.getCategoryList();

		model.addAttribute("categoryList", categoryList);
		
		// ----------------------------------------------------------------
		
		model.addAttribute("service_category_id", service_category_id);
		
		//서비스 카테고리의 이름 가져오기
		String serviceCategoryname = detailCategoryService.getServiceCategoryName(service_category_id);
		model.addAttribute("serviceCategoryname", serviceCategoryname);
		
		//상세 카테고리 정보들
		List<DetailCategoryBean> detailCategoryList = detailCategoryService.getDetailCategoryList(service_category_id);
		model.addAttribute("detailCategoryList", detailCategoryList);
		
		//for (DetailCategoryBean detailCategory : detailCategoryList) {
		//    System.out.println("Service Category ID: " + detailCategory.getService_category_id());
		//    System.out.println("Detail Category Name: " + detailCategory.getDetail_category_name());
		//    System.out.println("file name: " + detailCategory.getFile_name());

		//    System.out.println("-----------------------------");
	//}
	
       
		return "/detailCategory";
	}
	
	@GetMapping("/Questions")
	public String Questions() {
		
		return "/Questions";
	}



}
