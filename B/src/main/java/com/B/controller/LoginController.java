package com.B.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.B.common.CommandMap;
import com.B.serivce.LogServiceImpl;
import com.B.serivce.LoginServiceImpl;
import com.B.util.Util;

@Controller
public class LoginController {
	@Resource (name = "loginService")
	private LoginServiceImpl loginService;
	
	@Resource (name = "logService")
	private LogServiceImpl logService;
	
	@GetMapping(value = "/login.do")
	public String login() {
		return "login";
}
	@Autowired
	private Util util;
	
	@PostMapping(value="/login.do")
	@ResponseBody
	public int login (HttpServletRequest request, Map<String, Object> map) {	//ajax로 
		String id =  request.getParameter("m_id");
	    String pw = request.getParameter("m_pw");
	    
	    map.put("l_ip", util.getUserIp(request));
	    map.put("l_target", "Login");
	
		Map<String, Object> login = loginService.login(id);
		
			//System.out.println(login.get("m_pw"));
			if(login.get("m_pw").equals(pw)) {
				HttpSession session = request.getSession();
				session.setAttribute("m_id", login.get("m_id"));
				session.setAttribute("m_name", login.get("m_name"));
				session.setAttribute("m_no", login.get("m_no"));
				
				map.put("l_data", "로그인 성공");
				map.put("m_no", login.get("m_no"));
				
				logService.writeLog(map);
				
				return 3;
			} else {
				
				return 2 ;
			}
	}
	
	@RequestMapping(value= "/naverCallback.do")
	public String callback() { //네이버 api 관련
		return "logout";
	}
	
	

	
	@GetMapping(value = "/join.do")
	public String join() { //회원가입 

		return "join";
	}
	
	
	@PostMapping(value="/join.do")
	@ResponseBody
	public int join(CommandMap ma) {	
		
		String m_addr = ma.getMap().get("postcode2") + "|" +  ma.getMap().get("address2") +  "|" +  ma.getMap().get("detailAddress2");
		System.out.println(m_addr);
		ma.put("m_addr", m_addr);
		
	    int checkId = loginService.checkId((String)ma.getMap().get("m_id"));
	    
	    System.out.println(checkId);
	    
	    if (checkId == 0) {
	    	loginService.join(ma.getMap());
	    	
	    	return 0;
	    	
	    }else {

	    	return 1;
	    }
	}
	
	@GetMapping(value="/logout.do")
	public String logout(HttpServletRequest request, Map<String, Object> map) {
		HttpSession session = request.getSession();
		
		map.put("l_ip", util.getUserIp(request));
	    map.put("l_target", "Logout");
	    
		if (session.getAttribute("m_id") != null || session.getAttribute("m_name") != null || session.getAttribute("m_no") != null) {
			
			
		    map.put("l_data", "로그아웃 성공");
			map.put("m_no", session.getAttribute("m_no"));
			
			logService.writeLog(map);
			
			session.removeAttribute("m_no");
			session.removeAttribute("m_id");
			session.removeAttribute("m_name");
			
			return "redirect:/login.do";
		} else {
			return "redirect:/login.do";
		}
	}
}