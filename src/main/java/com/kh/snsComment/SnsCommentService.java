package com.kh.snsComment;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface SnsCommentService {

	// 스토리 댓글 리스트
	List<Map<String, Object>> snsCommentList(Map<String, Object> map) throws Exception;

	// 스토리 댓글 등록
	public void snsCommentInsert(Map<String, Object> map, HttpServletRequest request) throws Exception;



}
