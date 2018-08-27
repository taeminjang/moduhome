package com.kh.member;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
     
	@Resource(name="memberDao")
	private MemberDao memberDao;

	@Override
	public Map<String, Object> memberInfo(String member_number) throws Exception {
		
	          return memberDao.memberInfo(member_number);
	}

	@Override
	public void updateMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		
	}
	
	
}
