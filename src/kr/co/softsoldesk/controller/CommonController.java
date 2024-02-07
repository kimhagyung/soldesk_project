package kr.co.softsoldesk.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.service.UserService;

@Controller
@RequestMapping("/common")
public class CommonController {
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/myPage")
	public String mypage() { 

		return "common/myPage";
	}
}
