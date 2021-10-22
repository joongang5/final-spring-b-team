package com.B.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.B.common.CommandMap;
import com.B.serivce.LogServiceImpl;
import com.B.serivce.LoginService;
import com.B.serivce.MypageService;
import com.B.serivce.OrderService;
import com.B.util.Util;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;


@Controller
public class OrderController {
	@Resource(name = "orderService")
	private OrderService orderService;
	@Resource(name = "loginService")
	private LoginService loginService;
	@Resource(name = "mypageService")
	private MypageService mypageService;
	@Resource (name = "logService")
	private LogServiceImpl logService;
	@Autowired
	private Util util;

	
	@RequestMapping(value = "/orderhistory.do")
	public ModelAndView main1(CommandMap map) {

		ModelAndView mv = new ModelAndView("orderhistory");
//		map.put("p_no", 4);

		return mv;
	}
	
	@GetMapping("/orderhistory1.do")
	public ModelAndView orderhistory1(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("orderhistory");
		
		// 멤버의 넘버를 가져온다.
		//기본값은 3번 사람
		HttpSession session = request.getSession();
		Object idObj = session.getAttribute("m_id");
		if (idObj == null) {
			map.put("m_no", "3");
		} else {
			String memberId = String.valueOf(idObj);
			Map<String, Object> memberDTO = loginService.login(memberId);
			map.put("m_no", memberDTO.get("m_no"));
		}
		
		String startDay = (String) map.get("searchStartDate");
		String endDay = (String) map.get("searchEndDate");
		// 검색 값 map에 붙이기
		if(startDay != null && endDay != null) {
			map.put("startDay", startDay);
			map.put("endDay", endDay);
			mv.addObject("startDay", startDay);
			mv.addObject("endDay", endDay);
		}
		
		List<Map<String, Object>> list = orderService.getListByMemberNo(map.getMap());
		mv.addObject("list", list);

		
		//새로 추가한 코드 1008
		//새롭게 추가한 배열 3개의 상태에 대한
		//상태에 대한 번호 0,0,0 세팅
		//state가 인덱스 번호를 의미
		//
		int[] stateTotalCountArr = new int[6];
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> orderViewDTO = list.get(i);
			int state = Util.parseInt(orderViewDTO.get("o_state"));
			stateTotalCountArr[state]++;
		}
		//for문을 끝내고 나면 아래에서 합산된 상태로 끝나고 jsp단 stateTotalCountArr로 보내준다.
		mv.addObject("stateTotalCountArr", stateTotalCountArr);
		
		return mv;
	}
	
	@GetMapping("/orderhistory2.do")
	public ModelAndView orderhistory2(CommandMap map) {
		ModelAndView mv = new ModelAndView("orderhistory");
		map.put("m_id", "admin");

		System.out.println(map.getMap());
		//String startDay = request.getParameter("startDay");
		//String endDay = request.getParameter("endDay");
		String startDay = (String) map.get("searchStartDate");
		String endDay = (String) map.get("searchEndDate");
		// 검색 값 map에 붙이기
		if(startDay != null && endDay != null) {
			map.put("startDay", startDay);
			map.put("endDay", endDay);
			mv.addObject("startDay", startDay);
			mv.addObject("endDay", endDay);
		}
		
		List<Map<String, Object>> dateList = orderService.dateList(map.getMap());
		
		mv.addObject("dateList", dateList);
		
		return mv;
	}
	
	
	@GetMapping("/checkout.do")
	public ModelAndView cantReadCheckout() {
		ModelAndView mv = new ModelAndView("checkout");
		return mv;
	}
	
	@PostMapping("/checkout.do")
	public ModelAndView readCheckout(CommandMap map, @RequestParam(value="p_no$cnt", required=false) String[] as, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("checkout");
		
		HttpSession session = request.getSession();
		if((String) session.getAttribute("m_id") == null) {
			return mv;
		}
		String id = (String) session.getAttribute("m_id");
		int p_no = 0;
		int cnt = 0;

		if (as != null) {
			//구매할 상품 데이터 가져오기
			List<Map<String, Object>> orderProductList = new ArrayList<Map<String, Object>>();
			for (int i = 0; i < as.length; i++) {
				Map<String, Object> orderProduct = new HashMap<>();
				    String[] str = as[i].split("\\$");
				    p_no = Integer.parseInt(str[0]);
				    cnt = Integer.parseInt(str[1]);
			    orderProduct = orderService.getOrderProductInfo(p_no);
			    orderProduct.put("cnt", cnt);
			    orderProduct.put("amount", (int)orderProduct.get("p_price")*cnt);
			    orderProductList.add(orderProduct);
			}
			mv.addObject("orderProductList", orderProductList);
			
			//멤버 데이터 가져오기
			Map<String, Object> memberInfo = loginService.login(id);
			//이름, 연락처, 주소, 이메일, 적립금만 가져가기
			mv.addObject("m_name", memberInfo.get("m_name"));
			mv.addObject("m_email", memberInfo.get("m_email"));
			mv.addObject("m_addr1", memberInfo.get("m_addr1"));
			mv.addObject("m_addr2", memberInfo.get("m_addr2"));
			mv.addObject("m_addr3", memberInfo.get("m_addr3"));
			mv.addObject("m_phone", memberInfo.get("m_phone"));
			mv.addObject("m_point", memberInfo.get("m_point"));
		} else {
			//가져온 상품 없을 때 처리할 내용
			mv.addObject("noProduct", "주문할 상품 정보가 존재하지 않습니다. 다시 시도해주세요.");
		}
		
		return mv;
	}
	
	@PostMapping("/checkStock.do")
	@ResponseBody
	public int checkStock (@RequestBody Map<String, Object> jsonDTO, HttpServletRequest request) throws IOException {
		Map<String, Object> orderedProduct = new HashMap<>();
		JsonParser jsonParser = new JsonParser();
		JsonArray jsonArray = (JsonArray) jsonParser.parse(jsonDTO.get("productList").toString());
		String[] strArr = new String[2];
		int p_no = 0;
		int cnt = 0;
		int result = 0;
		for (int i = 0; i < jsonArray.size(); i++) {
			strArr = jsonArray.get(i).getAsString().split("\\$");
		    p_no = Integer.parseInt(strArr[0]);
		    cnt = Integer.parseInt(strArr[1]);
		    orderedProduct.put("p_no", p_no);
		    orderedProduct.put("cnt", cnt);
		    result = orderService.checkStock(orderedProduct);
			if(result < 0) {
				return 0;
			}
		}
		return 1;
	}
	
	@RequestMapping(value="verifyPayment/{imp_uid}.do")
	@ResponseBody
	public IamportResponse<Payment> paymentByImpUid(@PathVariable(value="imp_uid") String imp_uid, Model model, Locale locale, HttpSession session) 
			throws IamportResponseException, IOException{	
		IamportClient client = new IamportClient("5287507517506742","dd927e5ef9f6a131e0c8d247e4b31828fb27d9324758dc336b55ca6dbd4d4bbd8793872445d13135");
		return client.paymentByImpUid(imp_uid);
	}
	
	@PostMapping("/checkoutResult.do")
	@ResponseBody
	public ModelAndView checkoutResult (@RequestBody Map<String, Object> jsonDTO, HttpServletRequest request) throws IOException {
		/*
		 * {
		 		pa_id : pa_id,
       			pa_amount : pa_amount,
       			pa_plan : pa_plan,
       			pa_date : pa_date,
       			productList : productArr,
       			usePoint : usePoint,
       			finalWillPoint : finalWillPoint
       			buyer_name : buyer_name,
           		buyer_addr : buyer_addr,
           		buyer_postcode : buyer_postcode
           		errorMsg : errorMsg
       		}
		 */
		ModelAndView mv = new ModelAndView();
		Map<String, Object> paymentInfo = new HashMap<>();
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("m_id");
		paymentInfo.put("m_id",id);
		
		paymentInfo.put("pa_id",jsonDTO.get("pa_id"));
		paymentInfo.put("pa_amount",jsonDTO.get("pa_amount"));
		paymentInfo.put("pa_plan",jsonDTO.get("pa_plan"));
		paymentInfo.put("pa_date",jsonDTO.get("pa_date"));
		paymentInfo.put("usePoint",jsonDTO.get("usePoint"));
		paymentInfo.put("finalWillPoint",jsonDTO.get("finalWillPoint"));
		paymentInfo.put("buyer_addr",jsonDTO.get("buyer_addr"));
		paymentInfo.put("buyer_postcode",jsonDTO.get("buyer_postcode"));
		/*
		for(Entry<String, Object> elem : jsonDTO.entrySet()){ 
			paymentInfo.put(elem.getKey(), elem.getValue()); 
		}
		*/
		if (jsonDTO.get("pa_amount") == null) {
			paymentInfo.put("pa_amount", 0);
		}
		mv.addObject("paymentInfo", paymentInfo);
		
		
		Map<String, Object> paymentErrorInfo = new HashMap<>();
		List<String> errorMsg = new ArrayList<>();
		
		if(jsonDTO.get("errorMsg") != null) {
			mv.addObject("result", "error");
			errorMsg.add(jsonDTO.get("errorMsg").toString());
			mv.addObject("errorMsg", errorMsg);
			paymentErrorInfo.put("l_ip", util.getUserIp(request));
			paymentErrorInfo.put("l_target", "Checkout");
			paymentErrorInfo.put("l_data", "[결제 #"+jsonDTO.get("pa_id")+" 오류]" + jsonDTO.get("errorMsg"));
			paymentErrorInfo.put("l_id", id);
			logService.writeLog(paymentErrorInfo);
		}
		
		//payment 테이블 다녀오기
		try {
			orderService.inputToPayment(paymentInfo);
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("result", "error");
			errorMsg.add("결제는 진행되었으나 결제 정보 데이터 생성에 실패했습니다.");
			mv.addObject("errorMsg", errorMsg);
			//결제 데이터 생성 중 에러 발생하면 관리자도 알 수 있게 로그 등록
			//결제 진행중에 발생한 오류는 아임포트에서 확인 가능하지만, 결제 데이터 생성 중에 발생한 오류는 여기서 처리해야 한다.
			paymentErrorInfo.put("l_ip", util.getUserIp(request));
			paymentErrorInfo.put("l_target", "Checkout");
			paymentErrorInfo.put("l_data", "[결제 #"+jsonDTO.get("pa_id")+" 오류] payment 테이블에 결제 정보 생성 실패");
			paymentErrorInfo.put("l_id", id);
			logService.writeLog(paymentErrorInfo); 
		}
		
		//order_list 테이블 다녀오기 + 물건 재고 감소시키기
		Map<String, Object> orderedProduct = new HashMap<>();
		JsonParser jsonParser = new JsonParser();
		JsonArray jsonArray = (JsonArray) jsonParser.parse(jsonDTO.get("productList").toString());
		String[] strArr = new String[2];
		int p_no = 0;
		int cnt = 0;
		for (int i = 0; i < jsonArray.size(); i++) {
			strArr = jsonArray.get(i).getAsString().split("\\$");
			p_no = Integer.parseInt(strArr[0]);
			cnt = Integer.parseInt(strArr[1]);
			orderedProduct.put("p_no", p_no);
			orderedProduct.put("cnt", cnt);
			orderedProduct.put("m_id", id);
			orderedProduct.put("pa_id", jsonDTO.get("pa_id"));
			//재고 체크 문제 없으므로(이미 통과) 재고 내리기
			try {
				orderService.downStock(orderedProduct);
			} catch (Exception e) {
				e.printStackTrace();
				mv.addObject("result", "error");
				errorMsg.add("결제는 진행되었으나 결제 상품 데이터 반영에 실패했습니다.");
				mv.addObject("errorMsg", errorMsg);
				paymentErrorInfo.put("l_ip", util.getUserIp(request));
				paymentErrorInfo.put("l_target", "Checkout");
				paymentErrorInfo.put("l_data", "[결제 #"+jsonDTO.get("pa_id")+" 오류] 상품 재고 반영 실패");
				paymentErrorInfo.put("l_id", id);
				logService.writeLog(paymentErrorInfo);
			}
			//주문서 생성
			try {
				orderService.inputToOrder_List(orderedProduct);
			} catch (Exception e) {
				e.printStackTrace();
				mv.addObject("result", "error");
				errorMsg.add("결제는 진행되었으나 주문서 생성중에 문제가 발생했습니다.");
				mv.addObject("errorMsg", errorMsg);
				paymentErrorInfo.put("l_ip", util.getUserIp(request));
				paymentErrorInfo.put("l_target", "Checkout");
				paymentErrorInfo.put("l_data", "[결제 #"+jsonDTO.get("pa_id")+" 오류] order_list 테이블에 주문서 생성 실패");
				paymentErrorInfo.put("l_id", id);
				logService.writeLog(paymentErrorInfo);
			}
			
			//장바구니에서 구매한 상품 삭제
			try {
					orderService.deleteFromCart(orderedProduct);
			} catch (Exception e) {
					e.printStackTrace();
					mv.addObject("result", "error");
					errorMsg.add("결제는 진행되었으나 주문 데이터 반영에 문제가 발생했습니다.");
					mv.addObject("errorMsg", errorMsg);
					paymentErrorInfo.put("l_ip", util.getUserIp(request));
					paymentErrorInfo.put("l_target", "Checkout");
					paymentErrorInfo.put("l_data", "[결제 #"+jsonDTO.get("pa_id")+" 오류] 장바구니에서 구매한 물품 삭제 실패");
					paymentErrorInfo.put("l_id", id);
					logService.writeLog(paymentErrorInfo); 
			}
		}
		
		//적립금 차감 및 적립하기
		try {
			orderService.calcPoint(paymentInfo);
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("result", "error");
			errorMsg.add("결제와 주문서 작성은 진행되었으나 결제 데이터 반영에 실패했습니다.");
			mv.addObject("errorMsg", errorMsg);
			paymentErrorInfo.put("l_ip", util.getUserIp(request));
			paymentErrorInfo.put("l_target", "Checkout");
			paymentErrorInfo.put("l_data", "[결제 #"+jsonDTO.get("pa_id")+" 오류] 적립금 차감 및 적립 실패");
			paymentErrorInfo.put("l_id", id);
			logService.writeLog(paymentErrorInfo); 
		}
				
		//적립금 로그 쓰기
		Map<String, Object> pointInfo = new HashMap<>();
		pointInfo.put("m_id", id);
		pointInfo.put("pa_id", jsonDTO.get("pa_id"));
		pointInfo.put("po_vary", "+");
		pointInfo.put("po_value", jsonDTO.get("finalWillPoint"));
		
		try {
			mypageService.inputPointLog(pointInfo);
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("result", "error");
			errorMsg.add("결제와 주문서 작성은 진행되었으나 결제 데이터 반영에 실패했습니다.");
			mv.addObject("errorMsg", errorMsg);
			paymentErrorInfo.put("l_ip", util.getUserIp(request));
			paymentErrorInfo.put("l_target", "Checkout");
			paymentErrorInfo.put("l_data", "[결제 #"+jsonDTO.get("pa_id")+" 오류] pointLog 테이블에 적립금 로그 생성 실패");
			paymentErrorInfo.put("l_id", id);
			logService.writeLog(paymentErrorInfo);
		}
		
		if( Integer.parseInt(jsonDTO.get("usePoint").toString()) != 0 ) {
			try {
				pointInfo.put("po_vary", "-");
				pointInfo.put("po_value", jsonDTO.get("usePoint"));
				mypageService.inputPointLog(pointInfo);
			} catch (Exception e) {
					e.printStackTrace();
					mv.addObject("result", "error");
					errorMsg.add("결제와 주문서 작성은 진행되었으나 결제 데이터 반영에 실패했습니다.");
					mv.addObject("errorMsg", errorMsg);
					paymentErrorInfo.put("l_ip", util.getUserIp(request));
					paymentErrorInfo.put("l_target", "Checkout");
					paymentErrorInfo.put("l_data", "[결제 #"+jsonDTO.get("pa_id")+" 오류] pointLog 테이블에 적립금 로그 생성 실패");
					paymentErrorInfo.put("l_id", id);
					logService.writeLog(paymentErrorInfo);
			}
		}
		
		if(errorMsg.size() == 0) mv.addObject("result", "success");
		
		
		return mv;
	}
	
	
}
	