package com.B.serivce;

import java.util.Map;

public interface LoginService {
	
	public Map<String, Object> login(String id);
	
	public int checkId(String id);
	
	public void join(Map<String, Object> map);
}
