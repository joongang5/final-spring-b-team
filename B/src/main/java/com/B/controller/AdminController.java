package com.B.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

	@GetMapping("/adminMember.do")
	public ModelAndView adminMember(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView("adminMember");
		map.put("m_id", session.getAttribute("m_id"));
		map.put("m_name", session.getAttribute("m_name"));
		map.put("m_no", session.getAttribute("m_no"));
		map.put("m_grade", session.getAttribute("m_grade"));
		
		// 해당 값들이 map에 포함하고 있다면 mv로 넘기기
		if (map.containsKey("searchName")) {
			mv.addObject("search", map.get("search"));
			mv.addObject("searchName", map.get("searchName"));
		}
		
		if(map.containsKey("startDay") && map.containsKey("endDay")) {
			mv.addObject("startDay", map.get("startDay"));
			mv.addObject("endDay", map.get("endDay"));
		}
		
		if(map.containsKey("order")) {
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
			pageNo = Util.str2Int2(request.getParameter("pageNo"));
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
	
	@GetMapping("/adminHeader.do")
	public ModelAndView adminHeader() {
		ModelAndView mv = new ModelAndView("adminHeader");
		return mv;
	}

}
