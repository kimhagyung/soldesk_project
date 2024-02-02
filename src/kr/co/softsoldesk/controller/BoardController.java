package kr.co.softsoldesk.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.softsoldesk.beans.PostBean;
import kr.co.softsoldesk.service.PostService;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	PostService postService;

	@GetMapping("/community")
	public String community(Model model) {
		
		List<PostBean> postList = postService.getAllPostList();
		model.addAttribute("postList", postList);
		
		return "board/community";
	}
	
	@GetMapping("/post") // /board/main
	public String write(@ModelAttribute("boardPostBean") PostBean boardPostBean) {
		
		//System.out.println(boardPostBean);
		
		return "board/post";
	}
	
	@PostMapping("/post_pro")
	public String write_pro(@Valid @ModelAttribute("boardPostBean") PostBean boardPostBean, 
							BindingResult result) {
		
		//System.out.println( boardPostBean.getContent());
		//System.out.println(boardPostBean.getTitle());
		
		if(result.hasErrors()) {
			return "board/post";
		}
		
		postService.addPostInfo(boardPostBean);
		
		
		return "board/post_success";
	}
	
	@GetMapping("/detailCommunity")
	public String detailCommunity() {
		
		return "board/detailCommunity";
	}
}
