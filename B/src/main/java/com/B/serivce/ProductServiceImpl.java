package com.B.serivce;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.B.common.CommandMap;
import com.B.dao.ProductDAO;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private ProductDAO productDAO;

	@Override
	public List<Map<String, Object>> productList() { //상품리스트
		return productDAO.productList();
	}
	@Override
	public List<Map<String, Object>> cateList() { //상위 카테고리 리스트
		return productDAO.cateList();
	}
	@Override
	public List<Map<String, Object>> cateList2(String c_main) { // 카테고리 리스트
		return productDAO.cateList2(c_main);
	}
	@Override
	public List<Map<String, Object>> categorySearch(Map<String, Object> p ) {
		return productDAO.categorySearch(p);
	}
	public int totalList(Map<String, Object> map) {
		
		return productDAO.totalList(map);
	}
	public List<Map<String, Object>> productList(Map<String, Object> map) {
		return productDAO.productList(map);
	}



}
