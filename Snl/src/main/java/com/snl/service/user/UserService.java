package com.snl.service.user;

import com.snl.service.domain.User;


//==> 회원관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface UserService {
	
	// 회원가입
	public void addUser(User user) throws Exception;
	
	public User getUser(String id) throws Exception;

}