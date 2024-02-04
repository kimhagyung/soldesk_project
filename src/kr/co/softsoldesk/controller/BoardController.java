package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.beans.PostBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.service.PostService;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	PostService postService;
	
	@Resource(name="loginUserBean")
	private UserBean loginUserBean;
	
	@Resource(name = "loginProuserBean")
	private ProUserBean loginProuserBean;

	@GetMapping("/community")
	public String community(Model model) {
		
		List<PostBean> postList = postService.getAllPostList();
		model.addAttribute("postList", postList);
		
		return "board/community";
	}
	
	@GetMapping("/post") // /board/main
	public String write(@ModelAttribute("boardPostBean") PostBean boardPostBean, Model model) {
		
		model.addAttribute("boardPostBean", boardPostBean);
		
		return "board/post";
	}
	
	@PostMapping("/post_pro")
	public String write_pro(@Valid @ModelAttribute("boardPostBean") PostBean boardPostBean, 
							BindingResult result,
							@RequestParam("uploadFiles") List<MultipartFile> uploadFiles) {
		
		
		if(result.hasErrors()) {
			return "board/post";
		}
		
		try {
			postService.addBoardPostInfo(boardPostBean, uploadFiles);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "board/post_success";
	}
	
	@GetMapping("/detailCommunity")
	public String detailCommunity(@RequestParam("board_id") int board_id, Model model) {
		//1. 조회수 증가 +1
		postService.plusCnt(board_id);
		//2. 해당 게시글 정보 부르기 
		
		 PostBean readPostBean = postService.getPostInfo(board_id);
		 model.addAttribute("readPostBean", readPostBean);
		 
		 model.addAttribute("board_id", board_id);
		 
		 model.addAttribute("loginUserBean", loginUserBean);
	     model.addAttribute("loginProuserBean", loginProuserBean);

		
		return "board/detailCommunity";
	}
	
	@GetMapping("/not_writer")
	public String not_writer() {
		return "board/not_writer";
	}
	
	
	@GetMapping("/modifyPost")
	public String modifyPost(@RequestParam("board_id") int board_id, @ModelAttribute("modifyPostBean") PostBean modifyPostBean,
							Model model) {
		
		PostBean tempPostBean = postService.getPostInfo(board_id);
		
		modifyPostBean.setTitle(tempPostBean.getTitle());
		modifyPostBean.setContent(tempPostBean.getContent());
		modifyPostBean.setCategory(tempPostBean.getCategory());
		modifyPostBean.setLocation(tempPostBean.getLocation());
		modifyPostBean.setPhotos(tempPostBean.getPhotos());
		modifyPostBean.setBoard_id(tempPostBean.getBoard_id());
		
		model.addAttribute("board_id", board_id);
		
		return "board/modifyPost";
		
	}
	
	@PostMapping("/modifyPost_pro")
	public String modifyPost_pro(@Valid @ModelAttribute("modifyPostBean") PostBean modifyPostBean,
								 BindingResult result) {
		
		if(result.hasErrors()) {
			return "board/modifyPost";
		}
		postService.modifyPostInfo(modifyPostBean);
		
		return "board/modifyPost_success";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("board_id") int board_id) {
		postService.deletePostInfo(board_id);
		
		return "board/delete";
	}
}
