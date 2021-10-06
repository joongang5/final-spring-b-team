package com.B.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@SuppressWarnings("unchecked")
	@PostMapping(value="/productList.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String productList(CommandMap map) {
		List<HashMap<String, Object>> productList = (List<HashMap<String, Object>>)indexService.productList2(map.getMap());
		JSONObject jsonList = new JSONObject();
		jsonList.put("list", productList);
		System.out.println(jsonList.toJSONString());
		return jsonList.toJSONString();
	}


}
