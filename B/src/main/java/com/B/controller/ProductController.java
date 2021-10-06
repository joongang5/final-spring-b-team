package com.B.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.B.common.CommandMap;
import com.B.serivce.ProductServiceImpl;

@Controller
public class ProductController {
	@Resource(name = "productService")
	private ProductServiceImpl productService;
	
	@GetMapping(value = "/product.do") //상품 목록 조회
	public ModelAndView admin(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("product");
		List<Map<String, Object>>  product = productService.productList();
		List<Map<String, Object>> categoryMain = productService.cateList();
		
		String c_main = req.getParameter("cMainSelected");
		String c_sub  = req.getParameter("cSubSelected");
		
		System.out.println(c_main);
		System.out.println(c_sub);
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("c_main", c_main);
		p.put("c_sub", c_sub);
		System.out.println(p);
		
		List<Map<String, Object>> categorySearch = productService.categorySearch(p);
	
		mv.addObject("list", product);
		mv.addObject("categoryMain", categoryMain);
		mv.addObject("categorySearch",categorySearch);
	
		return mv;
				
	}
	
	@PostMapping(value ="/categoryMain.do")
	@ResponseBody
	public ArrayList<String> categoryMain(HttpServletRequest req) {
		String c_main = req.getParameter("real_c_main");
		List<Map<String, Object>> category = productService.cateList2(c_main);
		ArrayList<String> sub = new ArrayList<String>();
		for (int i = 0; i < category.size(); i++) {
			sub.add((String) category.get(i).get("c_sub"));
		}
		return sub;
	}
	
	
	
		
	}

