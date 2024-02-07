package kr.co.softsoldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping; 

@Controller 
public class MyPageController {

	@GetMapping("/calender")
	public String calender() {
		
		return "calender";
	}
	
	
	
}
