package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.ProUserBean; 

public interface ProUserMapper {

	@Select("select pro_name from pro_user where pro_email=#{pro_email}")
	String checkProuserEmailExist(String pro_email);
 
	@Insert("INSERT INTO pro_user VALUES (pro_seq.nextval, #{pro_email}, #{pro_name}, #{pro_pwd}, #{gender}, #{active_location}, #{active_detailcategory1},#{active_detailcategory2},#{active_detailcategory3})")
	void addProuserInfo(ProUserBean joinProuserBean);
	 
}
