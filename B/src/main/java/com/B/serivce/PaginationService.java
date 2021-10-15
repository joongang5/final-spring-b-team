package com.B.serivce;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.B.util.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Service("paginationService")
public class PaginationService { //페이징 서비스

	
	PaginationInfo paginationInfo = new PaginationInfo();
	
	int pageNo = 1; 
	int listScale = 10; 
	int pageScale = 10; 
		
	public PaginationInfo initialSetting(HttpServletRequest req) {
		if (req.getParameter("pageNo") != null) {
			pageNo = Util.str2Int2(req.getParameter("pageNo"));
		}
		
		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(listScale);
		paginationInfo.setPageSize(pageScale);				

		return paginationInfo; // 페이지 정보 담아서 보내기
		
	}
	

	
	public int getPageNo(HttpServletRequest req) {
		
		if (req.getParameter("pageNo") != null) {
			pageNo = Util.str2Int2(req.getParameter("pageNo"));
		}
		
		return pageNo;
	}
	
}
