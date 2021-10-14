package com.B.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("adminDAO")
public class AdminDAO extends AbstractDAO {

	public List<Map<String, Object>> memberList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("admin.memberList", map);
	}

	public void memberDelete(Map<String, Object> map) {
		delete("admin.memberDelete", map);
	}

	public int memberTotalList(Map<String, Object> map) {
		return totalList("admin.memberTotalList", map);
	}

	//이현아가 추가
	public List<Map<String, Object>> getAdminOrderList(Map<String, Object> map) {
		return selectList("admin2.adminOrderList", map);
	}

	public int getOrderTotalList(Map<String, Object> map) {
		return totalList("admin2.orderTotalList", map);
	}

	public void modifyState(Map<String, Object> p) {
		update("admin2.modifyState",p);
		
	}
	
}
