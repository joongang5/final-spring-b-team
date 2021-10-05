package com.B.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.B.common.CommandMap;
import com.B.serivce.AdminServiceImpl;
import com.B.util.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AdminController {
	@Resource(name = "adminService")
	private AdminServiceImpl adminService;

	@Autowired
	private Util util;

	@GetMapping("/adminMember.do")
	public ModelAndView adminMember(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("adminMember");
		map.put("m_id", "admin");
		
		// 검색 값 map에 붙이기
		if (map.containsKey("searchName")) {
			//map.put("search", search);
			//map.put("searchName", searchName);
			mv.addObject("search", map.get("search"));
			mv.addObject("searchName", map.get("searchName"));
		}
		
		if(map.containsKey("startDay") && map.containsKey("endDay")) {
			//map.put("startDay", startDay);
			//map.put("endDay", endDay);
			mv.addObject("startDay", map.get("startDay"));
			mv.addObject("endDay", map.get("endDay"));
		}
		
		if(map.containsKey("order")) {
			//map.put("order", order);
			mv.addObject("order", map.get("order"));
		}

		// 데이터베이스로 보낼 map만들기
		// CommandMap map에 담아서 보내면 될것 같다 카테고리 없기때문에 굳이 작업할 필요 X

		// 페이지네이션인포 만들기
		PaginationInfo paginationInfo = new PaginationInfo();
		int pageNo = 1; // 현재 페이지 번호
		int listScale = 10; // 한 페이지에 나올 글 수
		int pageScale = 10; // 페이지 개수

		if (request.getParameter("pageNo") != null) {
			pageNo = util.str2Int2(request.getParameter("pageNo"));
		}

		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(listScale);
		paginationInfo.setPageSize(pageScale);

		int startPage = paginationInfo.getFirstRecordIndex(); // 시작페이지
		int lastPage = paginationInfo.getRecordCountPerPage(); // 마지막 페이지

		map.put("startPage", startPage);
		map.put("lastPage", lastPage);

		// System.out.println(map.getMap());
		List<Map<String, Object>> MemberList = adminService.memberList(map.getMap());
		int totalCount = adminService.memberTotalList(map.getMap());
		// adminSerivce.MemberList(map)에 가져오게 하면
		// 데이터베이스에 한 번만 갔다 와도 된다.

		paginationInfo.setTotalRecordCount(totalCount); // 전체 글 수 저장
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("adminMember", MemberList); // 현 페이지 번호
		mv.addObject("totalCount", totalCount); // 전체 글 수

		return mv;
	}

	@PostMapping("/adminDeleteMember.do")
	public String adminDeleteMember(CommandMap map) {
		adminService.memberDelete(map.getMap());
		return "redirect:/adminMember.do";
	}

	@GetMapping("/adminLog.do")
	public ModelAndView adminLog(CommandMap map, HttpServletRequest request) {
		System.out.println(map.getMap());
		ModelAndView mv = new ModelAndView("adminLog");
		map.put("m_id", "admin");
		//String search = request.getParameter("search");
		//String searchName = request.getParameter("searchName");
		
		//String startDay = request.getParameter("startDay");
		//String endDay = request.getParameter("endDay");
		
		//String order = request.getParameter("order");
		//System.out.println(order);
		
		// 검색 값 map에 붙이기
		if (map.containsKey("searchName")) {
			//map.put("search", search);
			//map.put("searchName", searchName);
			mv.addObject("search", map.get("search"));
			mv.addObject("searchName", map.get("searchName"));
		}
		
		if(map.containsKey("startDay") && map.containsKey("endDay")) {
			//map.put("startDay", startDay);
			//map.put("endDay", endDay);
			mv.addObject("startDay", map.get("startDay"));
			mv.addObject("endDay", map.get("endDay"));
		}
		
		if(map.containsKey("order")) {
			//map.put("order", order);
			mv.addObject("order", map.get("order"));
		}

		PaginationInfo paginationInfo = new PaginationInfo();
		int pageNo = 1; // 현재 페이지 번호
		int listScale = 10; // 한 페이지에 나올 글 수
		int pageScale = 10; // 페이지 개수

		if (request.getParameter("pageNo") != null) {
			pageNo = util.str2Int2(request.getParameter("pageNo"));
		}
		
		System.out.println(pageNo);

		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(listScale);
		paginationInfo.setPageSize(pageScale);

		int startPage = paginationInfo.getFirstRecordIndex(); // 시작페이지
		int lastPage = paginationInfo.getRecordCountPerPage(); // 마지막 페이지

		map.put("startPage", startPage);
		map.put("lastPage", lastPage);

		List<Map<String, Object>> logList = adminService.logList(map.getMap());
		int totalCount = adminService.logTotalList(map.getMap());
		paginationInfo.setTotalRecordCount(totalCount); // 전체 글 수 저장
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("list", logList); // 현 페이지 번호
		mv.addObject("totalCount", totalCount); // 전체 글 수

		return mv;

	}
}