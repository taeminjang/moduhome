package com.kh.alarm;

import java.util.Date;

public class AlarmModel {

	private int alarm_seq;
	private int alarm_index_no;
	private int alarm_contnum;
	private String alarm_id;
	private String reg_id;
	private Date regdate;
	private Date readdate;
	
	public int getAlarm_seq() {
		return alarm_seq;
	}
	public void setAlarm_seq(int alarm_seq) {
		this.alarm_seq = alarm_seq;
	}
	public int getAlarm_index_no() {
		return alarm_index_no;
	}
	public void setAlarm_index_no(int alarm_index_no) {
		this.alarm_index_no = alarm_index_no;
	}
	public int getAlarm_contnum() {
		return alarm_contnum;
	}
	public void setAlarm_contnum(int alarm_contnum) {
		this.alarm_contnum = alarm_contnum;
	}
	public String getAlarm_id() {
		return alarm_id;
	}
	public void setAlarm_id(String alarm_id) {
		this.alarm_id = alarm_id;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getReaddate() {
		return readdate;
	}
	public void setReaddate(Date readdate) {
		this.readdate = readdate;
	}
	
	
}
