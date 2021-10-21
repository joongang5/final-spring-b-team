package com.B.controller;

import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	@Autowired
	private JavaMailSender mailSender;
	
	
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

				session.setAttribute("m_grade", login.get("m_grade"));

				session.setAttribute("m_no", login.get("m_no"));

				
				map.put("l_data", "로그인 성공");
				map.put("l_id", login.get("m_id"));
				
				logService.writeLog(map);
				
				return 3;
			} else {
				map.put("l_data", "로그인 실패");
				map.put("l_id", login.get("m_id"));
				logService.writeLog(map);
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
	public int join(CommandMap ma, Map<String, Object> map, HttpServletRequest request) {
		
		map.put("l_ip", util.getUserIp(request));
	    map.put("l_target", "Join");
		
		String m_addr = ma.getMap().get("postcode2") + "|" +  ma.getMap().get("address2") +  "|" +  ma.getMap().get("detailAddress2");
		System.out.println(m_addr);
		ma.put("m_addr", m_addr);
		
	    int checkId = loginService.checkId((String)ma.getMap().get("m_id"));
	    
	    System.out.println(checkId);
	    
	    if (checkId == 0) {
	    	loginService.join(ma.getMap());
	    	map.put("l_data", "회원가입 성공");
			map.put("l_id", ma.get("m_id"));
	    	logService.writeLog(map);
	    	return 0;
	    	
	    }else {
	    	
	    	map.put("l_data", "회원가입 실패");
	    	map.put("l_id", ma.get("m_id"));
	    	logService.writeLog(map);
	    	return 1;
	    }
	}
	
	@GetMapping(value="/logout.do")
	public String logout(HttpServletRequest request, Map<String, Object> map) {
		HttpSession session = request.getSession();
		
		map.put("l_ip", util.getUserIp(request));
	    map.put("l_target", "Logout");
	    
		if (session.getAttribute("m_id") != null && session.getAttribute("m_name") != null) {
			
			
		    map.put("l_data", "로그아웃 성공");
			map.put("l_id", session.getAttribute("m_id"));
			
			logService.writeLog(map);
			
			session.removeAttribute("m_id");
			session.removeAttribute("m_name");
			session.removeAttribute("m_grade");
			session.removeAttribute("m_no");
			
			return "login";
		} else {
			map.put("l_data", "로그아웃 실패");
			logService.writeLog(map);
			
			return "redirect:/login.do";
		}
	}
	
	
	@GetMapping(value="/findID.do")
	public ModelAndView findId() {
		ModelAndView mv = new ModelAndView("findIdPw");
		
		return mv;
	}
	
	@PostMapping(value ="/findIdwithEmail.do")
	@ResponseBody
	public void sendEmail(HttpServletRequest req,CommandMap map) {
		
		
		map.put("m_name", req.getParameter("m_name"));
		map.put("m_email", req.getParameter("m_email"));
		
		
		//인증 번호 생성기
		StringBuffer temp = new StringBuffer();
		Random random = new Random();
		for (int i = 0; i < 10; i++) {
			int randomIndex = random.nextInt(3);
			switch(randomIndex) {
			case 0:
				temp.append((char) ((int) (random.nextInt(26))+97));
				 break;
            case 1:
                // A-Z
                temp.append((char) ((int) (random.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((random.nextInt(10)));
                break;
			}
		}
         String key = temp.toString();  //인증키
         
		HttpSession session = req.getSession();
		session.setAttribute("key", key);
		
		
		 try {
             MimeMessage message = mailSender.createMimeMessage();
             MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                     true, "UTF-8");

             messageHelper.setFrom("hyuna960229@gmail.com"); // 보내는사람 생략하면 정상작동을 안함
             messageHelper.setTo((String) map.getMap().get("m_email")); // 받는사람 이메일
             messageHelper.setSubject("Spring B 인증메일 입니다."); 
             messageHelper.setText("인증 번호는: " + temp + " 입니다."); // 메일 내용
             
             mailSender.send(message);
         } catch (Exception e) {
             System.out.println(e);
         }
		
		
	}
	
	@PostMapping(value ="/validKey.do")
	@ResponseBody
	public String validKey(HttpServletRequest req,CommandMap map) {
		map.put("m_email", req.getParameter("m_email"));
		map.put("m_name", req.getParameter("m_name"));
		String userKey = req.getParameter("userKey");
		
		HttpSession session = req.getSession();
		if(userKey.equals(session.getAttribute("key"))) {
			String userId = loginService.getId(map.getMap());
			return userId;
		}else {
			return "1";
		}
		
		
	}
	
	
}