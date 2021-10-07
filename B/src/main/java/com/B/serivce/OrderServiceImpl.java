package com.B.serivce;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.B.dao.OrderDAO;
import com.B.dao.TestDAO;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public List<Map<String, Object>> dateList(Map<String, Object> map) {
		return orderDAO.dateList(map);
	}

	@Override
	public List<Map<String, Object>> getListByMemberNo(Map<String, Object> map) {
		return orderDAO.getListByMemberNo(map);
	}

	
}
