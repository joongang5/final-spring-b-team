package com.B.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.B.common.CommandMap;
import com.B.serivce.IndexServiceImpl;
import com.B.serivce.MypageServiceImpl;

@Controller
public class IndexController {
	@Resource(name = "indexService")
	private IndexServiceImpl indexService;
	@Resource(name = "mypageService")
	private MypageServiceImpl mypageService;

	@RequestMapping(value = "/header.do")
	public ModelAndView header(CommandMap map) {
		ModelAndView mv = new ModelAndView("header");
		
		//헤더
		List<HashMap<String, Object>> category = indexService.getCategory();
		List<HashMap<String, Object>> categoryMain = indexService.getCategoryMain();
		mv.addObject("category", category);
		mv.addObject("categoryMain",categoryMain);

		return mv;
	}
	
	@RequestMapping(value = "/index.do")
	public ModelAndView main1(CommandMap map) {
		ModelAndView mv = new ModelAndView("index");
		
		//헤더
		List<HashMap<String, Object>> category = indexService.getCategory();
		List<HashMap<String, Object>> categoryMain = indexService.getCategoryMain();
		mv.addObject("category", category);
		mv.addObject("categoryMain",categoryMain);
		
		//컨테이너
		List<Map<String, Object>> productList = indexService.productList();
		mv.addObject("productList", productList);

		return mv;
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping(value="/productList.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String productList(CommandMap map) {
		List<HashMap<String, Object>> productList = indexService.productList2(map.getMap());
		JSONObject jsonList = new JSONObject();
		jsonList.put("list", productList);
		jsonList.put("test", "test");
		//System.out.println(jsonList.toJSONString());
		return jsonList.toJSONString();
	}
	
	@SuppressWarnings("null")
	@RequestMapping(value = "/categoryPage.do")
	public ModelAndView categoryPage(CommandMap map) {
		ModelAndView mv = new ModelAndView("categoryPage");
		String mainCategory = (String) map.get("category");
		String subCategory = (String) map.get("sub");
		String option = (String) map.get("option");
		String title = "";
		if(mainCategory != null && subCategory !=null) {
			title = mainCategory + "&gt;" + subCategory;
		}else if(mainCategory != null && subCategory ==null) {
			title = mainCategory;
		}else {
			title = "가구";
		}
		mv.addObject("title",title);
		mv.addObject("mainCategory", mainCategory);
		mv.addObject("subCategory", subCategory);
		
		List<HashMap<String, Object>> category = indexService.getCategory();
		List<HashMap<String, Object>> categoryMain = indexService.getCategoryMain();
		mv.addObject("category", category);
		mv.addObject("categoryMain",categoryMain);
		String optionSelect = "p_date";
		if(option != null) {
			optionSelect = option;
		}
		map.put("option2", optionSelect);
		mv.addObject("optionSelect", optionSelect);
		List<HashMap<String, Object>> cp_productList = indexService.cp_productList(map.getMap());
		mv.addObject("cp_productList", cp_productList);
		
		if(map.get("search") != null &&  map.get("search") != "") {
			mv.addObject("search", map.get("search"));	
			List<HashMap<String, Object>> searchList = indexService.searchList(map.getMap());
			
			System.out.println(searchList);
			mv.addObject("searchList", searchList);
		}
		return mv;
	}
	
	@PostMapping(value="/categoryPage.do")
	public ModelAndView categoryPageSearch(CommandMap map) {
		ModelAndView mv = new ModelAndView("categoryPage");
		System.out.println(map.getMap());
		mv.addObject("search", map.get("key"));
		List<HashMap<String, Object>> searchList = indexService.searchList(map.getMap());
		mv.addObject("searchList", searchList);
		return mv;
	}
	
	
	@RequestMapping(value = "/detail.do")
	public ModelAndView detail(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("detail");
		Map<String, Object> detail = indexService.detail(map.getMap());
		System.out.println(detail);
		mv.addObject("detail", detail);
		
		//최근 본 상품에 추가
		HttpSession session = request.getSession();
		if(session.getAttribute("m_id") != null) {
			String id = (String) session.getAttribute("m_id");
			map.put("m_id", id);
			map.put("p_no", map.get("product"));
			
			//이미 기록에 있는 상품은 또 기록하지 않기 위한 처리
			List<Map<String, Object>> recentLogList = mypageService.getRecentLogList(map.getMap());
			int result = 0;
			 for(int i = 0; i < recentLogList.size(); i++){
				 for (int j = 0; j < recentLogList.get(i).size(); j++) {
					 if(map.get("p_no") == recentLogList.get(i).get("p_no")) {
						 result = 1;
					 }
				}
			  }
			 if(result == 0) mypageService.inputRecentLog(map.getMap());

			//최근 본 상품은 10개까지 저장하도록 처리
			result = mypageService.countRecentLog(map.getMap());
			if (result > 10) {
				mypageService.deleteRecentLog(map.getMap());
			}
		}
		
		return mv;
	}

}
