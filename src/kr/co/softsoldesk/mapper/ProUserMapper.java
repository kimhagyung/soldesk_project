package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.ServiceCategoryBean; 

public interface ProUserMapper {

	@Select("select pro_name from pro_user where pro_email=#{pro_email}")
	String checkProuserEmailExist(String pro_email);
 
	@Insert("INSERT INTO pro_user (pro_id, pro_email, pro_name, pro_pwd, pro_gender, active_location, active_detailcategory1, active_detailcategory2, active_detailcategory3) VALUES (pro_seq.nextval, #{pro_email}, #{pro_name}, #{pro_pwd}, #{pro_gender}, #{active_location, jdbcType=VARCHAR}, #{active_detailcategory1}, #{active_detailcategory2, jdbcType=VARCHAR}, #{active_detailcategory3, jdbcType=VARCHAR})")
	void addProuserInfo(ProUserBean joinProuserBean);
	
	@Select("select * from pro_user where pro_email=#{pro_email} and pro_pwd=#{pro_pwd}")
	ProUserBean getLoginProuserInfo(ProUserBean tempLoginUserBean2);
	
	@Select("select pro_name from pro_user WHERE pro_name LIKE '%' || #{pro_name} || '%'")
	List<String> getSearchProUserByName(String pro_name);//검색한 pro_name조회
	 
	@Select("select pro_name from pro_user")
	List<ProUserBean> getProUserByName(); //모든 pro_name조회 
	
	@Select("SELECT pro_name FROM pro_user "
	        + "WHERE active_location = #{active_location, jdbcType=VARCHAR} "
	        + "OR active_detailcategory1 = #{active_detailcategory1, jdbcType=VARCHAR} "
	        + "OR active_detailcategory2 = #{active_detailcategory2, jdbcType=VARCHAR} "
	        + "OR active_detailcategory3 = #{active_detailcategory3, jdbcType=VARCHAR}")
	List<String> getProCategoryAndLocation(String activeData); //모달에서 선택해서 검색 
}
