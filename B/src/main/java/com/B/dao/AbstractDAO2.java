package com.B.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.B.common.CommandMap;

public class AbstractDAO2 { // 20211005 이현아 새롭게 만듬
	protected Log log = LogFactory.getLog(AbstractDAO2.class);
	@Autowired
	private SqlSessionTemplate sqlSession;

	protected void printQueryId(String queryId) {
		if (log.isDebugEnabled()) {
			log.debug("\t QueryId \t: " + queryId);
		}
	}

	public List<Map<String, Object>> selectList(String queryID, Map<String, Object> map) {
		return sqlSession.selectList(queryID, map);

	}

	public Map<String, Object> selectOne(String queryID, Map<String, Object> map) {
		printQueryId(queryID);
		return sqlSession.selectOne(queryID, map);
	}

	public int delete(String queryID, Map<String, Object> map) {
		printQueryId(queryID);
		return sqlSession.delete(queryID, map);
	}

	public void update(String queryID, Map<String, Object> map) {
		printQueryId(queryID);
		sqlSession.update(queryID, map);
	}

	// 20211005 
	public List<Map<String, Object>> productList(String queryID) {
		return sqlSession.selectList(queryID) ;
	}
	
	public List<Map<String, Object>> cateList(String queryID) {
		return sqlSession.selectList(queryID) ;
	}
	
	public List<Map<String, Object>> cateList2(String queryID, String c_main) {
		return sqlSession.selectList(queryID,c_main) ;
	}
	
	public int totalList(String queryID, Map<String, Object> map) {
		return sqlSession.selectOne(queryID, map);

	}
	

}
