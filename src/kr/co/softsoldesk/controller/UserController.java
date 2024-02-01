package kr.co.softsoldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/join")
	public String join() {
		
		return "user/join";
	}
	
	@GetMapping("/login")
	public String login() {
		
		return "user/login";
	}
	
	@GetMapping("/pro_join")
	public String pro_join() {
		
		return "user/pro_join";
	}
	
	@GetMapping("/AccountSetting")
	public String AccountSetting() {
		
		return "user/AccountSetting";
	}
	
	@GetMapping("/AccountModify")
	public String AccountModify() {
		
		return "user/AccountModify";
	}



}
