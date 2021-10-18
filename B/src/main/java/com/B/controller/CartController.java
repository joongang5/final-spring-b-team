package com.B.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.B.common.CommandMap;
import com.B.serivce.CartServiceImpl;
import com.B.util.Util;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class CartController {
	@Resource(name = "cartService")
	private CartServiceImpl cartService;

	@GetMapping("/cart.do")
	public ModelAndView cart(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			ModelAndView mv = new ModelAndView("cart");
			List<Map<String, Object>> cartList = cartService.cartList(map.getMap());
			mv.addObject("cart", cartList);
			return mv;
		} else {
			return new ModelAndView("login");
		}
	}

	@GetMapping("/cartOneDelete.do")
	public String cartOneDelete(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			cartService.cartOneDelete(map.getMap());
			return "redirect:/cart.do";
		} else {
			return "redirect:/login.do";
		}

	}

	@SuppressWarnings("unchecked")
	@PostMapping({ "/cartProductDown.do", "/cartProductUp.do" })
	@ResponseBody
	public String cartProductUpDown(String sendData, HttpServletRequest request)
			throws JsonParseException, JsonMappingException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> map = mapper.readValue(sendData, Map.class);

			cartService.cartProductUpDown(map);

			int totalPrice = 0;
			List<Object> checkValueArr = (List<Object>) map.get("checkValueArr");
			for (int i = 0; i < checkValueArr.size(); i++) {
				int caNo = Util.parseInt(checkValueArr.get(i));
				Map<String, Object> cartViewDTOMap = cartService.getCartViewByCartNo(caNo);
				int price = Util.parseInt(cartViewDTOMap.get("p_price"));
				int count = Util.parseInt(cartViewDTOMap.get("cnt"));
				totalPrice += price * count;
			}

			JSONObject jsonObj = new JSONObject();
			jsonObj.put("cnt", map.get("cnt"));
			jsonObj.put("totalPrice", totalPrice);

			return jsonObj.toString();
		} else {
			return "";
		}
	}

	@GetMapping("/onclickCheckBox.do")
	public String onclickCheckBox(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			cartService.cartProductUpDown(map.getMap());
			return "redirect:/cart.do";
		} else {
			return "redirect:/login.do";
		}
	}

	@SuppressWarnings("unchecked")
	@PostMapping(value = "/onclickCheckBoxAJAX.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String onclickCheckBoxAJAX(CommandMap map, String[] checkValueArr) throws Exception {
		int totalPrice = 0;
		for (int i = 0; i < checkValueArr.length; i++) {
			int caNo = Util.str2Int2(checkValueArr[i]);
			Map<String, Object> cartViewDTOMap = cartService.getCartViewByCartNo(caNo);
			int price = Util.parseInt(cartViewDTOMap.get("p_price"));
			int count = Util.parseInt(cartViewDTOMap.get("cnt"));
			totalPrice += price * count;
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("totalPrice", totalPrice);

		return jsonObj.toString();
	}

	@PostMapping(value = "/onclickDeleteAllButtonAJAX.do")
	@ResponseBody
	public int onclickDeleteAllButtonAJAX(CommandMap map, String[] checkValueArr) throws Exception {
		int result = 0;
		for (int i = 0; i < checkValueArr.length; i++) {
			int caNo = Util.str2Int2(checkValueArr[i]);

			// 카트넘버와 일치하는 데이터를 데이터베이스에서 삭제시킨다.
			result = cartService.deleteCartByCartNo(caNo);
		}

		return result;
	}

	@PostMapping(value = "/onclickDeleteOneButtonAJAX.do")
	@ResponseBody
	public int onclickDeleteOneButtonAJAX(CommandMap map) throws Exception {
		int caNo = Util.parseInt(map.get("caNo"));
		// 카트넘버와 일치하는 데이터를 데이터베이스에서 삭제시킨다.
		int result = cartService.deleteCartByCartNo(caNo);

		return result;
	}

	@GetMapping("/insertProductInCart.do")
	public String insertProductInCart(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			map.put("m_no", session.getAttribute("m_no"));
			System.out.println(map.getMap());
			String p_no = (String)map.get("p_no");
			String c_main = (String)map.get("c_main");
			String c_sub =(String)map.get("c_sub");
			cartService.insertProductInCart(map.getMap());
			return "redirect:/detail.do?category="+c_main+"&c_sub="+c_sub+"&product="+p_no+"&msg=ok";
		} else {
			return "redirect:/login.do";
		}

	}
}
