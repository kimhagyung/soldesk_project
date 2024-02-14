package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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
	

	
	//------------ajax 리뷰---------------------
	
	@Select("select r.review_id, r.user_id, u.user_name AS writer_name, r.rating, r.review_contents, to_char(r.review_date,'YYYY-MM-DD') as review_date, r.photos "
			+ "from review r "
			+ "LEFT JOIN users u ON r.user_id = u.user_id "
			+ "where r.pro_id = #{pro_id}"
			+ "order by review_id desc")
	List<ReviewBean> getAllReviews(int pro_id);
	
	@Delete("delete from review "
			+ "where review_id = #{review_id}")
	void deleteReview(int review_id);
	
	@Select("SELECT * FROM review LIMIT #{startIdx}, #{pageSize}")
    List<ReviewBean> getReviewsPaged(@Param("startIdx") int startIdx, @Param("pageSize") int pageSize);
	
	
	
	
}
