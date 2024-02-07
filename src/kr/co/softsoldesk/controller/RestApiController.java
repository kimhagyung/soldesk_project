package kr.co.softsoldesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

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
}
