package com.B.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.B.common.CommandMap;
import com.B.serivce.IndexServiceImpl;

@Controller
public class IndexController {
	@Resource(name = "indexService")
	private IndexServiceImpl indexService;


	@RequestMapping(value = "/index.do")
	public ModelAndView main1(CommandMap map) {
		ModelAndView mv = new ModelAndView("index");
		
		//헤더
		List<HashMap<String, Object>> category = indexService.getCategory();
		List<HashMap<String, Object>> categoryMain = indexService.getCategoryMain();
		mv.addObject("category", category);
		mv.addObject("categoryMain",categoryMain);
		
		//컨테이너
		List<Map<String, Object>> productList = indexService.productList();
		mv.addObject("productList", productList);

		return mv;
	}


}
