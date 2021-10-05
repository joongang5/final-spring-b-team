package com.B.serivce;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.B.dao.AdminDAO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public List<Map<String, Object>> memberList(Map<String, Object> map) {
		return adminDAO.memberList(map);
	}

	@Override
	public void memberDelete(Map<String, Object> map) {
		adminDAO.memberDelete(map);
	}

	@Override
	public int memberTotalList(Map<String, Object> map) {
		return adminDAO.memberTotalList(map);
	}

	@Override
	public int logTotalList(Map<String, Object> map) {
		return adminDAO.logTotalList(map);
	}

	@Override
	public List<Map<String, Object>> logList(Map<String, Object> map) {
		return adminDAO.logList(map);
	}


}
