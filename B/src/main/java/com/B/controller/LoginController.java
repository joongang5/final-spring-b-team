package com.B.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.B.common.CommandMap;
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
				session.setAttribute("m_name", login.get("m_name"));
				
				return 3;
			} else {
				return 2 ;
			}
				
		
		
		
	}	
	
	@GetMapping(value = "/loginSuccess.do")
	public ModelAndView success(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("m_name");
		mv.addObject("name", name);
		
		return mv;
}
	
	@GetMapping(value = "/join.do")
	public String join() {

		return "join";
	}
	
	
	@PostMapping(value="/join.do")
	@ResponseBody
	public int join(CommandMap ma) {	
		
		Map<String,Object> map = new HashMap<String, Object>();
	    map.put("m_name", ma.getMap().get("m_name"));
	    map.put("m_id", ma.getMap().get("m_id"));
	    map.put("m_pw",ma.getMap().get("m_pw"));
	    map.put("m_email",ma.getMap().get("m_email"));
	    map.put("m_addr", ma.getMap().get("m_addr"));
	    map.put("m_phone", ma.getMap().get("m_phone"));
		
	    int checkId = loginService.checkId((String)ma.getMap().get("m_id"));
	    
	   
	    if (checkId == 0) {
	    	loginService.join(map);
	    	return 0;
	    }else {
	    	return 1;
	    }
		
		
		
	}	
		
}