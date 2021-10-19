package com.B.serivce;

import java.util.List;
import java.util.Map;

public interface ExchangeService {

	public List<Map<String, Object>> exchangeList(Map<String, Object> map);

	public int updateEState(Map<String, Object> map);
	
	public void insertInfo(Map<String, Object> map);
	
	public void updateInfo(Map<String, Object> map) ;
	
	public Map<String, Object> getInfo(Map<String, Object> map);
}
