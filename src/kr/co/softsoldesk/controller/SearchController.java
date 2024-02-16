package kr.co.softsoldesk.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.beans.CareerBean;
import kr.co.softsoldesk.beans.DetailCategoryBean;
import kr.co.softsoldesk.beans.ExpertBean;
import kr.co.softsoldesk.beans.PageBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.ReviewBean;
import kr.co.softsoldesk.service.DetailCategoryService;
import kr.co.softsoldesk.service.ProProfileService;
import kr.co.softsoldesk.service.ProUserService;
import kr.co.softsoldesk.service.ReviewService;
import kr.co.softsoldesk.service.ServiceCategoryService;

@Controller
@RequestMapping("/search")
public class SearchController {
	@Autowired
	ServiceCategoryService serviceCategoryService;
	
	@Autowired
	DetailCategoryService detailCategoryService;
	
	@Autowired
	ProUserService proUserService;
	
	@Autowired
	ProProfileService proprofileservice;
	
	@Autowired
	private ReviewService reviewService;
	
	 
	@GetMapping("/findPro")
	public String findPro(@RequestParam(defaultValue = "1") int page, 
            @RequestParam(defaultValue = "10") int size,Model model) {
	    
	    ArrayList<List<DetailCategoryBean>> detailCategoryList = new ArrayList<>();
	    ArrayList<String> service_Category_Name = new ArrayList<>();
	    
	    for (int i = 1; i <= 8; i++) {
	        List<DetailCategoryBean> list1 = detailCategoryService.getDetailCategoryList(i);
	        String categoryName = detailCategoryService.getServiceCategoryName(i);
	        
	        detailCategoryList.add(list1);
	        service_Category_Name.add(categoryName);
	    }
	    PageBean pageBean = proUserService.getProCnt(page);
		model.addAttribute("pageBean", pageBean);
		
		model.addAttribute("page", page);
	    
	    model.addAttribute("detailCategoryList", detailCategoryList);
	    model.addAttribute("service_category_name", service_Category_Name);  
	     
	    List<ProUserBean> pro_names = proUserService.getProUserByName(page, size);
	    model.addAttribute("pro_names",pro_names); 
	    model.addAttribute("currentPage", page);
	    
	    //일류 정보 조회 
	    List<ExpertBean> ProprofileInfo=proprofileservice.getProProfileInfo();
	    
	    for(ExpertBean proprofile:ProprofileInfo) {
	    	System.out.println("proprofile 상세설명 :"+proprofile.getPro_detailed_introduction());
	    	System.out.println("proprofile 이미지:"+proprofile.getPro_profile_image());
	    	System.out.println("proprofile 프로아이디:"+proprofile.getPro_id());
	    }
	    
	    model.addAttribute("ProprofileInfo",ProprofileInfo);
	    
	  //경력 정보 조회 
	    List<CareerBean> CareerInfo=proprofileservice.getCareerInfo();
	    
	    for(CareerBean career:CareerInfo) {
	    	System.out.println("career 총 경력:"+career.getTotal_experience_period());
	    }
	    model.addAttribute("CareerInfo",CareerInfo);
	    
	    //별점조회 
	    List<Integer> reviewCnt = new ArrayList<>();
	    List<Float> reviewAvgg = new ArrayList<>(); 
	    
	    for(ExpertBean proprofile:ProprofileInfo) {
		    int reviewcnt=reviewService.getReviewCnt(proprofile.getPro_id());
		    Float reviewAvg=reviewService.getAvgReview(proprofile.getPro_id());
		    
		    System.out.println("reviewcnt :" +reviewcnt);
		    System.out.println("reviewAvg :" +reviewAvg);
		    reviewCnt.add(reviewcnt);
		    reviewAvgg.add(reviewAvg);
	    }
	    List<ReviewBean> allreview=proprofileservice.getAllReview();
	    for(ReviewBean allrei:allreview) {
	    	System.out.println("allreview 아이디 :"+allrei.getPro_id());
	    }
	    model.addAttribute("allreview",allreview);

	    model.addAttribute("reviewCnt",reviewCnt);
	    model.addAttribute("reviewAvgg",reviewAvgg);
	    
	    return "search/findPro";
	}
	
	@GetMapping("/searchProName")
	public String searchProName(@RequestParam("searchInput") String searchInput,Model model) {
		System.out.println("searchInput:"+searchInput); //받은 값  
		List<String> search_proname = proUserService.getSearchProUserByName(searchInput);
		model.addAttribute("search_proname",search_proname); //유사한 고수 이름  
		//List<String> activeProUser=proUserService.getProCategoryAndLocation(activeData); //전달받은 값  
		System.out.println("유사한 고수 이름:"+search_proname);
		return "search/findPro";
	}  
}
