package com.B.serivce;

import java.util.List;
import java.util.Map;

public interface LogService {

	public List<Map<String, Object>> logList(Map<String, Object> map);

	public int logTotalList(Map<String, Object> map);
	
	public void writeLog(Map<String, Object> map);
}
