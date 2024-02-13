package com.entities;

public class Leave {
	int lid;
	int uid;
	String subject;
	String message;
	String status;
	public Leave(int uid, String subject, String message) {
		super();
		this.uid = uid;
		this.subject = subject;
		this.message = message;
	}
	
	public Leave() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid=lid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status=status;
	}
	

}
