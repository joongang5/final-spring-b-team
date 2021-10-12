package com.B.serivce;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface OrderService {

	public List<Map<String, Object>> dateList(Map<String, Object> map);
	
	public List<Map<String, Object>> getListByMemberNo(Map<String, Object> map);
	
	public Map<String, Object> getOrderProductInfo(int p_no);

}
