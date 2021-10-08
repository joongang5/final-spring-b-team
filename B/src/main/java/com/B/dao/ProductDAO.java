package com.B.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.B.common.CommandMap;

@Repository("productDAO")
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

	public int totalList(Map<String, Object> map) {
		return totalList("product.totalList",map);
	}

	public List<Map<String, Object>> productList(Map<String, Object> map) {
		return selectList("product.productList2", map) ;
	}
	
	public int categorySearch2(Map<String, Object> p) {
		return findCNo("product.findCNo",p);
	}

	public void register(Map<String, Object> map) {
		register("product.register",map);
		
	}

	public void modifyState(Map<String, Object> p) {
		update("product.modifyState",p);
		
	}

	public Map<String, Object> productDetail(Map<String, Object> map) {
		return selectOne("product.productDetail",map);
	}

	public void modifyDetail(Map<String, Object> map) {
		update("product.modifyDetail",map);
		
	}

	public void deleteProduct(String p_no) {
		delete2("product.deleteProduct",p_no);
		
	}

}