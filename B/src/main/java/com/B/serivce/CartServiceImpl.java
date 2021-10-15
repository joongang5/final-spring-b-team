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
	
	//장바구니에 해당 상품을 추가한다
	//단 먼저 여기서 장바구니를 체크해서 해당 고객에 넣을려는 상품이 하나 이상인 경우에는
	//기존 cart에 담겨져 있던 상품의 수량을 추가해주고 아니면 새로운 상품을 cart에 넣어준다.
	@Override
	public void insertProductInCart(Map<String, Object> map) {
		int result = cartDAO.checkCart(map);
		System.out.println("결과 " + result);
		// cart에 해당하는 상품의 수량이 없다면
		if(result == 0) {
			cartDAO.insertProductInCart(map);
		}else {
			//cart에 해당상품이 하나라도 존재한다면
			cartDAO.updateAmountProductInCart(map);
		}
		
	}
	/*
	 * //해당 고객의 장바구니에 상품과 수량을 파악한다. //상품번호, 수량, 고객번호
	 * 
	 * @Override public Map<String, Object> checkCart(Map<String, Object> map) {
	 * return cartDAO.checkCart(map); }
	 */
	
	//해당 상품이 해당 고객에 이미 존재하는 경우 수량을 추가해준다.
	@Override
	public void updateAmountProductInCart(Map<String, Object> map) {
		cartDAO.updateAmountProductInCart(map);
	}

}
