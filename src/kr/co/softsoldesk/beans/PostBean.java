package kr.co.softsoldesk.beans;

import java.time.LocalDateTime;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

public class PostBean {

	private int board_id;
    private int user_id; //참조값
    private int pro_id; //참조값
    
    @NotBlank
    private String title;
    
    private String photo;
    private List<String> photos; //파일 이름 받을 리스트
    
    @NotBlank
    private String content;
    
    private String category;
    private String location;
    private int ReportedPostSt; 
    private LocalDateTime board_date;
    
    private MultipartFile upload_photo;
    private List<MultipartFile> upload_photos;
    
	public List<String> getPhotos() {
		return photos;
	}
	public void setPhotos(List<String> photos) {
		this.photos = photos;
	}
	public List<MultipartFile> getUpload_photos() {
		return upload_photos;
	}
	public void setUpload_photos(List<MultipartFile> upload_photos) {
		this.upload_photos = upload_photos;
	}
	public MultipartFile getUpload_photo() {
		return upload_photo;
	}
	public void setUpload_photo(MultipartFile upload_photo) {
		this.upload_photo = upload_photo;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getReportedPostSt() {
		return ReportedPostSt;
	}
	public void setReportedPostSt(int reportedPostSt) {
		ReportedPostSt = reportedPostSt;
	}
	public LocalDateTime getBoard_date() {
		return board_date;
	}
	public void setBoard_date(LocalDateTime board_date) {
		this.board_date = board_date;
	}
	
	
    
    
}
