package kr.co.softsoldesk.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.Validator.ProUserValidator;
import kr.co.softsoldesk.Validator.UserValidator;
import kr.co.softsoldesk.beans.Category;
import kr.co.softsoldesk.beans.ExpertBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;
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

	@Resource(name = "loginProuserBean")
	private ProUserBean loginProuserBean;
	  
	 
	@Autowired
	private ProUserBean cateProuser;

	//일반 회원 로그인
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
		System.out.println("loginUserBean : "+loginUserBean.getUser_name());
		if(loginUserBean.isUserLogin() == true) {
			
			return "user/login_succes";
			
		}else {
			
			return "user/login_fail";
		}
	}
	
	//고수 로그인
	@GetMapping("/pro_login")
	public String pro_login(@ModelAttribute("tempLoginUserBean2") ProUserBean tempLoginUserBean2,
						@RequestParam(value = "fail", defaultValue = "false") boolean fail,
						Model model) {
		
		model.addAttribute("fail", fail);
		
		return "user/pro_login";
	}
	
	@PostMapping("/proUser_login")
	public String pro_Login(@Valid @ModelAttribute("tempLoginUserBean2") ProUserBean tempLoginUserBean2, 
							BindingResult result) {
		
		if(result.hasErrors()) {
		
			return "user/pro_login";
		}
		ProuserService.getLoginProuserInfo(tempLoginUserBean2);
		System.out.println("userBeanController_pro:"+tempLoginUserBean2.getPro_name()); 
		System.out.println("loginUserBean_pro : "+loginProuserBean.getPro_name());
		if(loginProuserBean.isProuserLogin() == true) {
			
			return "user/login_succes";
			
		}else {
			
			return "user/pro_login_fail";
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
	@GetMapping("/pro_logout")
	public String pro_logout() {
		 
		loginProuserBean.setProuserLogin(false);
		
		return "user/pro_logout";
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
	public String pro_join(@ModelAttribute("joinProuserBean") ProUserBean joinProuserBean,
						   Model model) {
		//List<Category> categories = getCategoryList();
		
	    model.addAttribute("categories", cateProuser.getCategoryList()); 
		return "user/pro_join";
	}
	
	//일류가입 
	@PostMapping("/join_Prouser")
	public String join_Prouser(@Valid @ModelAttribute("joinProuserBean") ProUserBean joinProuserBean, BindingResult result) {
		if(result.hasErrors()) {
			return "user/pro_join";
		}
		ProuserService.addProuserInfo(joinProuserBean);
		/*
		System.out.println("유저 컨트롤러에서 가입된 일류 아이디 :"+joinProuserBean.getPro_id()+1);
		System.out.println("유저 컨트롤러에서 가입된 일류 이름 :"+joinProuserBean.getPro_name());
		
	    expertBean.setPro_id(joinProuserBean.getPro_id()+1); 
	   
	    // Add ProProfileInfo with pro_id
		ExpertBean expertBean = new ExpertBean();
	    ProuserService.addProProfileInfo(expertBean);
	     */
	    
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

/*
	@InitBinder
	public void initBinder(WebDataBinder blinder) { 
		 
		UserValidator validator1 = new UserValidator();
		ProUserValidator validator2 = new ProUserValidator();
		blinder.addValidators(validator1);
		blinder.addValidators(validator2);
		 
		 
	} 
*/
}