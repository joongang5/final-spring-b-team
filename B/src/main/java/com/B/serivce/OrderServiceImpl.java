package com.B.serivce;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.B.dao.OrderDAO;

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

	@Override
	public Map<String, Object> getOrderProductInfo(int p_no) {
		return orderDAO.getOrderProductInfo(p_no);
	}

	@Override
	public int inputToOrder_List(Map<String, Object> orderedProduct) {
		return orderDAO.inputToOrder_List(orderedProduct);
	}

	@Override
	public int inputToPayment(Map<String, Object> paymentInfo) {
		return orderDAO.inputToPayment(paymentInfo);
	}

	@Override
	public int downStock(Map<String, Object> orderedProduct) {
		return orderDAO.downStock(orderedProduct);
	}

	@Override
	public int calcPoint(Map<String, Object> paymentInfo) {
		return orderDAO.calcPoint(paymentInfo);
	}

	@Override
	public int checkStock(Map<String, Object> orderedProduct) {
		return orderDAO.checkStock(orderedProduct);
	}

	@Override
	public int deleteFromCart(Map<String, Object> orderedProduct) {
		return orderDAO.deleteFromCart(orderedProduct);
	}


	
}
