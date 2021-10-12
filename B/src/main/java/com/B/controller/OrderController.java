package com.B.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.B.common.CommandMap;
import com.B.serivce.LoginService;
import com.B.serivce.OrderService;
import com.B.util.Util;


@Controller
public class OrderController {
	@Resource(name = "orderService")
	private OrderService orderService;
	@Resource(name = "loginService")
	private LoginService loginService;

	@RequestMapping(value = "/orderhistory.do")
	public ModelAndView main1(CommandMap map) {

		ModelAndView mv = new ModelAndView("orderhistory");
//		map.put("p_no", 4);

		return mv;
	}
	@GetMapping("/orderhistory1.do")
	public ModelAndView orderhistory1(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("orderhistory");
		
		// 멤버의 넘버를 가져온다.
		//기본값은 3번 사람
		HttpSession session = request.getSession();
		Object idObj = session.getAttribute("m_id");
		if (idObj == null) {
			map.put("m_no", "3");
		} else {
			String memberId = String.valueOf(idObj);
			Map<String, Object> memberDTO = loginService.login(memberId);
			map.put("m_no", memberDTO.get("m_no"));
		}
		
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

		
		//새로 추가한 코드 1008
		//새롭게 추가한 배열 3개의 상태에 대한
		//상태에 대한 번호 0,0,0 세팅
		//state가 인덱스 번호를 의미
		//
		int[] stateTotalCountArr = new int[3];
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> orderViewDTO = list.get(i);
			int state = Util.parseInt(orderViewDTO.get("o_state"));
			stateTotalCountArr[state]++;
		}
		//for문을 끝내고 나면 아래에서 합산된 상태로 끝나고 jsp단 stateTotalCountArr로 보내준다.
		mv.addObject("stateTotalCountArr", stateTotalCountArr);
		
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
	
	
	@GetMapping("/checkout_temp.do")
	public ModelAndView tempCheckout() {
		ModelAndView mv = new ModelAndView("checkout_temp");
		return mv;
	}
	
	@PostMapping("/checkout.do")
	public ModelAndView readCheckout(CommandMap map, @RequestParam(value="p_no$cnt",required=true) String[] as, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("checkout");
		/*
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("m_id");
		*/
		//임시 멤버, 임시 상품 파라미터 사용
		System.out.println(map.get("m_id"));
		String id = (String) map.get("m_id");
		
		if (as != null) {
			//상품 데이터 가져오기
			List<Map<String, Object>> orderProductList = new ArrayList<Map<String, Object>>();
			for (int i = 0; i < as.length; i++) {
				Map<String, Object> orderProduct = new HashMap<>();
			    String[] str = as[i].split(",");
			    int p_no = Integer.parseInt(str[0]);
			    int cnt = Integer.parseInt(str[1]);
			    System.out.println("p_no="+p_no);
			    System.out.println("cnt="+cnt);
			    orderProduct = orderService.getOrderProductInfo(p_no);
			    orderProduct.put("cnt", cnt);
			    orderProduct.put("amount", (int)orderProduct.get("p_price")*cnt);
			    orderProductList.add(orderProduct);
			}
			mv.addObject("orderProductList", orderProductList);
			
			//멤버 데이터 가져오기
			Map<String, Object> memberInfo = loginService.login(id);
			//이름, 연락처, 주소, 적립금만 가져가기
			//주소는 칼럼 분할 문제 때문에 일단 생략
			mv.addObject("m_name", memberInfo.get("m_name"));
			//mv.addObject("memberInfo", memberInfo.get("m_addr"));
			mv.addObject("m_phone", memberInfo.get("m_phone"));
			mv.addObject("m_point", memberInfo.get("m_point"));
		} else {
			//가져온 상품 없을 때 처리할 내용
		}
		
		return mv;
	}
	
	
}
