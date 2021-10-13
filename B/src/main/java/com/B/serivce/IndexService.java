package com.B.serivce;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface IndexService{
	public List<HashMap<String, Object>> getCategory();
	public List<HashMap<String, Object>> getCategoryMain();
	public List<Map<String, Object>> productList() ;
	public List<HashMap<String, Object>> productList2(Map<String, Object> map) ;
	public List<HashMap<String, Object>> cp_productList(Map<String, Object> map) ;
}
