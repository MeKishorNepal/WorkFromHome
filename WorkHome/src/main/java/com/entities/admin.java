package com.entities;

public class admin {
	int mid;
	String name;
	String password;
	public admin( String name, String password) {
		super();
		
		this.name = name;
		this.password = password;
	}
	public admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	

}
