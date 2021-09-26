package com.B.serivce;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.B.dao.TestDAO;

@Service("testService")
public class TestServiceImpl implements TestService {
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private TestDAO testDAO;
	
	@Override
	public List<Map<String, Object>> boardList() {
		return testDAO.selectList();
	}

}
