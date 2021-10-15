package com.B.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("cartDAO")
public class CartDAO extends AbstractDAO {
	
	public List<Map<String, Object>> cartList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("cart.cartList", map);
	}

	public Map<String, Object> getCartViewByCartNo(int caNo) {
		return selectOne("cart.getCartViewByCartNo", caNo);
	}
	
	public void cartOneDelete(Map<String, Object> map) {
		delete("cart.cartOneDelete", map);
		
	}

	public void cartProductUpDown(Map<String, Object> map) {
		update("cart.cartProductUpDown", map);
		
	}
	
	public int deleteCartByCartNo(int caNo) {
		return delete("cart.deleteCartByCartNo", caNo);
	}

	public int checkCart(Map<String, Object> map) {
		return selectOne2("cart.checkCart", map);
	}

	public void insertProductInCart(Map<String, Object> map) {
		insert("cart.insertProductInCart", map);
	}

	public void updateAmountProductInCart(Map<String, Object> map) {
		update("cart.updateAmountProductInCart", map);
	}
}
