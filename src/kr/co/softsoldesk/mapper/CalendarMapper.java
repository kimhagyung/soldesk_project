package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import kr.co.softsoldesk.beans.CalendarBean;

public interface CalendarMapper {

	//@SelectKey(statement = "select calendar_seq.nextval from dual", keyProperty = "calendar_id", before=true, resultType = int.class)
	@Insert("INSERT INTO calendar (calendar_Id, calendar_memo, start_date, end_date, user_id, pro_id) " +
            "VALUES (calendar_seq.nextval, #{calendar_memo, jdbcType=VARCHAR}, #{start_date, jdbcType=TIMESTAMP}, " +
            "#{end_date, jdbcType=TIMESTAMP}, #{user_id, jdbcType=INTEGER}, #{pro_id, jdbcType=INTEGER})")
	void addCalendarInfo(CalendarBean writeCalendarBean);
	
	@Select("select calendar_memo, to_char(start_date, 'YYYY-MM-DD') from calendar WHERE start_date IS NOT NULL and calendar_memo is not null")
	List<CalendarBean> getCalendarList();
}
