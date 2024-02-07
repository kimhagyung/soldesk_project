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
import kr.co.softsoldesk.service.ProUserService;
import kr.co.softsoldesk.service.UserService;

@Controller
@RequestMapping("/common")
public class CommonController {
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;  
	
	@Resource(name = "loginProuserBean")
	private ProUserBean loginProuserBean;
	
	@Autowired
	private UserService userService;
	
	@Autowired 
	private ProUserService prouserService;
	
	
	@GetMapping("/myPage")
	public String mypage() { 
		 
		return "common/myPage";
	}

	@GetMapping("/AccountSetting")
	public String AccountSetting(@ModelAttribute("AccountModifyCom") UserBean AccountModifyCom
								,@ModelAttribute("ProAccountModifyCom") ProUserBean ProAccountModifyCom					 
								,Model model) {
		
		AccountModifyCom.setUser_id(loginUserBean.getUser_id());
		
		
		if(loginUserBean.isUserLogin()==true) {
			AccountModifyCom.setUser_name(loginUserBean.getUser_name());
			AccountModifyCom.setUser_email(loginUserBean.getUser_email());
			AccountModifyCom.setUser_pwd(loginUserBean.getUser_pwd());

			
		}else if(loginProuserBean.isProuserLogin()==true) {
			
			ProAccountModifyCom.setPro_name(loginProuserBean.getPro_name());
			ProAccountModifyCom.setPro_email(loginProuserBean.getPro_email());
			ProAccountModifyCom.setPro_pwd(loginProuserBean.getPro_pwd());
		}

		model.addAttribute("AccountModifyCom", AccountModifyCom);
		model.addAttribute("ProAccountModifyCom", ProAccountModifyCom);
		return "common/AccountSetting";	
	}
	
	@GetMapping("/AccountModify")
	public String AccountModify(Model model,
								@ModelAttribute("AccountModifyCom") UserBean AccountModifyCom
								,@ModelAttribute("ProAccountModifyCom") ProUserBean ProAccountModifyCom) {
		
		if(loginUserBean.isUserLogin()==true) {
			
			AccountModifyCom.setUser_name(loginUserBean.getUser_name());
			AccountModifyCom.setUser_email(loginUserBean.getUser_email());
			AccountModifyCom.setUser_pwd(loginUserBean.getUser_pwd());
			System.out.println("===========================");
			System.out.println(AccountModifyCom.getUser_id());
			System.out.println("==========================");
			
		}else if(loginProuserBean.isProuserLogin()==true) {
			
			ProAccountModifyCom.setPro_name(loginProuserBean.getPro_name());
			ProAccountModifyCom.setPro_email(loginProuserBean.getPro_email());
			ProAccountModifyCom.setPro_pwd(loginProuserBean.getPro_pwd());
			
		}
		
		//System.out.println("22ㅁㅇㅁㅇㅁㅇㅁㅇㅁㅇㅁㅇㅁㅇㅁㅇㅁㅇㅁㅇㅁ22");
		//System.out.println(AccountModifyCom.getUser_id());
		//System.out.println("22ㅁㅇㅁㅇㅁㅇㅁㅇㅁㅇㅁㅇㅁㅇㅁㅇㅁㅇㅁㅇㅁ222");
		//System.out.println(ProAccountModifyCom.getPro_id());
		model.addAttribute("AccountModifyCom", AccountModifyCom);
		model.addAttribute("ProAccountModifyCom", ProAccountModifyCom);
		
	 
		return "common/AccountModify";
	}
	
	//일반 사용자 계정 수정 
	@PostMapping("/AccountModify_user")
	public String AccountModify_pro(@Valid @ModelAttribute("AccountModifyCom") UserBean AccountModifyCom
									, BindingResult result, Model model ) {
		
		System.out.println("3333333333333333333333333333");
		AccountModifyCom.setUser_id(loginUserBean.getUser_id());
		System.out.println(AccountModifyCom.getUser_id());
		
		if(result.hasErrors()) {
			return "common/AccountModify";
		} 
		
		userService.updateAccountUser(AccountModifyCom);
		
		
		return "common/AccountModify_succes";
		
		
	}
	
	//일류 계정 수정 
	@PostMapping("/AccountModify_Pro")
	public String AccountModify_Pro(@Valid @ModelAttribute("ProAccountModifyCom") ProUserBean ProAccountModifyCom
			,BindingResult result, Model model ) {
		
		System.out.println("3333333333333333333333333333");
		ProAccountModifyCom.setPro_id(loginProuserBean.getPro_id());
		System.out.println(ProAccountModifyCom.getPro_id());
		
		if(result.hasErrors()) {
			return "common/AccountModify";
		} 
		
		prouserService.ProupdateAccountUser(ProAccountModifyCom);
	 
		return "common/AccountModify_succes";
		 
	}
	
	@GetMapping("/AccountSecession")
	public String AccountSecession(@RequestParam("id") int id) {
		prouserService.ProAccountResign(id);
		return "user/pro_join";
	}
	
}
