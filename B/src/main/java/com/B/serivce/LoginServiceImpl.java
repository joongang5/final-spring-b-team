package com.B.serivce;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.B.common.CommandMap;
import com.B.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDAO loginDAO;

	@Override
	public Map<String, Object> login(String id) {
	
		return loginDAO.login(id);
	}

	@Override
	public int checkId(String id) {
		return loginDAO.checkId(id);
	}

	@Override
	public void join(Map<String, Object> map) {
		loginDAO.join(map);
		
	}
	
	@Override
	public String getId(Map<String, Object> map) {
		return loginDAO.getId("login.getId",map);
	}

	@Override
	public String getPw(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return loginDAO.getId("login.getPw",map);
	}

	public Map<String, Object> login2(Map<String, Object> map) {
		
		return loginDAO.login2(map);
	}

	public void changePW(Map<String, Object> map) {
		loginDAO.update("login.changePW", map);
		
	}

	

	

	


}
