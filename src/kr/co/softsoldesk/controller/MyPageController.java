package kr.co.softsoldesk.controller;
 

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.softsoldesk.beans.CalendarBean;
import kr.co.softsoldesk.service.CalendarService;


@Controller
@RequestMapping("/common")
public class MyPageController {
	
	@Autowired
	CalendarService calendarService;
	
	//@GetMapping("/myPage")
	//public String myPage() {
		
	//	return "mypage/myPage";
	//}

	
	
 
	
} 
