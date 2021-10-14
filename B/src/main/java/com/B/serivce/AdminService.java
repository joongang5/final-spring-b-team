package com.B.serivce;

import java.util.List;
import java.util.Map;

public interface AdminService {

	public List<Map<String, Object>> memberList(Map<String, Object> map);

	public int memberTotalList(Map<String, Object> map);

	public void memberDelete(Map<String, Object> map);
	
	//이현아 추가
	public List<Map<String, Object>> getAdminOrderList(Map<String, Object> map);
	
	public int getOrderTotalList(Map<String, Object> map);
	
	public void modifyState(Map<String, Object> p);

}
