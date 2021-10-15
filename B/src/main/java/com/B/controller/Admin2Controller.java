package com.B.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.B.common.CommandMap;
import com.B.serivce.AdminServiceImpl;
import com.B.serivce.PaginationService;
import com.B.util.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Admin2Controller {
	@Resource(name = "adminService")
	private AdminServiceImpl adminService;
	
	@Resource(name = "paginationService")
	private PaginationService paginationService; //페이징 관련 서비스
	
	@RequestMapping(value="/admin2.do")
	public ModelAndView admin2() {
		ModelAndView mv = new ModelAndView("admin_memberList");
		return mv;
	}
	
	@RequestMapping(value="/admin_orderList.do")
	public ModelAndView orderList(HttpServletRequest req, CommandMap map) {
		ModelAndView mv = new ModelAndView("admin_orderList");
		
		PaginationInfo initial = paginationService.initialSetting(req); // 현재 페이지 정보 및 미리 설정한 page scale 설정 얻기
		
		map.put("startPage",initial.getFirstRecordIndex()); // 시작 페이지 맵에 저장
		map.put("lastPage", initial.getRecordCountPerPage());  // 끝 페이지 맵에 저장
		
		List<Map<String, Object>> orderList = adminService.getAdminOrderList(map.getMap()); 
		int totalCount = adminService.getOrderTotalList(map.getMap());
		
	
		initial.setTotalRecordCount(totalCount); 
		
	
		
		mv.addObject("paginationInfo", initial);
		mv.addObject("pageNo", paginationService.getPageNo(req));
		mv.addObject("AdminOrderList", orderList); // 현 페이지 번호
		mv.addObject("totalCount", totalCount); // 전체 글 수

		
		return mv;
	}
	
	@PostMapping(value="stateModify.do")
	public String modify(CommandMap map) {
		Map<String, Object> p = new HashMap<String, Object>();
		if (map.getMap().get("modify") != "") {
			String e = (String) map.getMap().get("modify");
			System.out.println(e);
			String[] ee = e.split(",");
			for (int i = 0; i < ee.length; i++) {
				p.put("o_no", Integer.parseInt(ee[i]));
				p.put("o_state", map.getMap().get("o_state"));
				adminService.modifyState(p);
			}
		}
		return "redirect:/admin_orderList.do";
	}
	
	@RequestMapping(value="admin_orderDetail")
	public ModelAndView orderDetail(HttpServletRequest req, CommandMap map) {
		ModelAndView mv = new ModelAndView("admin_orderDetail");
		
		map.put("o_no", req.getParameter("o_no"));
		
		Map<String, Object> orderDetail = adminService.getAdminOrderDetail(map.getMap()); 
		mv.addObject("orderDetail", orderDetail); 
		
		return mv;
	}

}
