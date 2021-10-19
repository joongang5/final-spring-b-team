package com.B.serivce;

import java.util.List;
import java.util.Map;

public interface ExchangeService {

	public List<Map<String, Object>> exchangeList();

	public int updateEState(Map<String, Object> map);
	
	public void insertInfo(String parameter);
	
	public void getInfo(Map<String, Object> map) ;
}
