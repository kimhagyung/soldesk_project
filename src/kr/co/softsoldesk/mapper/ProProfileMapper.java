package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.beans.ExpertBean;

public interface ProProfileMapper {

	@Insert("INSERT INTO pro_profile (pro_profile_id, pro_id, pro_profile_image, profile_completion, review_rating, activity_region, movable_distance, certification_documents_images, pro_detailed_introduction, price)\r\n"
	        + "VALUES (pro_profile_seq.nextval, #{pro_id}, #{pro_profile_image, jdbcType=VARCHAR}, #{profile_completion, jdbcType=INTEGER}, #{review_rating, jdbcType=INTEGER}, #{activity_region, jdbcType=VARCHAR}, #{movable_distance, jdbcType=VARCHAR}, #{certification_documents_images, jdbcType=VARCHAR}, #{pro_detailed_introduction, jdbcType=VARCHAR}, #{price, jdbcType=VARCHAR})")
	void addExpertInfo(ExpertBean writeExpertInfo);
	
	@Update("UPDATE pro_profile\r\n"
			+ "SET pro_detailed_introduction = #{pro_detailed_introduction}\r\n"
			+ "WHERE pro_id = #{pro_id}")
	void modifyIntroduction(@Param("pro_detailed_introduction") String pro_detailed_introduction, @Param("pro_id") int pro_id);

	@Select("select pro_profile_id, pro_id, pro_profile_image, profile_completion, review_rating, activity_region, movable_distance, certification_documents_images, pro_detailed_introduction, price\r\n"
			+ "from pro_profile\r\n"
			+ "where pro_id = #{pro_id}")
	List<ExpertBean> getExpertInfoList(int pro_id);
	
	@Update("UPDATE pro_profile\r\n"
			+ "SET price = #{price}\r\n"
			+ "WHERE pro_id = #{pro_id}")
	void modifyPrice(@Param("price") String price, @Param("pro_id") int pro_id);
	
}
