package com.B.serivce;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.B.dao.CartDAO;
import com.B.dao.MypageDAO;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO cartDAO;

	@Override
	public List<Map<String, Object>> cartList(Map<String, Object> map) {
		return cartDAO.cartList(map);
	}

	@Override
	public void cartOneDelete(Map<String, Object> map) {
		cartDAO.cartOneDelete(map);
	}

	@Override
	public void cartProductUpDown(Map<String, Object> map) {
		cartDAO.cartProductUpDown(map);
		
	}

}
