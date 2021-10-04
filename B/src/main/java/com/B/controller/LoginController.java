package com.B.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.B.serivce.LoginServiceImpl;

@Controller
public class LoginController {
	@Resource (name = "loginService")
	private LoginServiceImpl loginService;
	
	@GetMapping(value = "/login.do")
	public String login() {
		return "login";
}
	
	
	@PostMapping(value="/login.do")
	@ResponseBody
	public int login (HttpServletRequest request) {	
		String id =  request.getParameter("m_id");
	    String pw = request.getParameter("m_pw");
	
		Map<String, Object> login = loginService.login(id);
		
			//System.out.println(login.get("m_pw"));
			if(login.get("m_pw").equals(pw)) {
				HttpSession session = request.getSession();
				session.setAttribute("m_id", login.get("m_id"));
				return 3;
			} else {
				return 2 ;
			}
				
		
		
		
	}	
		
		
}