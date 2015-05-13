package com.snl.service.user;

import java.util.List;

import com.snl.service.domain.User;


//==> 회원관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface UserDao {
	
	// INSERT
	public void addUser(User user) throws Exception ;

	public User getUser(String id) throws Exception ;

}