package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.CareerBean;
import kr.co.softsoldesk.beans.EducationBean;
import kr.co.softsoldesk.beans.PortFolioBean;
import kr.co.softsoldesk.beans.ProProfileBean;
import kr.co.softsoldesk.beans.ReviewBean;

public interface ReviewMapper {

	@Insert("insert into review(review_id, pro_id, user_id,  review_contents, rating, photos, review_date, category) "
			+ "values(review_seq.nextval, #{pro_id, jdbcType=INTEGER, javaType=Integer}, #{user_id, jdbcType=INTEGER, javaType=Integer}, #{review_contents}, #{rating}, #{photos, jdbcType=VARCHAR}, sysdate, #{category})")
	void addReviewInfo(ReviewBean writeReviewBean);
	
	@Select("select r.review_id, r.user_id, u.user_name AS writer_name, r.rating, r.review_contents, to_char(r.review_date,'YYYY-MM-DD') as review_date, r.photos "
			+ "from review r "
			+ "LEFT JOIN users u ON r.user_id = u.user_id "
			+ "where r.pro_id = #{pro_id}"
			+ "order by review_id desc")
	List<ReviewBean> getAllReviewList(int pro_id);
	
	@Select("select count(*) from review "
			+ "where pro_id = #{pro_id}")
	int getReviewCnt(int pro_id);
	
	@Select("select avg(rating) from review "
			+ "where pro_id=#{pro_id}")
	Float getAvgReview(int pro_id);
	
	@Delete("delete from review "
			+ "where review_id = #{review_id}")
	void deleteReview(int review_id);
	//------------ajax 리뷰---------------------
	
		@Select("select r.review_id, r.user_id, u.user_name AS writer_name, r.rating, r.review_contents, to_char(r.review_date,'YYYY-MM-DD') as review_date, r.photos "
				+ "from review r "
				+ "LEFT JOIN users u ON r.user_id = u.user_id "
				+ "where r.pro_id = #{pro_id}"
				+ "order by review_id desc")
		List<ReviewBean> getAllReviews(int pro_id);
		
		@Select("SELECT * FROM review LIMIT #{startIdx}, #{pageSize}")
	    List<ReviewBean> getReviewsPaged(@Param("startIdx") int startIdx, @Param("pageSize") int pageSize);
		
		//----------------일류 프로필 정보-----------------------
		
		@Select("select profile.certification_documents_images, profile.pro_detailed_introduction, pu.pro_id, pu.pro_name, pu.active_location, "
				+ "pu.active_detailcategory1, pu. active_detailcategory2, pu. active_detailcategory3 "
				+ "from pro_profile profile "
				+ "join pro_user pu on profile.pro_id = pu.pro_id "
				+ "where pu.pro_id = #{pro_id} ")
		ProProfileBean getProProfileInfo(int pro_id);
		
		//----------------경력------------------------------------
		
		@Select("select career_id, total_experience_period, start_date, end_date, career_title, detailed_introduction "
				+ "from career "
				+ "where pro_id = #{pro_id}")
		List<CareerBean> getCareerListInfo(int pro_id);
		
		@Select("select sum(total_experience_period) from career "
				+ "where pro_id = #{pro_id}")
		int getSumTotalExperience(int pro_id);

		//----------------------학력--------------------------------
		
		@Select("select education_id, school_name, major_name, admission_date, graduation_date, evidence_image "
				+ "from education "
				+ "where pro_id = #{pro_id}")
		List<EducationBean> getEducationListInfo(int pro_id);
		
		//-----------------포트폴리오--------------------------------
		
		@Select("select portfolio_id, portfolio_title, service_type, location_info, final_amount, work_year, work_period, detailed_introduction, detailed_images, inspectionny "
				+ "from portfolio "
				+ "where pro_id = #{pro_id}")
		List<PortFolioBean> getProtfolioListInfo(int pro_id);
		
		/*
		 * @Select("select portfolio_id, portfolio_title, service_type, location_info, final_amount, work_year, work_period, detailed_introduction, detailed_images, inspectionNY "
		 * + "from portfolio " + "where portfolio_id = #{portfolio_id}") PortFolioBean
		 * getPortfolioInfo(int portfolio_id);
		 */
	
}