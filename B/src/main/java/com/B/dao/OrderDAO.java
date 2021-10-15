package com.B.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO{

	public List<Map<String, Object>> dateList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;//(List<Map<Stirng, Object>>) selectList("");
	}

	public List<Map<String, Object>> getListByMemberNo(Map<String, Object> map) {
		return selectList("order.getListByMemberNo", map);
	}

	public Map<String, Object> getOrderProductInfo(int p_no) {
		return selectOne("order.getOrderProductInfo", p_no);
	}

	public int inputToOrder_List(Map<String, Object> orderedProductList) {
		return inputOrder("order.inputToOrder_List", orderedProductList);
	}

	public int inputToPayment(Map<String, Object> paymentInfo) {
		return inputOrder("order.inputToPayment", paymentInfo);
	}

	public int downStock(Map<String, Object> orderedProductList) {
		return updateOrder("order.downStock", orderedProductList);
	}

	public int downPoint(Map<String, Object> paymentInfo) {
		return updateOrder("order.downPoint", paymentInfo);
	}

	public int checkStock(Map<String, Object> orderedProduct) {
		return selectOne2("order.checkStock", orderedProduct);
	}


}
