package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.beans.ExpertBean;
import kr.co.softsoldesk.beans.ProUserBean; 

public interface ProUserMapper {

	@Select("select pro_name from pro_user where pro_email=#{pro_email}")
	String checkProuserEmailExist(String pro_email);
 
	@Insert("INSERT INTO pro_user (pro_id, pro_email, pro_name, pro_pwd, gender, active_location, active_detailcategory1, active_detailcategory2, active_detailcategory3) VALUES (pro_seq.nextval, #{pro_email}, #{pro_name}, #{pro_pwd}, #{gender}, #{active_location, jdbcType=VARCHAR}, #{active_detailcategory1}, #{active_detailcategory2, jdbcType=VARCHAR}, #{active_detailcategory3, jdbcType=VARCHAR})")
	//@SelectKey(statement = "select pro_seq.nextval from dual", keyProperty = "pro_id", 
   // before = true, resultType = int.class)
	void addProuserInfo(ProUserBean joinProuserBean); 
	
	/*
	@Insert("INSERT INTO pro_profile (pro_profile_id, pro_id, pro_profile_image, profile_completion, review_rating, review_count, completion_count, activity_region, movable_distance, certification_documents_images, pro_detailed_introduction, price)\r\n"
	        + "VALUES (pro_profile_seq.nexval, #{pro_id, jdbcType=INTEGER}, #{pro_profile_image, jdbcType=VARCHAR}, #{profile_completion, jdbcType=INTEGER}, #{review_rating, jdbcType=INTEGER}, #{review_count, jdbcType=INTEGER}, #{completion_count, jdbcType=INTEGER}, #{activity_region, jdbcType=VARCHAR}, #{movable_distance, jdbcType=VARCHAR}, #{certification_documents_images, jdbcType=VARCHAR}, #{pro_detailed_introduction, jdbcType=VARCHAR}, #{price, jdbcType=VARCHAR})\r\n")
	void addProProfileInfo(ExpertBean expertBean);
	*/
	
	@Select("select pro_id, pro_email, pro_name, pro_pwd, gender, active_location, active_detailcategory1, active_detailcategory2, active_detailcategory3  from pro_user where pro_email=#{pro_email} and pro_pwd=#{pro_pwd}")
	ProUserBean getLoginProuserInfo(ProUserBean tempLoginUserBean2);
	
	//사용자 이름 가져오기(일류 프로필)
	   @Select("select pro_name \r\n"
	         + "from pro_user\r\n"
	         + "where pro_id = #{pro_id}")
	   String getProUserName(int pro_id);
	   
	//활동 지역 가져오기(일류 프로필)
	   @Select("select active_location \r\n"
		         + "from pro_user\r\n"
		         + "where pro_id = #{pro_id}")
		   String getActive_location(int pro_id);
	   
	   @Update("UPDATE pro_user\r\n"
		         + "SET active_location = #{active_location, jdbcType=VARCHAR}\r\n"
		         + "WHERE pro_id = #{pro_id}")
		  void modifyActive_location(@Param("active_location") String active_location, @Param("pro_id") int pro_id);



}
