package com.B.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.B.common.CommandMap;
import com.B.serivce.OrderService;


@Controller
public class OrderController {
	@Resource(name = "orderService")
	private OrderService orderService;


	@RequestMapping(value = "/orderhistory.do")
	public ModelAndView main1(CommandMap map) {

		ModelAndView mv = new ModelAndView("orderhistory");
//		map.put("p_no", 4);

		return mv;
	}
	@GetMapping("/orderhistory1.do")
	public ModelAndView orderhistory1(CommandMap map) {
		ModelAndView mv = new ModelAndView("orderhistory");
		
		map.put("m_no", "1");
		
		String startDay = (String) map.get("searchStartDate");
		String endDay = (String) map.get("searchEndDate");
		// 검색 값 map에 붙이기
		if(startDay != null && endDay != null) {
			map.put("startDay", startDay);
			map.put("endDay", endDay);
			mv.addObject("startDay", startDay);
			mv.addObject("endDay", endDay);
		}
		List<Map<String, Object>> list = orderService.getListByMemberNo(map.getMap());
		
		mv.addObject("list", list);

		return mv;
	}
	
	@GetMapping("/orderhistory2.do")
	public ModelAndView orderhistory2(CommandMap map) {
		ModelAndView mv = new ModelAndView("orderhistory");
		map.put("m_id", "admin");

		System.out.println(map.getMap());
		//String startDay = request.getParameter("startDay");
		//String endDay = request.getParameter("endDay");
		String startDay = (String) map.get("searchStartDate");
		String endDay = (String) map.get("searchEndDate");
		// 검색 값 map에 붙이기
		if(startDay != null && endDay != null) {
			map.put("startDay", startDay);
			map.put("endDay", endDay);
			mv.addObject("startDay", startDay);
			mv.addObject("endDay", endDay);
		}
		
		List<Map<String, Object>> dateList = orderService.dateList(map.getMap());
		
		mv.addObject("dateList", dateList);
		
		return mv;
	}
	
}
