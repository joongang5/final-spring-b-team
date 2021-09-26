package com.B.serivce;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.B.VO.KakaoPayApprovalVO;
import com.B.VO.KakaoPayReadyVO;

import lombok.extern.java.Log;

@Service
@Log
public class KakaoPayService {
	private KakaoPayReadyVO readyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	
    final String HOST_AUTH = "https://kapi.kakao.com";
    
    public String Ready() {
    	RestTemplate restTemplate = new RestTemplate();
    	
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization","KakaoAK " +"50ebda6da5249abad392c1d55f9c36f3");
    	headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
    	headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
    	
    	MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", "1001");
		params.add("partner_user_id", "hyuna");
		params.add("item_name", "갤럭시z플립");
		params.add("quantity", "1");
		params.add("total_amount", "21000");
		params.add("tax_free_amount", "100");
		params.add("approval_url", "http://localhost:8080/web/kakaoPaySuccess.do");
		params.add("cancel_url", "http://localhost:8080/kakaoPayCancel");
		params.add("fail_url", "http://localhost:8080/kakaoPaySuccessFail");
    	HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String,String>>(params,headers);
    	
    	
    	try {
			readyVO = restTemplate.postForObject(new URI(HOST_AUTH + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
			System.out.println(readyVO.toString());
	    	return readyVO.getNext_redirect_pc_url();
    	} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return "kakaoPay.do";
    }
    
//    public String ready2() throws Exception {
//    	return KakaoAPI.readyAPI();
//    }
    
    //카카오 결재 승인 받아온 토큰 적용
	public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {

		log.info("KakaoPayInfoVO............................................");
		log.info("-----------------------------");

		RestTemplate restTemplate = new RestTemplate();

		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization","KakaoAK " +"50ebda6da5249abad392c1d55f9c36f3");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		// 서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME"); //테스트 코드
		params.add("tid", readyVO.getTid());
		params.add("partner_order_id", "1001");
		params.add("partner_user_id", "hyuna");
		params.add("pg_token", pg_token);
		params.add("total_amount", "21000");

		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		try {
			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST_AUTH + "/v1/payment/approve"), body,
					KakaoPayApprovalVO.class);
			log.info("" + kakaoPayApprovalVO);

			return kakaoPayApprovalVO;

		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
    
    
}