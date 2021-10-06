package com.B.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("orderDAO")
public class ProductDAO extends AbstractDAO2 {

	public List<Map<String, Object>> productList() {
		return productList("product.productList") ;
	}

	public List<Map<String, Object>> cateList() {
		return cateList("product.cateList");
	}

	public List<Map<String, Object>> cateList2(String c_main) {
		return cateList2("product.cateList2", c_main);
	}

	public List<Map<String, Object>> categorySearch(Map<String, Object> p) {
		return selectList("product.categorySearch",p);
	}

	
}
	


