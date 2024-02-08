package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;

import kr.co.softsoldesk.beans.ExpertBean;

public interface ExpertMapper {
	
	@Insert("INSERT INTO pro_profile (pro_profile_id, pro_id, pro_profile_image, profile_completion, review_rating, "
			+ "review_count, completion_count, pro_name, activity_region, movable_distance, certification_documents_images, "
			+ "pro_detailed_introduction, price) "
			+ "VALUES (pro_profile_seq.nextval, #{pro_id, jdbcType=INTEGER}, #{pro_profile_image, jdbcType=VARCHAR}, #{profile_completion, jdbcType=INTEGER}, "
			+ "#{review_rating, jdbcType=INTEGER}, #{review_count, jdbcType=INTEGER}, #{completion_count, jdbcType=INTEGER}, #{pro_name, jdbcType=VARCHAR}, #{activity_region, jdbcType=VARCHAR}, "
			+ "#{movable_distance, jdbcType=INTEGER}, #{certification_documents_images, jdbcType=VARCHAR}, #{pro_detailed_introduction, jdbcType=VARCHAR}, #{price, jdbcType=VARCHAR})")
	void addExpertInfo(ExpertBean proexpertBean);

}
