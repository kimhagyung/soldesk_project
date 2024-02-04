package kr.co.softsoldesk.controller;

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
	
	
	@GetMapping("/user/checkUserEmailExist/{user_email:.+}")
	public String checkUserEmailExist(@PathVariable String user_email) {
		
		boolean chk = userService.checkuserEmailExist(user_email);
		
		return chk+"";
	}
	
	@Autowired
	private ProUserService proUserSerivce;
	
	@GetMapping("/user/checkProuserEmailExist/{pro_email:.+}")
	public String checkProuserEmailExist(@PathVariable String pro_email) {
		
		boolean chk = proUserSerivce.checkProuserEmailExist(pro_email);
		
		return chk+"";
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
}
