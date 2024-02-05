package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
	 
	@GetMapping("/autocomplete")
    public List<DetailCategoryBean> autocomplete(@RequestParam("searchKeyword") String searchKeyword) {
        List<DetailCategoryBean> autocompleteSuggestions = detailCategoryService.getAutocompleteSuggestions(searchKeyword);
        System.out.println("autocompleteSuggestions: " + autocompleteSuggestions);
        System.out.println("autocompleteSuggestions: " + autocompleteSuggestions);
        return autocompleteSuggestions;
    }
	
	@GetMapping("/search/getCategoryInfo")
	public List<String> getCategoryInfo(@RequestParam("selectedCategory") String selectedCategory) {
		System.out.println("RestApiController-selectedCategory:"+selectedCategory);
        List<String> proActive = proUserService.getProCategoryAndLocation(selectedCategory);
        System.out.println("RestApiController-proActive:"+proActive);
        return proActive;
    } 
}
