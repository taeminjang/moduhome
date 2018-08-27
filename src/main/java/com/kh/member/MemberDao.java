package com.kh.member;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.moduhome.AbstractDAO;

@Repository("memberDao")
public class MemberDao extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	Map<String, Object> memberInfo(String member_number)throws Exception {
		
		 return (Map<String,Object>)selectOne("member.memberInfo", member_number);
	}

}
