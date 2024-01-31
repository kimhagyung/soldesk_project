package kr.co.softsoldesk.beans;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

public class BoardBean {

	private int board_id;
    private int user_id;
    private int pro_id;
    
    @NotBlank
    private String title;
    private String photo;
    
    @NotBlank
    private String Content;
    private String Category;
    private String Location;
    private int ReportedPostSt; 
    private String board_date;
    
    private MultipartFile upload_photo;
    
    
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
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getCategory() {
		return Category;
	}
	public void setCategory(String category) {
		Category = category;
	}
	public String getLocation() {
		return Location;
	}
	public void setLocation(String location) {
		Location = location;
	}
	public int getReportedPostSt() {
		return ReportedPostSt;
	}
	public void setReportedPostSt(int reportedPostSt) {
		ReportedPostSt = reportedPostSt;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
    
    
}
