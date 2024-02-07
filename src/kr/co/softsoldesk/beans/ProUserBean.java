package kr.co.softsoldesk.beans;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
 
import javax.validation.constraints.Size;

public class ProUserBean {
	private int pro_id; 
	private String pro_email;

	public List<Category> categories = getCategoryList();
	@Size(min = 2, max = 8)
	private String pro_name;
	
	private String active_location;
	private String[] active_detailcategory = new String[3];
	private String active_detailcategory1;
	private String active_detailcategory2;
	private String active_detailcategory3;
	@Size(min = 4, max = 20)
	private String pro_pwd;
	@Size(min = 4, max = 20) 
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
	
	//카테고리 값 가져오기 
	 public List<Category> getCategoryList() {
	        List<Category> categories = new ArrayList<>();

	        // Add categories dynamically
	        categories.add(new Category("test_license", "시험/자격증", Arrays.asList("스포츠지도사 준비", "한국어능력시험 준비", "한국사능력시험 준비", "정보처리기사 준비", "컴퓨터활용능력 준비")));
	        categories.add(new Category("interior", "인테리어", Arrays.asList("가구리폼", "욕실/화장실 리모델링", "도배시공", "주방 리모델링", "조명 인테리어")));
	        categories.add(new Category("home_appliances", "가전제품", Arrays.asList("전자제품 수리", "컴퓨터 수리", "비데 렌탈/구입/청소", "에어컨 설치 및 수리", "냉장고 설치 및 수리")));
	        categories.add(new Category("clean", "청소", Arrays.asList("에어컨 청소", "바퀴벌레 퇴치", "가구 청소", "계단/화장실 청소", "화재 복구/청소")));
	        categories.add(new Category("translate", "번역", Arrays.asList("한문 번역", "영어 번역", "독일어 번역", "일본어/일어 번역", "베트남어 번역")));
	        categories.add(new Category("document", "문서", Arrays.asList("문서/글 작성", "PPT 제작", "자막 제작", "사업계획서 제작", "교정/교열")));
	        categories.add(new Category("develop", "외주(개발)",Arrays.asList("웹 개발", "게임 개발", "iOS 개발", "QA 테스트", "ERP 개발")));
	        categories.add(new Category("pet", "반려동물", Arrays.asList("반려견 산책", "반려동물 미용", "반려동물 수제간식 만들기", "반려동물 훈련", "반려동물 장례")));
  
	        return categories;
	 }

		public String[] getActive_detailcategory() {
	        return active_detailcategory;
	    }

	    public void setActive_detailcategory(String[] active_detailcategory) {
	    	if (active_detailcategory != null) {
	            // 배열의 길이에 따라 각 변수에 값을 할당
	            if (active_detailcategory[0]==null) {
	            	 active_detailcategory1 = null;
	            }
	            active_detailcategory1 = active_detailcategory[0];
		             
	            if (active_detailcategory[1]==null) {
	            	 active_detailcategory2 = null;
	            }
	            active_detailcategory2 = active_detailcategory[0];
	            
	            if (active_detailcategory[2]==null) {
	            	 active_detailcategory3 = null;
	            }
	            active_detailcategory3 = active_detailcategory[0];
	    	}
	    }
	public String getActive_detailcategory1() {
			return active_detailcategory1;
		}

		public void setActive_detailcategory1(String active_detailcategory1) {
			this.active_detailcategory1 =  active_detailcategory[0]; 
		}

		public String getActive_detailcategory2() {
			return active_detailcategory2;
		}

		public void setActive_detailcategory2(String active_detailcategory2) {
			this.active_detailcategory2 = active_detailcategory[1];
		}

		public String getActive_detailcategory3() {
			return active_detailcategory3;
		}

		public void setActive_detailcategory3(String active_detailcategory3) {
			this.active_detailcategory3 =  active_detailcategory[2];
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
