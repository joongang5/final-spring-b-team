package com.B.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("indexDAO")
public class IndexDAO extends AbstractDAO {

	public List<HashMap<String, Object>> getCategory() {
		return selectList("index.getCategory");
	}
	public List<HashMap<String, Object>> getCategoryMain() {
		return selectList("index.getCategoryMain");
	}
	public List<Map<String, Object>> productList() {
		return selectList2("index.productList");
	}

}
