package kr.co.softsoldesk.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.softsoldesk.beans.BoardBean;

@Controller
@RequestMapping("/board")
public class BoardController {

	@GetMapping("/community")
	public String community() {
		
		return "board/community";
	}
	
	@GetMapping("/post")
	public String post(@ModelAttribute("boardPostBean") BoardBean boardPostBean) {
		
		return "board/post";
	}
	
	@PostMapping("/post_pro")
	public String post_pro(@Valid @ModelAttribute("boardPostBean")  BoardBean boardPostBean, BindingResult result) {
		
		if(result.hasErrors()) {
			return "board/post";
		}
		
		return "board/post_success";
	}
}
