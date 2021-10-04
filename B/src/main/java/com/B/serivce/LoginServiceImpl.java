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

	

	


}
