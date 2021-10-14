package com.B.controller;

import java.util.HashMap;
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
import com.B.serivce.MypageServiceImpl;
import com.B.util.Util;

@Controller
public class MypageController {
	@Resource(name = "mypageService")
	private MypageServiceImpl mypageService;
	
	@Resource (name = "logService")
	private LogServiceImpl logService;
	
	@Autowired
	private Util util;

	@GetMapping("/myinfo.do")
	public ModelAndView myinfo(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			ModelAndView mv = new ModelAndView("myinfo");
			Map<String, Object> myinfo = mypageService.myinfo(map.getMap());
			mv.addObject("myinfo", myinfo);
			return mv;
		} else {
			return new ModelAndView("login");
		}
	}

	@PostMapping("/myinfoUpdatePhone.do")
	public String myinfoUpdatePhone(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			mypageService.myinfoUpdatePhone(map.getMap());
			return "redirect:/myinfo.do";
		} else {
			return "redirect:/login.do";
		}
	}

	@PostMapping("/myinfoUpdateEmail.do")
	public String myinfoUpdateEmail(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			mypageService.myinfoUpdateEmail(map.getMap());
			return "redirect:/myinfo.do";
		} else {
			return "redirect:/login.do";
		}
	}

	@PostMapping("/myinfoUpdateAddr.do")
	public String myinfoUpdateAddr(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			mypageService.myinfoUpdateAddr(map.getMap());
			return "redirect:/myinfo.do";
		} else {
			return "redirect:/login.do";
		}
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
			return "redirect:/myinfo.do";
		} else {
			return "redirect:/login.do";
		}
	}
	

	@GetMapping("/myinfoDelete.do")
	public String myinfoDelete(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			return "myinfoDelete";
		} else {
			return "login";
		}
	}

	@GetMapping("/myinfoUpdatePW.do")
	public String myinfoUpdatePW(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			return "myinfoUpdatePW";
		} else {
			return "login";
		}
	}

	@PostMapping("/myAccountDelete.do")
	public String myAccountDelete(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			
			HashMap<String, Object> map2 = new HashMap<String, Object>();
			map2.put("l_ip", util.getUserIp(request));
			map2.put("l_target", "Withdrawal");
			map2.put("l_data", "회원탈퇴 성공");
			map2.put("m_no", session.getAttribute("m_no"));
			
			logService.writeLog(map2);
			mypageService.myAccountDelete(map.getMap());
			
			return "redirect:/login.do";
		} else {
			return "redirect:/login.do";
		}
	}

	@PostMapping("/myAccountChangePW.do")
	public String myAccountChangePW(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", session.getAttribute("m_id"));
			map.put("m_name", session.getAttribute("m_name"));
			
			HashMap<String, Object> map2 = new HashMap<String, Object>();
			map2.put("l_ip", util.getUserIp(request));
			map2.put("l_target", "ChangePW");
			map2.put("l_data", "비밀번호 변경 성공");
			map2.put("m_no", session.getAttribute("m_no"));
			
			logService.writeLog(map2);
			
			mypageService.myAccountUpdatePW(map.getMap());
			
			
			return "redirect:myinfoUpdatePW.do?msg=ok";

		} else {
			return "redirect:/login.do";
		}
	}
}
