package com.B.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("indexDAO")
public class IndexDAO extends AbstractDAO {

	public List<HashMap<String, Object>> getCategory() {
		return selectList("index.getCategory");
	}
	public List<HashMap<String, Object>> getCategoryMain() {
		return selectList("index.getCategoryMain");
	}


}
