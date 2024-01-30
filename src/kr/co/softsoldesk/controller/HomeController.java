package kr.co.softsoldesk.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.softsoldesk.beans.UserBean;

//import kr.co.softsoldesk.beans.UserBean;

@Controller
public class HomeController {
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean; // UserBean이 객체로 만들어지고 초기값 가져옴

	@RequestMapping(value="/", method = RequestMethod.GET)
	public String home() {
		
		System.out.println("HomeController 로그인상태(false:로그아웃) : "+loginUserBean.isUserLogin());
	
		return "redirect:/index";
	}
}
