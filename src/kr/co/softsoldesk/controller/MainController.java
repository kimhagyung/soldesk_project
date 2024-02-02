package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.softsoldesk.beans.DetailCategoryBean;
import kr.co.softsoldesk.beans.QuestionBean;
import kr.co.softsoldesk.beans.ServiceCategoryBean;
import kr.co.softsoldesk.service.DetailCategoryService;
import kr.co.softsoldesk.service.ServiceCategoryService;

@Controller
public class MainController {

	@Autowired
	ServiceCategoryService serviceCategoryService;
	
	@Autowired
	DetailCategoryService detailCategoryService;
	
	//@Autowired
	QuestionBean questionBean;
	
	
	@GetMapping("/index")
	public String index(Model model) {

		List<ServiceCategoryBean> categoryList = serviceCategoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);

		return "index";
	}
	
	@GetMapping("/searchDetailCategories")
    public String searchDetailCategories(@RequestParam(name = "searchKeyword", required = false) String searchKeyword, Model model) {
        List<DetailCategoryBean> searchResult = detailCategoryService.getSearchDetailCategories(searchKeyword);
        // 결과를 모델에 담아서 뷰로 전달
        model.addAttribute("searchResult", searchResult);
        model.addAttribute("searchKeyword", searchKeyword);
        
        System.out.println("searchResult:"+searchResult);
        System.out.println("searchKeyword:"+searchKeyword);
        // 뷰의 이름을 반환
        return "/Questions"; // yourViewName은 실제 사용하는 뷰의 이름으로 대체해야 합니다.
    }
	
	 
	
	@GetMapping("/detailCategory")
	public String detailCategory(@RequestParam("service_category_id") int service_category_id, Model model) {

		List<ServiceCategoryBean> categoryList = serviceCategoryService.getCategoryList();

		model.addAttribute("categoryList", categoryList);
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
	public String Questions(Model model,@RequestParam("service_category_id") int service_category_id) {
		
		model.addAttribute("시험/자격증", questionBean.getCertifaction_exam());
		model.addAttribute("인테리어", questionBean.getInterior()); 
		model.addAttribute("가전제품", questionBean.getAppliance()); 
		model.addAttribute("청소", questionBean.getCleaning()); 
		model.addAttribute("번역", questionBean.getTranslation()); 
		model.addAttribute("문서", questionBean.getDevelopment()); 
		model.addAttribute("개발외주", questionBean.getDocument()); 
		model.addAttribute("반려동물", questionBean.getPet()); 
		
		model.addAttribute("service_category_id", service_category_id);
		//System.out.println("서비스카테고리번호:"+service_category_id);
		String serviceCategoryname = detailCategoryService.getServiceCategoryName(service_category_id);
		model.addAttribute("serviceCategoryname", serviceCategoryname);
		  
		return "/Questions";
	}
	@GetMapping("/Questions2")
	public String Questions2(){
		return "/Questions2";
	}


}