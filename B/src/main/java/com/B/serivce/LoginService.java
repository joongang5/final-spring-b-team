package com.B.serivce;

import java.util.Map;

public interface LoginService {
	
	public Map<String, Object> login(String id);
	//아이디 중복 체크
	public int checkId(String id);
	
	public void join(Map<String, Object> map);
}
