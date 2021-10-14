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
	
}
