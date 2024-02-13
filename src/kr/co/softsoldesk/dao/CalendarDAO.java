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
	
	public List<CalendarBean> getCalendarList(Integer user_id, Integer pro_id) {
		
		return calendarMapper.getCalendarList(user_id, pro_id);
	}
	
	public void modifyCalendar(CalendarBean modifyCalendarBean) {
		
		calendarMapper.modifyCalendar(modifyCalendarBean);
	}
	
	public CalendarBean getCalendarContent(int calendar_Id) {
		
		return calendarMapper.getCalendarContent(calendar_Id);
	}
	
	public void delecteCalendar(int calendar_Id) {
		
		calendarMapper.delecteCalendar(calendar_Id);
	}
	
	public List<CalendarBean> getAlarmList(Integer user_id, Integer pro_id) {
		
		return calendarMapper.getAlarmList(user_id, pro_id);
	}
	
}
