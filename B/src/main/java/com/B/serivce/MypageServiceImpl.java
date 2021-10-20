package com.B.serivce;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.B.dao.MypageDAO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageDAO mypageDAO;

	@Override
	public Map<String, Object> myinfo(Map<String, Object> map) {
		return mypageDAO.myinfo(map);
	}

	@Override
	public void myAccountDelete(Map<String, Object> map) {
		mypageDAO.myAccountDelete(map);
	}

	@Override
	public void myAccountUpdatePW(Map<String, Object> map) {
		mypageDAO.myAccountUpdatePW(map);

	}

	@Override
	public List<Map<String, Object>> cartList(Map<String, Object> map) {
		return mypageDAO.cartList(map);
	}

	@Override
	public void myinfoUpdatePhone(Map<String, Object> map) {
		mypageDAO.myinfoUpdatePhone(map);
		
	}

	@Override
	public void myinfoUpdateEmail(Map<String, Object> map) {
		mypageDAO.myinfoUpdateEmail(map);
	}

	@Override
	public void myinfoUpdateAddr(Map<String, Object> map) {
		mypageDAO.myinfoUpdateAddr(map);
	}

	@Override
	public int inputPointLog(Map<String, Object> map) {
		return mypageDAO.inputPointLog(map);
	}

	@Override
	public List<Map<String, Object>> getPointLogList(Map<String, Object> map) {
		return mypageDAO.getPointLogList(map);
	}

	@Override
	public int getPointLogTotalList(Map<String, Object> map) {
		return mypageDAO.getPointLogTotalList(map);
	}
}
