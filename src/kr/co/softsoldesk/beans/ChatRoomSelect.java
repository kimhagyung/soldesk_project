package kr.co.softsoldesk.beans;



public class ChatRoomSelect {
    private int room_id;
    private String pro_name; // 전문가 이름 필드
    private int pro_id;

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
    
    
}