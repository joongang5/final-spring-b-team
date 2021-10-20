package com.B.serivce;

import java.util.List;
import java.util.Map;

public interface MypageService {
	public Map<String, Object> myinfo(Map<String, Object> map);
	
	public void myAccountDelete(Map<String, Object> map);
	
	public void myinfoUpdatePhone(Map<String, Object> map);
	
	public void myinfoUpdateEmail(Map<String, Object> map);
	
	public void myinfoUpdateAddr(Map<String, Object> map);
	
	public void myAccountUpdatePW(Map<String, Object> map);
	
	public List<Map<String, Object>> cartList(Map<String, Object> map);

	public int inputPointLog(Map<String, Object> map);
	
	public List<Map<String, Object>> getPointLogList(Map<String, Object> map);

	public int getPointLogTotalList(Map<String, Object> map);
}
