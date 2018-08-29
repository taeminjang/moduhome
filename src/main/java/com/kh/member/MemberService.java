package com.kh.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MemberService {
    
	//회원정보 꺼내오기
	Map<String, Object> memberInfo(String member_number)throws Exception;
	
	//회원정보 변경
	void ModifyMember(Map<String, Object> memberMap, HttpServletRequest request)throws Exception;
	
	      
}
