package com.B.serivce;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.B.dao.ExchangeDAO;

@Service("exchangeService")
public class ExchangeServiceImpl implements ExchangeService {

	@Autowired
	private ExchangeDAO exchangeDAO;
	
	@Override
	public List<Map<String, Object>> exchangeList(Map<String, Object> map) {
		return exchangeDAO.selectList("admin2.getExchangeList",map); //map없이 queryid만으로 리스트 가져오기
	}
	@Override
	public int updateEState(Map<String, Object> map) {
		return exchangeDAO.update2("admin2.updateEstate", map);
	}
	@Override
	public void insertInfo(Map<String, Object> map) {
		exchangeDAO.register("admin2.insertInfo", map);
		
	}
	@Override
	public void updateInfo(Map<String, Object> map) {
		 exchangeDAO.update("admin2.updateInfo", map);
	}
	@Override
	public Map<String, Object> getInfo(Map<String, Object> map) {
		return exchangeDAO.selectOne("admin2.getInfo", map);
		
	}
	@Override
	public int getTotalList(Map<String, Object> map) {
		return exchangeDAO.totalList("admin2.getToTalList", map);
	}
	@Override
	public void insertInfo2(Map<String, Object> map) {
		exchangeDAO.register("admin2.insertInfo2", map);
		
	}
	@Override
	public void updateOState(Map<String, Object> map) {
		exchangeDAO.update("admin2.updateOstate", map);
		
	}

}
