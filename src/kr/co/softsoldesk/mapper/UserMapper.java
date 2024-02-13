package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.ExpertBean;
import kr.co.softsoldesk.beans.UserBean;

public interface UserMapper {

	@Select("select user_name from users where user_email=#{user_email}")
	String checkUserEmailExist(String user_email);
	
	@Insert("insert into users values(user_seq.nextval, #{user_name}, #{user_email},#{user_pwd})")
	void addUserInfo(UserBean joinUserBean);
	
	
	@Select("select user_id, user_name, user_email, user_pwd from users where user_email=#{user_email} and user_pwd=#{user_pwd}")
	UserBean getLoginUserInfo(UserBean tempLoginUserBean);
}
