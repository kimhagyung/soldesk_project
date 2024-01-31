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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.beans.Category;
import kr.co.softsoldesk.beans.CityData;
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
	public String pro_join(@ModelAttribute("joinProuserBean") ProUserBean joinProuserBean,
						   Model model) {
		List<Category> categories = getCategoryList();
	    model.addAttribute("categories", categories); 
	    
		return "user/pro_join";
	}
	
	//카테고리 값 가져오기 
	 private List<Category> getCategoryList() {
	        List<Category> categories = new ArrayList<>();

	        // Add categories dynamically
	        categories.add(new Category("test_license", "시험/자격증", Arrays.asList("스포츠지도사 준비", "한국어능력시험 준비", "한국사능력시험 준비", "정보처리기사 준비", "컴퓨터활용능력 준비")));
	        categories.add(new Category("interior", "인테리어", Arrays.asList("가구리폼", "욕실/화장실 리모델링", "도배시공", "주방 리모델링", "조명 인테리어")));
	        categories.add(new Category("home_appliances", "가전제품", Arrays.asList("전자제품 수리", "컴퓨터 수리", "비데 렌탈/구입/청소", "에어컨 설치 및 수리", "냉장고 설치 및 수리")));
	        categories.add(new Category("clean", "청소", Arrays.asList("에어컨 청소", "바퀴벌레 퇴치", "가구 청소", "계단/화장실 청소", "화재 복구/청소")));
	        categories.add(new Category("translate", "번역", Arrays.asList("한문 번역", "영어 번역", "독일어 번역", "일본어/일어 번역", "베트남어 번역")));
	        categories.add(new Category("document", "문서", Arrays.asList("문서/글 작성", "PPT 제작", "자막 제작", "사업계획서 제작", "교정/교열")));
	        categories.add(new Category("develop", "외주(개발)",Arrays.asList("웹 개발", "게임 개발", "iOS 개발", "QA 테스트", "ERP 개발")));
	        categories.add(new Category("pet", "반려동물", Arrays.asList("반려견 산책", "반려동물 미용", "반려동물 수제간식 만들기", "반려동물 훈련", "반려동물 장례")));
   
	        return categories;
	    }
	
	//일류가입 
	@PostMapping("/join_Prouser")
	public String join_Prouser(@Valid @ModelAttribute("joinProuserBean") ProUserBean joinProuserBean, BindingResult result) {
		if(result.hasErrors()) {
			return "user/pro_join";
		}
		ProuserService.addProuserInfo(joinProuserBean);
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
