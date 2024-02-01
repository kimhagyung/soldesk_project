package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean; 

public interface ProUserMapper {

	@Select("select pro_name from pro_user where pro_email=#{pro_email}")
	String checkProuserEmailExist(String pro_email);
 
	@Insert("INSERT INTO pro_user (pro_id, pro_email, pro_name, pro_pwd, gender, active_location, active_detailcategory1, active_detailcategory2, active_detailcategory3) VALUES (pro_seq.nextval, #{pro_email}, #{pro_name}, #{pro_pwd}, #{gender}, #{active_location, jdbcType=VARCHAR}, #{active_detailcategory1}, #{active_detailcategory2, jdbcType=VARCHAR}, #{active_detailcategory3, jdbcType=VARCHAR})")
	void addProuserInfo(ProUserBean joinProuserBean);
	
	@Select("select * from pro_user where pro_email=#{pro_email} and pro_pwd=#{pro_pwd}")
	ProUserBean getLoginProuserInfo(ProUserBean tempLoginUserBean2);
	
}
