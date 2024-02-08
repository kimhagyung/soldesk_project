package kr.co.softsoldesk.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.softsoldesk.beans.DetailCategoryBean;
import kr.co.softsoldesk.service.DetailCategoryService;
import kr.co.softsoldesk.service.ProUserService;
import kr.co.softsoldesk.service.UserService;

@RestController
public class RestApiController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ProUserService proUserService;
	
	
	@GetMapping("/user/checkUserEmailExist/{user_email:.+}")
	public boolean checkUserEmailExist(@PathVariable String user_email) {
		
		boolean chk = userService.checkuserEmailExist(user_email);
		System.out.println("RestApiController-checkUserEmailExist: "+chk);
		return chk;
	}
	
	@Autowired
	private ProUserService proUserSerivce;
	
	@GetMapping("/user/checkProuserEmailExist/{pro_email:.+}")
	public boolean checkProuserEmailExist(@PathVariable String pro_email) {
		
		boolean chk = proUserSerivce.checkProuserEmailExist(pro_email);
		System.out.println("RestApiController-checkProuserEmailExist: "+chk);
		return chk;
	}

	@Autowired
	private DetailCategoryService detailCategoryService;
	 
	@GetMapping("/autocomplete") //header.jsp
    public List<DetailCategoryBean> autocomplete(@RequestParam("searchKeyword") String searchKeyword) {
        List<DetailCategoryBean> autocompleteSuggestions = detailCategoryService.getAutocompleteSuggestions(searchKeyword);
        System.out.println("autocompleteSuggestions: " + autocompleteSuggestions);
        System.out.println("autocompleteSuggestions: " + autocompleteSuggestions);
        return autocompleteSuggestions;
    }
	
	@GetMapping("/search/getCategoryInfo") //findPro.jsp
	public List<String> getCategoryInfo(
	        @RequestParam(name = "selectedCategory", required = false) String selectedCategory,
	        @RequestParam(name = "active_location", required = false) String active_location) {

        System.out.println("RestApiController-selectedCategory: " + selectedCategory);
        System.out.println("RestApiController-selectedLocation: " + active_location);
 
        // 기본값으로 빈 리스트를 설정
        List<String> proActive = new ArrayList<>(); // proActive 선언 및 초기화
 
        if (selectedCategory != null && active_location != null) {
            // 두 값 모두가 존재할 경우
            proActive = proUserService.getProCategoryAndLocation(selectedCategory, active_location);
        } else if (selectedCategory != null) {
            // selectedCategory만 존재할 경우
            proActive = proUserService.getselectedCategory(selectedCategory);
        } else if (active_location != null) {
            // active_location만 존재할 경우
            proActive = proUserService.getselectedLocation(active_location);
        }

        
        System.out.println("RestApiController-proActive: " + proActive);
        return proActive;
    }

}
