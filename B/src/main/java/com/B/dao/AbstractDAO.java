package com.B.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.B.common.CommandMap;

public class AbstractDAO {
	protected Log log = LogFactory.getLog(AbstractDAO.class);
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

	// 메시지에서 no로 id불러오기
	public String getName(String queryID, Map<String, Object> map) {
		return sqlSession.selectOne(queryID, map);
	}

	public int sendMessage(String queryID, Map<String, Object> map) {
		return sqlSession.insert(queryID, map);
	}

	// 메시지 삭제하기
	public void delMsg(String queryID, Map<String, Object> map) {
		sqlSession.delete(queryID, map);
	}

	public Map<String, Object> selectOne(String queryID, String id) {
		return sqlSession.selectOne(queryID, id);
	}

	public int checkId(String queryId, String id) {
		return sqlSession.selectOne(queryId, id);
	}

	public void join(String queryId, Map<String, Object> map) {
		sqlSession.insert(queryId, map);
	}

	// 게시판 총 게시물 구하기
	public int totalList(String queryID, Map<String, Object> map) {
		return sqlSession.selectOne(queryID, map);
	}
}
