package kr.co.softsoldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChattingController {

	@GetMapping("/ChattingList")
	public String ChattingList() {
		
		return "/ChattingList";
	}
	
	@GetMapping("/chatting")
	public String chatting() {
		
		return "/chatting";
	}
	
	
}
