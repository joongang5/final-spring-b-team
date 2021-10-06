package com.B.serivce;

import java.util.List;
import java.util.Map;

import com.B.common.CommandMap;

public interface ProductService {
	 List<Map<String, Object>> productList();
	 
	 List<Map<String, Object>> cateList();
	 
	 List<Map<String, Object>> cateList2(String c_main);
	 
	 List<Map<String, Object>> categorySearch(Map<String, Object> p );
}
