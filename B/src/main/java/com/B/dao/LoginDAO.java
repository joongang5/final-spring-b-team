package com.B.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.B.common.CommandMap;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{
	

	public Map<String, Object> login(String id) {
		return selectOne("login.login",id);
	}

	public int checkId(String id) {
		return checkId("login.checkId",id);
	}

	public void join(Map<String, Object> map) {
		join("login.join",map);
		
	}



	
}
