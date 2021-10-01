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
import com.B.serivce.MypageServiceImpl;

@Controller
public class MypageController {
	@Resource(name = "mypageService")
	private MypageServiceImpl mypageService;

	@GetMapping("/myinfo.do")
	public ModelAndView myinfo(CommandMap map, HttpServletRequest request) {
			map.put("m_id", "wonwoo");
			ModelAndView mv = new ModelAndView("myinfo");
			Map<String, Object> myinfo = mypageService.myinfo(map.getMap());
			mv.addObject("myinfo", myinfo);
			return mv;
	}

	@PostMapping("/myinfoUpdate.do")
	public String myinfoUpdate(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", (String) session.getAttribute("m_id"));
			mypageService.myinfoUpdate(map.getMap());
			return "redirect:/myinfo.do";
		} else {
			return "redirect:/login.do";
		}

	}

	@GetMapping("/myinfoDelete.do")
	public String myinfoDelete(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", (String) session.getAttribute("m_id"));
			return "myinfoDelete";
		}
		return "redirect:/login.do";
	}

	@GetMapping("/myinfoUpdatePW.do")
	public String myinfoUpdatePW(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", (String) session.getAttribute("m_id"));
			return "myinfoUpdatePW";
		} else {
			return "redirect:/login.do";
		}
	}

	@PostMapping("/myAccountDelete.do")
	public String myAccountDelete(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", (String) session.getAttribute("m_id"));
			mypageService.myAccountDelete(map.getMap());
			return "redirect:/logout.do";
		}
		return "redirect:/login.do";
	}

	@PostMapping("/myAccountChangePW.do")
	public String myAccountChangePW(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", (String) session.getAttribute("m_id"));
			mypageService.myAccountUpdatePW(map.getMap());
			return "redirect:myinfoUpdatePW.do?msg=ok";
		}
		return "redirect:/login.do";
	}

	@GetMapping("/cart.do")
	public ModelAndView cart(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			map.put("m_id", (String) session.getAttribute("m_id"));
			ModelAndView mv = new ModelAndView("cart");
			List<Map<String, Object>> cartList = mypageService.cartList(map.getMap());
			mv.addObject("cart", cartList);
			return mv;
		} else {
			return new ModelAndView("login");
		}
	}

}
