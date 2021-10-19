package com.B.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.B.common.CommandMap;
import com.B.serivce.AdminServiceImpl;
import com.B.serivce.ExchangeServiceImpl;
import com.B.serivce.PaginationService;
import com.B.util.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Admin2Controller {
	@Resource(name = "adminService")
	private AdminServiceImpl adminService;
	
	@Resource(name = "paginationService")
	private PaginationService paginationService; //페이징 관련 서비스
	
	@Resource(name ="exchangeService")
	private ExchangeServiceImpl exchangeService;
	
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
	
	@PostMapping(value="/stateModify.do")
	public String modify(CommandMap map) {
		Map<String, Object> p = new HashMap<String, Object>();
		if (map.getMap().get("modify") != "") {
			String e = (String) map.getMap().get("modify");
			System.out.println(e);
			String[] ee = e.split(",");
			for (int i = 0; i < ee.length; i++) {
				p.put("pa_id", ee[i]);
				p.put("o_state", map.getMap().get("o_state"));
				adminService.modifyState(p);
			}
		}
		return "redirect:/admin_orderList.do";
	}
	
	@RequestMapping(value="/admin_orderDetail.do")
	public ModelAndView orderDetail(HttpServletRequest req, CommandMap map) {
		ModelAndView mv = new ModelAndView("admin_orderDetail");
		
		map.put("pa_id", req.getParameter("pa_id"));
		
		Map<String, Object> orderDetail = adminService.getAdminOrderDetail(map.getMap()); 
		List<Map<String, Object>> orderDetailList = adminService.getAdminOrderDetailList(map.getMap()); 
		
		
		String m_addr2 = (String)orderDetail.get("m_addr");
		String noUni = m_addr2.replace("|", " ");
		
		mv.addObject("m_addr2", noUni);
		mv.addObject("orderDetail", orderDetail); 
		mv.addObject("orderDetailList", orderDetailList); 
		
		return mv;
	}
	
	@PostMapping(value="/registerWaybill.do")
	@ResponseBody
	public int registerWaybill(HttpServletRequest req,CommandMap map) {
		
		map.put("o_waybill", req.getParameter("way"));
		map.put("pa_id", req.getParameter("pa_id"));
		
		int complete = adminService.updateWayBill(map.getMap());
		
		return complete;
		
	}

	@RequestMapping(value="/admin_exchange.do")
	public ModelAndView exchange(HttpServletRequest req,CommandMap map) {
		ModelAndView mv = new ModelAndView("admin_exchangeList");
			
			
			PaginationInfo initial = paginationService.initialSetting(req); // 현재 페이지 정보 및 미리 설정한 page scale 설정 얻기
			
			map.put("startPage",initial.getFirstRecordIndex()); // 시작 페이지 맵에 저장
			map.put("lastPage", initial.getRecordCountPerPage());  // 끝 페이지 맵에 저장
			
			
			int totalCount = exchangeService.getTotalList(map.getMap());
			
		
			initial.setTotalRecordCount(totalCount); 
	
			List<Map<String, Object>> exchangeList  =   exchangeService.exchangeList(map.getMap());	
			
		
			
			mv.addObject("paginationInfo", initial);
			mv.addObject("pageNo", paginationService.getPageNo(req));
			mv.addObject("exchange", exchangeList); // 현 페이지 번호
			mv.addObject("totalCount", totalCount); // 전체 글 수
			
			
			
			
			return mv;		
	}
	
	@PostMapping(value="/exchanging.do") //관리자 페이지에서 신청 사유가 '불량'일 경우만
	@ResponseBody
	public int exchanging(HttpServletRequest req, CommandMap map) {
		
		map.put("o_no", req.getParameter("o_no"));
		map.put("e_state",2 );
		
		int complete =  exchangeService.updateEState(map.getMap()); //접수 대기 => 진행 중 으로 상태 변경
		
		
		return complete;
	}
	
	@RequestMapping(value="AskExchange.do")
	public ModelAndView askExchange(HttpServletRequest req,CommandMap map) {
		ModelAndView mv = new ModelAndView("exchangeForm");
		map.put("o_no", req.getParameter("o_no"));
		Map<String, Object> getInfo =   exchangeService.getInfo(map.getMap());
		mv.addObject("getInfo", getInfo); //교환접수 된 상품 정보 저장
		mv.addObject("o_no",req.getParameter("o_no"));
		return mv;
	}
	
	@PostMapping(value="registerExchange.do")
	@ResponseBody
	public void registerExchange(HttpServletRequest req, CommandMap map) {
		map.put("o_no", req.getParameter("o_no"));
		map.put("pa_id", req.getParameter("pa_id"));
		map.put("p_no", req.getParameter("p_no"));
		map.put("p_title", req.getParameter("p_title"));
		map.put("e_reason", req.getParameter("e_reason"));
		exchangeService.updateInfo(map.getMap());
		System.out.println(map.getMap());
		exchangeService.insertInfo( map.getMap());
	}
	
	
	@RequestMapping(value="AskRefund.do")
	public ModelAndView askRefund() {
		ModelAndView mv = new ModelAndView("refundForm");
		return mv;
	}
}
