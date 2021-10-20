package com.B.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("noticeDAO")

public class NoticeDAO extends AbstractDAO {

	public List<Map<String, Object>> noticeList_important(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("notice.noticeList_important", map);
	}
	
	public List<Map<String, Object>> noticeList_normal(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("notice.noticeList_normal", map);
	}

	public void noticeWrite(Map<String, Object> map) {
		insertNotice("notice.noticeWrite", map);
	}

	public void noticeDelete(Map<String, Object> map) {
		delete("notice.noticeDelete", map);
	}

	public void noticeUpdate(Map<String, Object> map) {
		update("notice.noticeUpdate", map);
	}

	public Map<String, Object> noticeDetail(Map<String, Object> map) {
		return selectOne("notice.noticeDetail", map);
	}

}
