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

	//이현아가 추가
	@Override
	public List<Map<String, Object>> getAdminOrderList(Map<String, Object> map) {
		return adminDAO.getAdminOrderList(map);
	}
	
	@Override
	public int getOrderTotalList(Map<String, Object> map) {
		return adminDAO.getOrderTotalList(map);
	}
	
	@Override
	public void modifyState(Map<String, Object> p) {
		adminDAO.modifyState(p);
		
	}
	@Override
	public Map<String, Object> getAdminOrderDetail(Map<String, Object> map) {
		return adminDAO.getAdminOrderDetail(map);
	}

	@Override
	public int updateWayBill(Map<String, Object> map) {
		
		return adminDAO.updateWayBill(map);
		
	}
}
