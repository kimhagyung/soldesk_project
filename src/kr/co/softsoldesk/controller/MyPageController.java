package kr.co.softsoldesk.controller;


import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.beans.CalendarBean;
import kr.co.softsoldesk.service.CalendarService;


@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	CalendarService calendarService;
	
	@GetMapping("/myPage")
	public String myPage() {
		
		return "mypage/myPage";
	}

	@GetMapping("/calendar")
	public String calender(Model model) {
		
		List<CalendarBean> calendarList = calendarService.getCalendarList();
		model.addAttribute("calendarList", calendarList);
		
		return "mypage/calendar";
	}
	
	@PostMapping("/calendar_pro")
	public String calendar_pro(@ModelAttribute("writeCalendarBean") CalendarBean writeCalendarBean) {
		

		calendarService.addCalendarInfo(writeCalendarBean);

	    return "mypage/write_success";
	}
}