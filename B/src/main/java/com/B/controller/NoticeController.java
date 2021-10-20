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
import com.B.serivce.NoticeServiceImpl;
import com.B.util.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


@Controller
public class NoticeController {
	@Resource(name = "noticeService")
	private NoticeServiceImpl noticeService;

	@GetMapping("/notice_list.do")
	public ModelAndView noticeList(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			map.put("m_no", session.getAttribute("m_no"));
			
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
			
			
			ModelAndView mv = new ModelAndView("notice_list");
			List<Map<String, Object>> noticeList_important = noticeService.noticeList_important(map.getMap());
			List<Map<String, Object>> noticeList_normal = noticeService.noticeList_normal(map.getMap());
			int totalCount= noticeService.noticeList_normal_Total(map.getMap());
			mv.addObject("list_important", noticeList_important);
			mv.addObject("list_normal", noticeList_normal);
			paginationInfo.setTotalRecordCount(totalCount); // 전체 글 수 저장
			mv.addObject("paginationInfo", paginationInfo);
			mv.addObject("pageNo", pageNo); //현재 페이지 번호
			mv.addObject("totalCount", totalCount); // 전체 글 수
			return mv;
		} else {
			return new ModelAndView("login");
		}
	}
	
	@GetMapping("/notice_write.do")
	public String noticeWrite(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			map.put("m_no", session.getAttribute("m_no"));
			return "notice_write";
		} else {
			return "login";
		}
	}
	
	@PostMapping("/notice_write.do")
	public String noticeWrite2(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			map.put("m_no", session.getAttribute("m_no"));
			
			noticeService.noticeWrite(map.getMap());
			return "redirect:/notice_list.do";
		} else {
			return "redirect:/login.do";
		}
	}
	
	@GetMapping("/notice_detail.do")
	public ModelAndView noticeDetail(CommandMap map, HttpServletRequest request) {
		int n_no = Util.str2Int2(request.getParameter("n_no"));
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			map.put("m_no", session.getAttribute("m_no"));
			map.put("n_no", n_no);
			
			Map<String, Object> detail = noticeService.noticeDetail(map.getMap());
			ModelAndView mv = new ModelAndView("notice_detail");
			mv.addObject("detail", detail);
			return mv;
		} else {
			return new ModelAndView("login");
		}
	}
	
	@GetMapping("/notice_update.do")
	public ModelAndView noticeUpdate(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			map.put("m_no", session.getAttribute("m_no"));
			
			Map<String, Object> detail = noticeService.noticeDetail(map.getMap());
			ModelAndView mv = new ModelAndView("notice_update");
			mv.addObject("detail", detail);
			return mv;
		} else {
			return new ModelAndView("login");
		}
	}
	
	@PostMapping("/notice_update.do")
	public String noticeUpdate2(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			map.put("m_no", session.getAttribute("m_no"));
			
			noticeService.noticeUpdate(map.getMap());
			return "redirect:/notice_detail.do?n_no=" + map.get("n_no");
	}else {
		return "login";
	}
}
	
	@GetMapping("/noticeDelete.do")
	public String noticeDelete(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			map.put("m_no", session.getAttribute("m_no"));
			
			noticeService.noticeDelete(map.getMap());
			
			return "redirect:/notice_list.do";
		} else {
			return "login";
		}
	}
}
