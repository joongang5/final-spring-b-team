package com.B.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.B.common.CommandMap;
import com.B.serivce.CartServiceImpl;
import com.B.util.Util;

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
			ModelAndView mv = new ModelAndView("cart3");
			List<Map<String, Object>> cartList = cartService.cartList(map.getMap());
			mv.addObject("cart", cartList);
			return mv;
		} else {
			return new ModelAndView("login");
		}
	}

	@GetMapping("/cart2.do")
	public ModelAndView cart2(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			ModelAndView mv = new ModelAndView("cart2");
			List<Map<String, Object>> cartList = cartService.cartList(map.getMap());
			mv.addObject("cart2", cartList);
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

	@GetMapping({ "/cartProductDown.do", "/cartProductUp.do" })
	public String cartProductUpDown(CommandMap map, HttpServletRequest request) {
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
		if (checkValueArr[0].equals("-1")) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("totalPrice", "0");
			return jsonObj.toString();
		}

		int totalPrice = 0;
		for (int i = 0; i < checkValueArr.length; i++) {
			int caNo = Util.str2Int2(checkValueArr[i]);
			Map<String, Object> cartViewDTOMap = cartService.getCartViewByCartNo(caNo);
			int price = Util.getIntValue(cartViewDTOMap.get("p_price"));
			int count = Util.getIntValue(cartViewDTOMap.get("cnt"));
			totalPrice += price * count;
		}

		JSONObject jsonObj = new JSONObject();
		jsonObj.put("totalPrice", totalPrice);

		return jsonObj.toString();
	}
}