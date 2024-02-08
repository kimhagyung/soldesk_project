package kr.co.softsoldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.CalendarBean;
import kr.co.softsoldesk.dao.CalendarDAO;

@Service
public class CalendarService {

	@Autowired
	private CalendarDAO calendarDao;
	
	public void addCalendarInfo(CalendarBean writeCalendarBean) {
		
		//writeCalendarBean.setUser_id(loginUserBean.getUser_id);
		
		calendarDao.addCalendarInfo(writeCalendarBean);
	}
	
	public List<CalendarBean> getCalendarList() {
		
		List<CalendarBean> calendarList = calendarDao.getCalendarList();
	    
	    // 디버깅용 로그
	    for (CalendarBean list : calendarList) {
	       
	       
	        	System.out.println("Event: " + list.getCalendar_memo());
	 	        
	       
	    }
	    
	    return calendarList;
		
	}
}
