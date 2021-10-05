package com.B.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.B.common.CommandMap;
import com.B.serivce.TestServiceImpl;

//권오선 추가

@Controller
public class PurchaseController {
	@Resource(name = "testService")
	private TestServiceImpl testService;


	@RequestMapping(value = "/purchasehistory.do")
	public ModelAndView main1(CommandMap map) {

		ModelAndView mv = new ModelAndView("purchasehistory");
//		map.put("p_no", 4);

		List<Map<String, Object>> list = testService.boardList(map.getMap());
		mv.addObject("list", list);

		return mv;
	}


}
