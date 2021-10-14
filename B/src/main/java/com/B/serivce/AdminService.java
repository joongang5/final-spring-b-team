package com.B.serivce;

import java.util.List;
import java.util.Map;

public interface AdminService {

	public List<Map<String, Object>> memberList(Map<String, Object> map);

	public int memberTotalList(Map<String, Object> map);

	public void memberDelete(Map<String, Object> map);

}
