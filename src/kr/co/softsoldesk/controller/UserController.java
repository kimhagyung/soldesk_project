package kr.co.softsoldesk.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@GetMapping("/join")
	public String join(@ModelAttribute("joinUserBean") UserBean joinUserBean) {
		
		return "user/join";
	}
	
	@PostMapping("/join_user")
	public String join_pro(@Valid @ModelAttribute("joinUserBean") UserBean joinUserBean, BindingResult result) {
		if(result.hasErrors()) {
			return "user/join";
		}
		userService.addUserInfo(joinUserBean);
		
		return "user/join_success";
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
