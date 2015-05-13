package com.snl.service.domain;

import java.io.Serializable;


public class  User implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String pw;
	private String email;
	private String userName;
	private String tel;
	
	private boolean active;

	public User(){}
	
	public User(String id, String pw, String email, String userName, String tel) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.userName = userName;
		this.tel = tel;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public boolean isActive(){
		return active;
	}
	
	public void setActive(boolean active) {
		this.active = active;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", pw=" + pw + ", email=" + email
				+ ", userName=" + userName + ", tel=" + tel + "]";
	}
	
	
	
	
	
}