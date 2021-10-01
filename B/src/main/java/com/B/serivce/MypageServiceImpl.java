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
	public void myinfoUpdate(Map<String, Object> map) {
		mypageDAO.myinfoUpdate(map);
	}

	@Override
	public void myAccountUpdatePW(Map<String, Object> map) {
		mypageDAO.myAccountUpdatePW(map);

	}

	@Override
	public List<Map<String, Object>> cartList(Map<String, Object> map) {
		return mypageDAO.cartList(map);
	}
}
