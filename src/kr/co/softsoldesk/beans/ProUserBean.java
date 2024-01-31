package kr.co.softsoldesk.beans;
 

public class ProUserBean {
	private int pro_id; 
	private String pro_email;
	private String pro_name;
	private String active_location;
	private String[] active_detailcategory;
	private String active_detailcategory1;
	private String active_detailcategory2;
	private String active_detailcategory3;
	private String pro_pwd;
	private String confirmPassword;
	private String gender;
	private boolean prouserEmailExist;
	private boolean prouserLogin;
	
	public ProUserBean() { 
		this.prouserEmailExist = false; // 초기값 false
		// 초기화, 처음에는 중복검사를 하지 않으므로 디폴트 값을 false로 주입
		this.prouserLogin = false;
		// 초기화, 로그아웃 상태
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
 

	public boolean isProuserEmailExist() {
		return prouserEmailExist;
	}

	public void setProuserEmailExist(boolean prouserEmailExist) {
		this.prouserEmailExist = prouserEmailExist;
	}

	public boolean isProuserLogin() {
		return prouserLogin;
	}

	public void setProuserLogin(boolean prouserLogin) {
		this.prouserLogin = prouserLogin;
	}

	public String getPro_email() {
		return pro_email;
	}

	public void setPro_email(String pro_email) {
		this.pro_email = pro_email;
	}

	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	 
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getActive_location() {
		return active_location;
	}
	public void setActive_location(String active_location) {
		this.active_location = active_location;
	}
	
 

	 public String[] getActive_detailcategory() {
	        return active_detailcategory;
	    }

	    public void setActive_detailcategory(String[] active_detailcategory) {
	        this.active_detailcategory = active_detailcategory;
	    }

	    public String getActive_detailcategory1() {
	        return (active_detailcategory != null && active_detailcategory.length > 0) ? active_detailcategory[0] : null;
	    }

	    public String getActive_detailcategory2() {
	        return (active_detailcategory != null && active_detailcategory.length > 1) ? active_detailcategory[1] : null;
	    }

	    public String getActive_detailcategory3() {
	        return (active_detailcategory != null && active_detailcategory.length > 2) ? active_detailcategory[2] : null;
	    }
	    
	    
	public void setActive_detailcategory1(String active_detailcategory1) {
			this.active_detailcategory1 = active_detailcategory[0];
		}

		public void setActive_detailcategory2(String active_detailcategory2) {
			this.active_detailcategory2 = active_detailcategory[1];
		}

		public void setActive_detailcategory3(String active_detailcategory3) {
			this.active_detailcategory3 =active_detailcategory[2];
		}

	public String getPro_pwd() {
		return pro_pwd;
	}

	public void setPro_pwd(String pro_pwd) {
		this.pro_pwd = pro_pwd;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	} 
	
}
