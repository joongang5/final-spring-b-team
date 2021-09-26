package com.B.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class AbstractDAO {
	protected Log log = LogFactory.getLog(AbstractDAO.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	protected void printQueryId(String queryId) {
		if(log.isDebugEnabled()) {
			log.debug("\t QueryID \t " + queryId);
		}
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryID) {
		printQueryId(queryID);
		return sqlSession.selectList(queryID);
	}
	
}
