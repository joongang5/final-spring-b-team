package com.B.serivce;

import java.util.List;
import java.util.Map;

public interface OrderService {

	public List<Map<String, Object>> dateList(Map<String, Object> map);
	
	public List<Map<String, Object>> getListByMemberNo(Map<String, Object> map);
	
	public Map<String, Object> getOrderProductInfo(int p_no);

	public int inputToOrder_List(Map<String, Object> orderedProduct);

	public int inputToPayment(Map<String, Object> paymentInfo);

	public int downStock(Map<String, Object> orderedProduct);

	public int downPoint(Map<String, Object> paymentInfo);

	public int checkStock(Map<String, Object> orderedProduct);

}
