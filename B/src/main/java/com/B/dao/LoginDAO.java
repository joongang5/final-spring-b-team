package com.B.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{
	

	public Map<String, Object> login(String id) {
		return selectOne("login.login",id);
	}



	
}
