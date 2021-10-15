package com.B.serivce;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.B.dao.LogDAO;

@Service("logService")
public class LogServiceImpl implements LogService {

	@Autowired
	private LogDAO logDAO;

	@Override
	public int logTotalList(Map<String, Object> map) {
		return logDAO.logTotalList(map);
	}

	@Override
	public List<Map<String, Object>> logList(Map<String, Object> map) {
		return logDAO.logList(map);
	}

	@Override
	public void writeLog(Map<String, Object> map) {
		logDAO.writeLog(map);

	}

}
