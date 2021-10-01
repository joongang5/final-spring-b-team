package com.B.serivce;

import java.util.List;
import java.util.Map;

public interface MypageService {
	public Map<String, Object> myinfo(Map<String, Object> map);
	
	public void myAccountDelete(Map<String, Object> map);
	
	public void myinfoUpdate(Map<String, Object> map);
	
	public void myAccountUpdatePW(Map<String, Object> map);
	
	public List<Map<String, Object>> cartList(Map<String, Object> map);
}
