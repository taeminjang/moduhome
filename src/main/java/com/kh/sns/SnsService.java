package com.kh.sns;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface SnsService {


	// 스토리 리스트
	public List<Map<String, Object>> snsList(Map<String, Object> map) throws Exception;
	
	// 스토리 등록
	public void snsInsert(Map<String, Object> map, HttpServletRequest request) throws Exception;
	

	
	
}
