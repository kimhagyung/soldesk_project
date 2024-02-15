package kr.co.softsoldesk.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.softsoldesk.beans.AdminBean;
import kr.co.softsoldesk.beans.PostBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController { 

	/*
	 * @Resource(name = "AdminloginBean") private AdminBean AdminloginBean;
	 */
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/index")
	public String index() {
		return "admin/index";
	}
	
	@GetMapping("/community")
	public String community(Model model) {
		List<PostBean> boardAll=adminService.getAllUBoard();
		
		 
	    List<String> allnames = new ArrayList<>(); 
 
	    for (PostBean board : boardAll) {  
	        String proUserName = adminService.getPostProUserName(board.getBoard_id());
	        String userName = adminService.getPostUserName(board.getBoard_id()); 
	        if( proUserName != null) { 
	        	allnames.add(proUserName);  
		        System.out.println("proUserNames:"+allnames); 
	        } 
	        else if (userName != null) {
	        	allnames.add(userName);
		        System.out.println("userNames:"+allnames); ;  
	        }  
	    } 

		//보드 가져오기 
	    model.addAttribute("allnames", allnames);  
		model.addAttribute("boardAll",boardAll);
		//이름 조회 
		return "admin/community";
	}
	
	@GetMapping("/category")
	public String category() {
		return "admin/category";
	}
	
	@GetMapping("/Completportfolio")
	public String Completportfolio() {
		return "admin/Completportfolio";
	}
	
	@GetMapping("/forbiddenWords")
	public String forbiddenWords() {
		return "admin/forbiddenWords";
	}
	
	@GetMapping("/portfolioIncpection")
	public String portfolioIncpection() {
		return "admin/portfolioIncpection";
	}
	
	@GetMapping("/pro")
	public String pro(Model model) {
		
		List<ProUserBean> allpros=adminService.getAllUProUsers();
		model.addAttribute("allpros", allpros);
		
		 
		return "admin/pro";
	}
	
	@GetMapping("/user")
	public String user(Model model) {
		
		List<UserBean> allusers=adminService.getAllUsers();
		model.addAttribute("allusers",allusers);
		
		 
		return "admin/user";
	}
	
	@GetMapping("/adminLogin")
	public String adminLogin(@ModelAttribute("adminTempLoginBean") AdminBean adminTempLoginBean,
				@RequestParam(value = "fail", defaultValue = "false") boolean fail,Model model) {
		model.addAttribute("fail", fail);
		return "admin/adminLogin";
	}
	/*
	@PostMapping("/adminLogin_pro")
	public String adminLogin_pro(@ModelAttribute("adminTempLoginBean") AdminBean adminTempLoginBean) {
		
		try {
			adminService.getLoginadminInfo(adminTempLoginBean); 
			System.out.println("AdminController-getUser_name:"+adminTempLoginBean.getAdmin_id());
			if(AdminloginBean.isAdminLogin() == true) { 
				return "admin/login_succes"; 
			}else {
				return "admin/login_fail";
			}
			}catch (NullPointerException e) {
		        e.printStackTrace();
		        // NullPointerException이 발생하면 로그인 실패로 처리
		        return "admin/login_fail";
		    } 
	}
	*/
	  @PostMapping("/deleteUsers")
	    public ModelAndView deleteUsers(@RequestParam("user_id") int user_id) {
	        ModelAndView modelAndView = new ModelAndView();
	        System.out.println("user_id:"+user_id);
	        // 회원 삭제 기능을 수행하는 서비스 메서드 호출
	        adminService.deleteUser(user_id); 
	        // 삭제 후, 관리자 페이지로 이동
	        modelAndView.setViewName("redirect:/admin/user");

	        return modelAndView;
	
	  }
	  
	   @PostMapping("/deletePros")
	    public ModelAndView deletePros(@RequestParam("pro_id") int pro_id) {
	        ModelAndView modelAndView = new ModelAndView();
	        System.out.println("pro_id:"+pro_id);
	        // 회원 삭제 기능을 수행하는 서비스 메서드 호출
	        adminService.deleteProUser(pro_id);
	        // 삭제 후, 관리자 페이지로 이동
	        modelAndView.setViewName("redirect:/admin/pro");
	
	        return modelAndView;
	
	  }
	   // !!! 게시글 삭제 !!!
	   @PostMapping("/deletePost")
	   public ModelAndView deletePost(@RequestParam("board_id") int board_id) {
	       ModelAndView modelAndView = new ModelAndView();
	       System.out.println("board_id:"+board_id);
	           adminService.deletePost(board_id);
	           modelAndView.setViewName("redirect:/admin/community");
	       
	       return modelAndView;
	   }
	   
}
