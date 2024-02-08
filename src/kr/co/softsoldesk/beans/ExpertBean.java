package kr.co.softsoldesk.beans;

public class ExpertBean {
	
	private int pro_profile_id; // 고수 프로필 ID
	private int pro_id; // 고수 ID (외래키)
	private String pro_profile_image; // 고수 프로필 이미지
	private int profile_completion; // 프로필 진행도
	private int review_rating; // 리뷰 평점
	private int review_count; // 리뷰 수
	private int completion_count; // 고용 수
	private String pro_name; // 활동명
	private String activity_region; // 활동 지역
	private int movable_distance; // 이동 가능 거리
	private String certification_documents_images; // 자격증, 서류 이미지
	private String pro_detailed_introduction; // 고수 서비스 상세 설명
	private String price; // 가격
	
	
	public int getPro_profile_id() {
		return pro_profile_id;
	}
	public void setPro_profile_id(int pro_profile_id) {
		this.pro_profile_id = pro_profile_id;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public String getPro_profile_image() {
		return pro_profile_image;
	}
	public void setPro_profile_image(String pro_profile_image) {
		this.pro_profile_image = pro_profile_image;
	}
	public int getProfile_completion() {
		return profile_completion;
	}
	public void setProfile_completion(int profile_completion) {
		this.profile_completion = profile_completion;
	}
	public int getReview_rating() {
		return review_rating;
	}
	public void setReview_rating(int review_rating) {
		this.review_rating = review_rating;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public int getCompletion_count() {
		return completion_count;
	}
	public void setCompletion_count(int completion_count) {
		this.completion_count = completion_count;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getActivity_region() {
		return activity_region;
	}
	public void setActivity_region(String activity_region) {
		this.activity_region = activity_region;
	}
	public int getMovable_distance() {
		return movable_distance;
	}
	public void setMovable_distance(int movable_distance) {
		this.movable_distance = movable_distance;
	}
	public String getCertification_documents_images() {
		return certification_documents_images;
	}
	public void setCertification_documents_images(String certification_documents_images) {
		this.certification_documents_images = certification_documents_images;
	}
	public String getPro_detailed_introduction() {
		return pro_detailed_introduction;
	}
	public void setPro_detailed_introduction(String pro_detailed_introduction) {
		this.pro_detailed_introduction = pro_detailed_introduction;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	

}
