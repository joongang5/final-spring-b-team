package com.B.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.B.serivce.KakaoPayService;

import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class KakaoPayController {
	
		@Setter(onMethod_= @Autowired)
		private KakaoPayService kakao;


		@GetMapping(value = "/kakaoPay.do")
				    public void kakaoPayGet() {
				        System.out.println("들어왔댱");
				    }
				
				@PostMapping(value = "/kakaoPay.do")
			    public String kakaoPay() {
			        log.info("kakaoPay post............................................");
			        
			        return "redirect:" + kakao.Ready();
			 
			    }

			    @GetMapping(value ="/kakaoPaySuccess.do")
			    public ModelAndView kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
			        ModelAndView mv = new ModelAndView("kakaoPaySuccess");
			        log.info("kakaoPaySuccess get............................................");
			        log.info("kakaoPaySuccess pg_token : " + pg_token);
			        
			        mv.addObject("payInfo",kakao.kakaoPayInfo(pg_token));
			        return mv;
			    }
	
		
		
		
	    
	}
	 
