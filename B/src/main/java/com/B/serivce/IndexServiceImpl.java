package com.B.serivce;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.B.dao.IndexDAO;

@Service("indexService")
public class IndexServiceImpl implements IndexService {
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private IndexDAO indexDAO;

	public List<HashMap<String, Object>> getCategory() {
		return indexDAO.getCategory();
	}
	public List<HashMap<String, Object>> getCategoryMain() {
		return indexDAO.getCategoryMain();
	}
	public List<Map<String, Object>> productList() {
		return indexDAO.productList();
	}
	public List<HashMap<String, Object>> productList2(Map<String, Object> map) {
		return indexDAO.productList2(map);
	}
	public List<HashMap<String, Object>> cp_productList(Map<String, Object> map) {
		return indexDAO.cp_productList(map);
	}
	public Map<String, Object> detail(Map<String, Object> map) {
		return indexDAO.detail(map);
	}

	

}
