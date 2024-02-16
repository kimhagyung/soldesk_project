package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.CareerBean;
import kr.co.softsoldesk.beans.EducationBean;
import kr.co.softsoldesk.beans.PortFolioBean;
import kr.co.softsoldesk.beans.ProProfileBean;
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
		
		//-----------------일류 프로필 정보-------------------
		
		public ProProfileBean getProProfileInfo(int pro_id) {
			return reviewMapper.getProProfileInfo(pro_id);
		}
		
		//-------------------경력------------------------------
		
		public List<CareerBean> getCareerListInfo(int pro_id){
			return reviewMapper.getCareerListInfo(pro_id);
		}
		
		public int getSumTotalExperience(int pro_id) {
			return reviewMapper.getSumTotalExperience(pro_id);
		}
		
		//-------------------학력---------------------------------
		
		public List<EducationBean> getEducationListInfo(int pro_id){
			return reviewMapper.getEducationListInfo(pro_id);
		}
		
		//-----------------포트폴리오--------------------------------
		public List<PortFolioBean> getProtfolioListInfo(int pro_id){
			return reviewMapper.getProtfolioListInfo(pro_id);
		}
		 
}