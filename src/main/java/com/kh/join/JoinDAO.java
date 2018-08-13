package com.kh.join;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.moduhome.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO {
	
	//회원가입
	public void insertMember(Map<String, Object> map)throws Exception{
		insert("member.insertMember",map);
	}
	
	//아이디체크
	public int checkId(String mem_id)throws Exception{
		return (int)selectOne("member.checkId",mem_id);
	}
	

}
