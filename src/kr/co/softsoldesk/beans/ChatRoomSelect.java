package kr.co.softsoldesk.beans;



public class ChatRoomSelect {
    private int room_id;
    private String pro_name; // 전문가 이름 필드
    private int pro_id;
    private int user_id;
    private String user_name;
    private String pro_profile_image;

    public int getPro_id() {
		return pro_id;
	}

	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

	// 기본 생성자
    public ChatRoomSelect() {
    }

    // 모든 필드를 포함하는 생성자
    public ChatRoomSelect(int room_id, String pro_name) {
        this.room_id = room_id;
        this.pro_name = pro_name;
    }

    // Getter와 Setter
    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public String getPro_name() {
        return pro_name;
    }

    public void setPro_name(String pro_name) {
        this.pro_name = pro_name;
    }

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPro_profile_image() {
		return pro_profile_image;
	}
	
	public void setPro_profile_image(String pro_profile_image) {
		this.pro_profile_image = pro_profile_image;
	}
    
}
