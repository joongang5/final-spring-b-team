package com.B.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

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
	
	public int delete(String queryID, int key) {
		printQueryId(queryID);
		return sqlSession.delete(queryID, key);
	}
	
	public void update(String queryID, Map<String, Object> map) {
		printQueryId(queryID);
		sqlSession.update(queryID, map);
	}
	
	public int update2(String queryID, Map<String, Object> map) {
		printQueryId(queryID);
		return sqlSession.update(queryID, map);
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

	public Map<String, Object> selectOne(String queryID, int key) {
		return sqlSession.selectOne(queryID, key);
	}
	
	public int selectOne2(String queryID, Map<String, Object> map) {
		return sqlSession.selectOne(queryID, map);
	}
	
	public int checkId(String queryId, String id) {
		return sqlSession.selectOne(queryId, id);
	}

	public void join(String queryId, Map<String, Object> map) {
		sqlSession.insert(queryId, map);
	}
	
	public int inputOrder(String queryId, Map<String, Object> map) {
		return sqlSession.insert(queryId, map);
	}
	
	public int updateOrder(String queryId, Map<String, Object> map) {
		return sqlSession.update(queryId, map);
	}
	
	// 게시판 총 게시물 구하기
	public int totalList(String queryID, Map<String, Object> map) {
		return sqlSession.selectOne(queryID, map);
	}
	
	//20211014 정원우 추가 로그남기기
	public void insertLog(String queryID, Map<String, Object> map) {
		sqlSession.insert(queryID, map);
	}
	//20211005 강재하 추가
	public List<HashMap<String, Object>> selectList(String queryID) {
		return sqlSession.selectList(queryID);
	}
	public List<Map<String, Object>> selectList2(String queryID) {
		return sqlSession.selectList(queryID);
	}
	public List<HashMap<String, Object>> selectList3(String queryID, Map<String, Object> map) {
		return sqlSession.selectList(queryID, map);
	}

}
