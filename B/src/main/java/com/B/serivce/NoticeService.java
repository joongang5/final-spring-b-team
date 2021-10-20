package com.B.serivce;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	public List<Map<String, Object>> noticeList_important(Map<String, Object> map);
	
	public List<Map<String, Object>> noticeList_normal(Map<String, Object> map);
	
	public Map<String, Object> noticeDetail(Map<String, Object> map);
	
	public void noticeWrite(Map<String, Object> map);
	
	public void noticeDelete(Map<String, Object> map);
	
	public void noticeUpdate(Map<String, Object> map);  
	
	
}
