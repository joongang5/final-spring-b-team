package com.B.serivce;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.B.dao.IndexDAO;

@Service("indexService")
public class IndexServiceImpl implements IndexService {
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private IndexDAO indexDAO;

	public List<HashMap<String, Object>> getCategory() {
		return indexDAO.getCategory();
	}
	public List<HashMap<String, Object>> getCategoryMain() {
		return indexDAO.getCategoryMain();
	}

	

}
