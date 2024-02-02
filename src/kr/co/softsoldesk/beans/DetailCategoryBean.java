package kr.co.softsoldesk.beans;

import java.util.List;

public class DetailCategoryBean {

	 private int detail_category_id;
	 private int service_category_id;
	 private String detail_category_name;
	 private String file_name; 
	 
	public int getDetail_category_id() {
		return detail_category_id;
	}
	
	public void setDetail_category_id(int detail_category_id) {
		this.detail_category_id = detail_category_id;
	}
	
	public int getService_category_id() {
		return service_category_id;
	}
	
	public void setService_category_id(int service_category_id) {
		this.service_category_id = service_category_id;
	}
	
	public String getDetail_category_name() {
		return detail_category_name;
	}
	
	public void setDetail_category_name(String detail_category_name) {
		this.detail_category_name = detail_category_name;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
 
	
	
	 
	 
}
