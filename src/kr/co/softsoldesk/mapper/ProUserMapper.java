package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.softsoldesk.beans.ProUserBean;

public interface ProUserMapper {

	@Select("select pro_name from pro_user where pro_email=#{pro_email}")
	String checkProuserEmailExist(String pro_email);

	@Insert("INSERT INTO pro_user (pro_id, pro_email, pro_name, pro_pwd, pro_gender, active_location, active_detailcategory1, active_detailcategory2, active_detailcategory3,reportCnt) VALUES (pro_seq.nextval, #{pro_email}, #{pro_name}, #{pro_pwd}, #{pro_gender}, #{active_location, jdbcType=VARCHAR}, #{active_detailcategory1, jdbcType=VARCHAR}, #{active_detailcategory2, jdbcType=VARCHAR}, #{active_detailcategory3, jdbcType=VARCHAR},#{reportCnt})")
	void addProuserInfo(ProUserBean joinProuserBean);

	@Select("select * from pro_user where pro_email=#{pro_email} and pro_pwd=#{pro_pwd}")
	ProUserBean getLoginProuserInfo(ProUserBean tempLoginUserBean2);

	@Select("select pro_name from pro_user WHERE pro_name LIKE '%' || #{pro_name} || '%'")
	List<String> getSearchProUserByName(String pro_name);// 검색한 pro_name조회

	@Select("select pro_name from pro_user")
	List<ProUserBean> getProUserByName(RowBounds rowBounds); // 모든 pro_name조회
 
	@Select("select count(*) from pro_user")
	int getProCnt();
	
	@Select("SELECT pro_name FROM pro_user " +
			 "WHERE active_location = #{active_location, jdbcType=VARCHAR}")
	List<String> getselectedLocation(@Param("active_location") String active_location);
 
	@Select("SELECT pro_name FROM pro_user " +
	        "WHERE active_detailcategory1 = #{selectedCategory, jdbcType=VARCHAR} " +
	        "OR active_detailcategory2 = #{selectedCategory, jdbcType=VARCHAR} " +
	        "OR active_detailcategory3 = #{selectedCategory, jdbcType=VARCHAR}")
	List<String> getselectedCategory(@Param("selectedCategory") String selectedCategory);
 
	@Select("SELECT pro_name FROM pro_user " +
	        "WHERE active_location = #{active_location, jdbcType=VARCHAR} " +
	        "AND (active_detailcategory1 = #{selectedCategory, jdbcType=VARCHAR} " +
	        "OR active_detailcategory2 = #{selectedCategory, jdbcType=VARCHAR} " +
	        "OR active_detailcategory3 = #{selectedCategory, jdbcType=VARCHAR})")
	List<String> getProCategoryAndLocation(@Param("selectedCategory") String selectedCategory, @Param("active_location") String active_location);
 
	@Update("UPDATE pro_user " +
	        "SET pro_name = #{pro_name}, pro_email = #{pro_email}, pro_pwd = #{pro_pwd} " +
	        "WHERE pro_id = #{pro_id}")
	void ProupdateAccountUser(ProUserBean ProAccountModifyCom); 
	
	@Delete("delete from pro_user where pro_id=#{pro_id}")
	int ProAccountResign(int pro_id);
}
