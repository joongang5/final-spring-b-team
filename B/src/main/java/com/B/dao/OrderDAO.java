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
		return selectList("order_list.getListByMemberNo", map);
	}
}
