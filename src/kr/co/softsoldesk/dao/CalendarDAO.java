package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.CalendarBean;
import kr.co.softsoldesk.mapper.CalendarMapper;

@Repository
public class CalendarDAO {

	@Autowired
	private CalendarMapper calendarMapper;
	
	public void addCalendarInfo(CalendarBean writeCalendarBean) {
		
		calendarMapper.addCalendarInfo(writeCalendarBean);
	}
	
	public List<CalendarBean> getCalendarList() {
		
		return calendarMapper.getCalendarList();
	}
}
