package com.B.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("mypageDAO")
public class MypageDAO extends AbstractDAO {
	
	public Map<String, Object> myinfo(Map<String, Object> map){
		return (Map<String, Object>) selectOne("mypage.myinfo", map);
	}

	public void myAccountDelete(Map<String, Object> map) {
		delete("mypage.myAccountDelete", map);
	}

	public void myinfoUpdate(Map<String, Object> map) {
		update("mypage.myinfoUpdate", map);
		
	}

	public void myAccountUpdatePW(Map<String, Object> map) {
		update("mypage.myAccountUpdatePW", map);
	}

	public List<Map<String, Object>> cartList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("mypage.cartList", map);
	}
}
