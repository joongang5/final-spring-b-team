package com.B.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("logDAO")
public class LogDAO extends AbstractDAO {
	
	public List<Map<String, Object>> logList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("log.logList", map);
	}
	
	public int logTotalList(Map<String, Object> map) {
		return totalList("log.logTotalList", map);
	}

	public void writeLog(Map<String, Object> map) {
		insertLog("log.writeLog", map);
		
	}
}
