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
	public List<HashMap<String, Object>> productList2(Map<String, Object> map) {
		return selectList3("index.productList2", map);
	}
	public List<HashMap<String, Object>> cp_productList(Map<String, Object> map) {
		return selectList3("index.cp_productList", map);
	}
	public Map<String, Object> detail(Map<String, Object> map) {
		return selectOne("index.detail", map);
	}

}
