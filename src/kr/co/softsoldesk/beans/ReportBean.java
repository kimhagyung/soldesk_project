package kr.co.softsoldesk.beans;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class ReportBean {

	private int report_id;
    private int board_id;
    private int report_state;
    
    private String report_msg;
    
	public int getReport_id() {
		return report_id;
	}
	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getReport_state() {
		return report_state;
	}
	public void setReport_state(int report_state) {
		this.report_state = report_state;
	}
	public String getReport_msg() {
		return report_msg;
	}
	public void setReport_msg(String report_msg) {
		this.report_msg = report_msg;
	}
    
    
	
    
    
	
}
