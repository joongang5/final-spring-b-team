package com.B.serivce;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.B.dao.CartDAO;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO cartDAO;

	@Override
	public List<Map<String, Object>> cartList(Map<String, Object> map) {
		return cartDAO.cartList(map);
	}

	@Override
	public Map<String, Object> getCartViewByCartNo(int caNo) {
		return cartDAO.getCartViewByCartNo(caNo);
	}

	@Override
	public void cartOneDelete(Map<String, Object> map) {
		cartDAO.cartOneDelete(map);
	}

	@Override
	public void cartProductUpDown(Map<String, Object> map) {
		cartDAO.cartProductUpDown(map);
		
	}

	@Override
	public int deleteCartByCartNo(int caNo) {
		return cartDAO.deleteCartByCartNo(caNo);
	}

}
