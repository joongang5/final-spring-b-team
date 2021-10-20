package com.B.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.B.common.CommandMap;
import com.B.serivce.LogServiceImpl;
import com.B.serivce.LoginService;
import com.B.serivce.MypageServiceImpl;
import com.B.util.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class MypageController {
	@Resource(name = "mypageService")
	private MypageServiceImpl mypageService;
	@Resource(name = "loginService")
	private LoginService loginService;
	@Resource (name = "logService")
	private LogServiceImpl logService;
	
	@Autowired
	private Util util;

	@GetMapping("/myinfo.do")
	public ModelAndView myinfo(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("myinfo");
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			Map<String, Object> myinfo = mypageService.myinfo(map.getMap());
			mv.addObject("myinfo", myinfo);
		}
		return mv;
//		else {
//			return new ModelAndView("login");
//		}
	}

	@PostMapping("/myinfoUpdatePhone.do")
	public String myinfoUpdatePhone(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			mypageService.myinfoUpdatePhone(map.getMap());
		}
		return "redirect:/myinfo.do";
//			return "redirect:/myinfo.do";
//		} 
//		else {
//			return "redirect:/login.do";
//		}
	}

	@PostMapping("/myinfoUpdateEmail.do")
	public String myinfoUpdateEmail(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			mypageService.myinfoUpdateEmail(map.getMap());
		} return "redirect:/myinfo.do";
//		} else {
//			return "redirect:/login.do";
//		}
	}

	@PostMapping("/myinfoUpdateAddr.do")
	public String myinfoUpdateAddr(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			mypageService.myinfoUpdateAddr(map.getMap());
		} return "redirect:/myinfo.do";
//		} else {
//			return "redirect:/login.do";
//		}
	}
	
	@PostMapping("/myinfoUpdateAddr2.do")
	public String myinfoUpdateAddr2(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			
			String m_addr = map.getMap().get("postcode") + "|" +  map.getMap().get("address") + "|" +  map.getMap().get("detailAddress");
			map.put("m_addr", m_addr);
			
			mypageService.myinfoUpdateAddr(map.getMap());
		}	return "redirect:/myinfo.do";
//		} else {
//			return "redirect:/login.do";
//		}
	}
	

	@GetMapping("/myinfoDelete.do")
	public String myinfoDelete(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
		}	return "myinfoDelete";
//		} else {
//			return "login";
//		}
	}

	@GetMapping("/myinfoUpdatePW.do")
	public String myinfoUpdatePW(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
		}	return "myinfoUpdatePW";
//		} else {
//			return "login";
//		}
	}

	@PostMapping("/myAccountDelete.do")
	public String myAccountDelete(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("l_ip", util.getUserIp(request));
		map2.put("l_target", "Withdrawal");
		
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			
			map2.put("l_data", "회원탈퇴 성공");
			map2.put("l_id", session.getAttribute("m_id"));
			logService.writeLog(map2);
			
			mypageService.myAccountDelete(map.getMap());
			
		return "redirect:/myinfoDelete.do";
//			return "redirect:/login.do";
		} else {
			map2.put("l_data", "회원탈퇴 실패");
			logService.writeLog(map2);
//			return "redirect:/login.do";
			return "redirect:/myinfoDelete.do";
		}
	}

	@PostMapping("/myAccountChangePW.do")
	public String myAccountChangePW(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("l_ip", util.getUserIp(request));
		map2.put("l_target", "ChangePW");
		
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			
			
			map2.put("l_data", "비밀번호 변경 성공");
			map2.put("l_id", session.getAttribute("m_id"));
			logService.writeLog(map2);
			
			mypageService.myAccountUpdatePW(map.getMap());
			
			
			return "redirect:myinfoUpdatePW.do?msg=ok";

		} else {
			map2.put("l_data", "비밀번호 변경 실패");
			logService.writeLog(map2);
			
			return "redirect:/myinfoUpdatePW.do";
//			return "redirect:/login.do";
		}
	}
	
	@GetMapping("/mypage_iframe.do")
	public ModelAndView mypageIframe(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mypage_iframe");
		
		if (map.containsKey("to")) {
			mv.addObject("to", map.get("to"));
		}
		
		return mv;
	}
	
	@GetMapping("/mypage_point.do")
	public ModelAndView myPagePoint(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mypage_point");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("m_id") != null) {
			String id = (String) session.getAttribute("m_id");
			map.put("m_id", id);
			
			Map<String, Object> memberInfo = loginService.login(id);
			mv.addObject("m_point", memberInfo.get("m_point"));
	
			if (map.containsKey("category")) {
				if (!"gain".equals(map.get("category"))
						&& !"use".equals(map.get("category")) ) {
					map.remove("category");
				}
			}
	
			PaginationInfo paginationInfo = new PaginationInfo();
			int pageNo = 1;
			int listScale = 10;
			int pageScale = 5;
	
			if (request.getParameter("pageNo") != null) {
				pageNo = Util.str2Int2(request.getParameter("pageNo"));
			}
	
			paginationInfo.setCurrentPageNo(pageNo);
			paginationInfo.setRecordCountPerPage(listScale);
			paginationInfo.setPageSize(pageScale);
	
			int startPage = paginationInfo.getFirstRecordIndex();
			int lastPage = paginationInfo.getRecordCountPerPage();
	
			map.put("startPage", startPage);
			map.put("lastPage", lastPage);
			
			List<Map<String, Object>> pointLogList = mypageService.getPointLogList(map.getMap());
			int totalRecords = mypageService.getPointLogTotalList(map.getMap());
			paginationInfo.setTotalRecordCount(totalRecords);
			mv.addObject("paginationInfo", paginationInfo);
			mv.addObject("pageNo", pageNo);
			mv.addObject("totalRecords", totalRecords);
			mv.addObject("pointLogList", pointLogList);
		}

		return mv;
	}
	
	@GetMapping("/mypage_recent.do")
	public ModelAndView myPageRecent(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mypage_recent");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("m_id") != null) {
			String id = (String) session.getAttribute("m_id");
			map.put("m_id", id);
			
			List<Map<String, Object>> recentLogList = mypageService.getRecentLogList(map.getMap());
			mv.addObject("recentLogList", recentLogList);
		}
		
		return mv;
	}
	
}
