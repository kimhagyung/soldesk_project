package kr.co.softsoldesk.controller;

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

import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.dao.ProUserDao;
import kr.co.softsoldesk.service.ProUserService;
import kr.co.softsoldesk.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private ProUserService ProuserService;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;

	@GetMapping("/login")
	public String login(@ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean,
						@RequestParam(value = "fail", defaultValue = "false") boolean fail,
						Model model) {
		
		model.addAttribute("fail", fail);
		
		return "user/login";
	}
	@PostMapping("/login_pro")
	public String login_pro(@Valid @ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean, 
							BindingResult result) {
		
		if(result.hasErrors()) {
		
			return "user/login";
		}
		userService.getLoginUserInfo(tempLoginUserBean);
		System.out.println("userBeanController:"+tempLoginUserBean.getUser_name());
		System.out.println("userBeanController 현재 로그인 상태??????/???:"+tempLoginUserBean.isUserLogin());
		if(loginUserBean.isUserLogin() == true) {
			
			return "user/login_succes";
			
		}else {
			
			return "user/login_fail";
		}
	}
	
	@GetMapping("/not_login")
	public String not_login() {
		
		return "user/not_login";
	}

	@GetMapping("/logout")
	public String logout() {
		
		loginUserBean.setUserLogin(false);
		
		return "user/logout";
	}
	
	
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

	//일류가입
	@GetMapping("/pro_join")
	public String pro_join(@ModelAttribute("joinProuserBean") ProUserBean joinProuserBean) {
		
		return "user/pro_join";
	}
	
	//일류가입 
	@PostMapping("/join_Prouser")
	public String join_Prouser(@Valid @ModelAttribute("joinProuserBean") ProUserBean joinProuserBean, BindingResult result) {
		if(result.hasErrors()) {
			return "user/join";
		}
		ProuserService.addUserInfo(joinProuserBean);
		
		return "user/join_success";
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
