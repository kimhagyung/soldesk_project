package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.ReviewBean;
import kr.co.softsoldesk.mapper.ReviewMapper;

@Repository
public class ReviewDao {

	@Autowired
	private ReviewMapper reviewMapper;
	
	public void addReviewInfo(ReviewBean writeReviewBean) {
		reviewMapper.addReviewInfo(writeReviewBean);
	}
	
	public List<ReviewBean> getAllReviewList(int pro_id){
		return reviewMapper.getAllReviewList(pro_id);
	}
	
	public int getReviewCnt(int pro_id) {
		return reviewMapper.getReviewCnt(pro_id);
	}
	
	public Float getAvgReview(int pro_id) {
		return reviewMapper.getAvgReview(pro_id);
	}
	
	public void deleteReview(int review_id) {
		reviewMapper.deleteReview(review_id);
	}
	
	//---------------ajax 리뷰------------------------
	
	public List<ReviewBean> getAllReviews(int pro_id){
		return reviewMapper.getAllReviews(pro_id);
	}
	
	
}
