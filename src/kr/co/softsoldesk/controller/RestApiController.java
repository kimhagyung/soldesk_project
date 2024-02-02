package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.softsoldesk.beans.DetailCategoryBean;
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
	private DetailCategoryBean detailCategoryService;
	
	@GetMapping("/autocomplete")
    public String autocomplete(@RequestParam("searchKeyword") String searchKeyword, Model model) {
        List<String> autocompleteSuggestions = detailCategoryService.getAutocompleteSuggestions(searchKeyword);
	
        // 자동완성 결과를 모델에 추가
        model.addAttribute("autocompleteSuggestions", autocompleteSuggestions);
        System.out.println("autocompleteSuggestions"+autocompleteSuggestions);
        // 자동완성 결과를 보여줄 뷰 페이지의 경로를 반환
        return ""; // 여기에는 자동완성 결과를 보여줄 뷰 페이지의 경로를 적어주세요.
  }
}
