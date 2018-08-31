package com.kh.qna;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.*;

public interface QnaService {
	
	void insertModalQna(Map<String, Object> map, HttpServletRequest request) throws Exception;

	// qna 삭제(Admin Page)
		void qnaDelete(Map<String, Object> map) throws Exception;
}
