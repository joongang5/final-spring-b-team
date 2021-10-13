package com.B.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.B.common.CommandMap;
import com.B.serivce.ProductServiceImpl;
import com.B.util.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ProductController {
	@Resource(name = "productService")
	private ProductServiceImpl productService;
	
	@Autowired
	private Util util;
	
	@GetMapping(value = "/product.do") //상품 목록 조회
	public ModelAndView admin(CommandMap map, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("product");
		List<Map<String, Object>>  product = productService.productList();
		List<Map<String, Object>> categoryMain = productService.cateList();
		
		String c_main = req.getParameter("cMainSelected");
		String c_sub  = req.getParameter("cSubSelected");
		
		System.out.println(c_main);
		System.out.println(c_sub);
		Map<String, Object> p = new HashMap<String, Object>();
		//다음부터는 map.getMap()으로 한번에 하기.. 밑에 처럼 하지말고..미래의 현아에게..
		p.put("c_main", c_main);
		p.put("c_sub", c_sub);
		System.out.println(p);
		
		List<Map<String, Object>> categorySearch = productService.categorySearch(p);
	
		mv.addObject("list", product);
		mv.addObject("categoryMain", categoryMain);
		mv.addObject("categorySearch",categorySearch);
		
		
		/////////////////////////////검색+ 페이징////////////////////////////////
		
		if (map.containsKey("searchName")) {
			mv.addObject("search", map.get("search"));
			mv.addObject("searchName", map.get("searchName"));
		}
		
		if(map.containsKey("order")) {
			mv.addObject("order", map.get("order"));
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();
		int pageNo = 1; // 현재 페이지 번호
		int listScale = 10; // 한 페이지에 나올 글 수
		int pageScale = 10; // 페이지 개수

		if (req.getParameter("pageNo") != null) {
			pageNo = util.str2Int2(req.getParameter("pageNo"));
		}

		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(listScale);
		paginationInfo.setPageSize(pageScale);

		int startPage = paginationInfo.getFirstRecordIndex(); // 시작페이지
		int lastPage = paginationInfo.getRecordCountPerPage(); // 마지막 페이지

		map.put("startPage", startPage);
		map.put("lastPage", lastPage);

		List<Map<String, Object>> productList = productService.productList(map.getMap());
		int totalCount = productService.totalList(map.getMap());	
		paginationInfo.setTotalRecordCount(totalCount); // 전체 글 수 저장
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("productList", productList); // 현 페이지 번호
		mv.addObject("totalCount", totalCount); // 전체 글 수
	
		return mv;
				
	}
	
	@PostMapping(value ="/categoryMain.do")
	@ResponseBody
	public ArrayList<String> categoryMain(HttpServletRequest req) { 
		String c_main = req.getParameter("real_c_main");
		List<Map<String, Object>> category = productService.cateList2(c_main);
		ArrayList<String> sub = new ArrayList<String>();
		for (int i = 0; i < category.size(); i++) {
			sub.add((String) category.get(i).get("c_sub"));
		}
		return sub;
	}
	
	@GetMapping(value ="/registerProduct.do")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("register");
		List<Map<String, Object>> categoryMain = productService.cateList();
		mv.addObject("categoryMain", categoryMain);
		return mv;
	}
	
	@PostMapping(value ="registerProduct.do")
	public String register2(HttpServletRequest req, CommandMap map) {
		HttpSession session = req.getSession();
		map.put("p_img", session.getAttribute("p_img"));
		productService.register(map.getMap());
		if (session.getAttribute("p_img") != null) {
			session.removeAttribute("p_img");
		}
		return "redirect:/product.do";
		
	}
	
	@PostMapping(value = "searchCategoryNum.do")
	@ResponseBody
	public int search(HttpServletRequest req) {
		String c_main = req.getParameter("c_main");
		String c_sub = req.getParameter("c_sub");
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("c_main", c_main);
		p.put("c_sub", c_sub);
		
		int c_no = productService.categorySearch2(p);
		
		
		return c_no;
	}
	
	@PostMapping(value="productModify.do")
	public String modify(CommandMap map) {
		Map<String, Object> p = new HashMap<String, Object>();
		String e = (String) map.getMap().get("modify");
		String[] ee = e.split(",");
		for (int i = 0; i < ee.length; i++) {
				p.put("p_no",Integer.parseInt(ee[i]));
				p.put("p_state", map.getMap().get("p_state"));
				productService.modifyState(p);
		}
		
		return "redirect:/product.do";
	}
	
	@GetMapping(value="/productDetail.do")
	public ModelAndView detail(CommandMap map, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("productDetail");
		map.put("p_no",req.getParameter("p_no"));
		Map<String, Object> oneProduct = productService.productDetail(map.getMap());

		
		mv.addObject("detail", oneProduct);
		
		
		return  mv;
	}
	
	@PostMapping(value="/productDetail.do")
	public String detail2(CommandMap map) {
		productService.modifyDetail(map.getMap());
		
		return "redirect:/product.do";
	}
	
	@PostMapping(value="/deleteProduct.do")
	@ResponseBody
	public String delete(HttpServletRequest req) {
		
		String p_no = req.getParameter("p_no");
		productService.deleteProduct(p_no);
		return "redirect:/product.do";
	}
	
	@PostMapping(value="fileUpload.do")
	public String upload(HttpServletRequest req, MultipartFile p_img) {
		String savePath = req.getSession().getServletContext().getRealPath("./resources/uploadFile");
		
		if(!p_img.isEmpty()) {
			String originName = p_img.getOriginalFilename();
			String fName = FilenameUtils.getBaseName(originName);
			String exe = FilenameUtils.getExtension(originName);
			System.out.println(fName);
			try {
				p_img.transferTo(new File(savePath + "/" + fName +"."+ exe));
				HttpSession session = req.getSession();
				session.setAttribute("p_img", fName +"."+ exe);
				System.out.println("파일 저장 완료");
				return "redirect:/registerProduct.do";
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}
		}
		return null;
		
	}
}
