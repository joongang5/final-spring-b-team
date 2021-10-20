package com.B.serivce;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.B.dao.NoticeDAO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public void noticeWrite(Map<String, Object> map) {
		noticeDAO.noticeWrite(map);
	}

	@Override
	public void noticeDelete(Map<String, Object> map) {
		noticeDAO.noticeDelete(map);
	}

	@Override
	public void noticeUpdate(Map<String, Object> map) {
		noticeDAO.noticeUpdate(map);
	}

	@Override
	public Map<String, Object> noticeDetail(Map<String, Object> map) {
		return noticeDAO.noticeDetail(map);
	}

	@Override
	public List<Map<String, Object>> noticeList_important(Map<String, Object> map) {
		return noticeDAO.noticeList_important(map);
	}

	@Override
	public List<Map<String, Object>> noticeList_normal(Map<String, Object> map) {
		return noticeDAO.noticeList_normal(map);
	}

	@Override
	public int noticeList_normal_Total(Map<String, Object> map) {
		return noticeDAO.noticeList_normal_Total(map);
	}

}
