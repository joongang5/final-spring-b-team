package com.B.serivce;

import java.util.List;
import java.util.Map;

public interface CartService {
	public List<Map<String, Object>> cartList(Map<String, Object> map);
	
	public Map<String, Object> getCartViewByCartNo(int caNo);
	
	public void cartOneDelete(Map<String, Object> map);
	
	public void cartProductUpDown(Map<String, Object> map);
	
	public int deleteCartByCartNo(int caNo);
	
	public void insertProductInCart(Map<String, Object> map);
	
	public void updateAmountProductInCart(Map<String, Object> map);
}
