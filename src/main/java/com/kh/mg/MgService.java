package com.kh.mg;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MgService {
	
	// 매거진 타이틀 등록
	public void mgTitleInsert(Map<String, Object> map, HttpServletRequest request) throws Exception;
		
	// 매거진 내용 등록
	public void mgContentInsert(Map<String, Object> map, HttpServletRequest request) throws Exception;
		
	// 매거진 내용 리스트
	public List<Map<String, Object>> mgContentList(Map<String, Object> map) throws Exception;
	
	//최근 매거진 추출
	public Map<String, Object> mgNew(Map<String, Object> map) throws Exception;
	
	// 매거진 리스트
	public List<Map<String, Object>> mgList(Map<String, Object> map) throws Exception;
	
	// 매거진 상세보기 상세보기
	public Map<String, Object> mgDetail(Map<String, Object> map) throws Exception;

	//내가 보관한 매거진의 리스트
	public List<Map<String, Object>> mgMycollectList(int MEMBER_NUMBER) throws Exception;
	

	
}
