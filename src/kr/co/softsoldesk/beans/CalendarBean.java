package kr.co.softsoldesk.beans;

import java.sql.Timestamp;

public class CalendarBean {

	private int calendar_Id;
	private String calendar_memo;
	private Timestamp start_date;
	private Timestamp end_date;
	private int user_id;
	private int pro_id;
	
	public int getCalendar_Id() {
        return calendar_Id;
    }

    public void setCalendar_Id(int calendar_Id) {
        this.calendar_Id = calendar_Id;
    }

	public String getCalendar_memo() {
		return calendar_memo;
	}
	
	public void setCalendar_memo(String calendar_memo) {
		this.calendar_memo = calendar_memo;
	}
	
	public Timestamp getStart_date() {
	    return start_date;
	}

	public void setStart_date(Timestamp start_date) {
	    this.start_date = start_date;
	}
	
	public Timestamp getEnd_date() {
		return end_date;
	}
	
	public void setEnd_date(Timestamp end_date) {
		this.end_date = end_date;
	}
	
	public int getUser_id() {
		return user_id;
	}
	
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public int getPro_id() {
		return pro_id;
	}
	
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	
	
}
