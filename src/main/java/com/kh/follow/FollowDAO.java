package com.kh.follow;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.moduhome.AbstractDAO;

@Repository("followDAO")
public class FollowDAO extends AbstractDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//개인에 대한 상세정보 -> 마이페이지로 이동예정
	public MemberModel selectIdMember(int MEMBER_NUMBER) {
		return (MemberModel) selectOne("follow.selectIdMember", MEMBER_NUMBER);
	}
	
	public int followExist(int follow, int following) {
		// TODO Auto-generated method stub
		Map param = new HashMap();
		param.put("follow", follow);
		param.put("following", following);
		
		return (Integer) selectOne("follow.followExist", param);
	}

	public void followReg(FollowModel followModel){
		insert("follow.followReg", followModel);
	}

	public void followDel(FollowModel followModel){
		delete("follow.followDel", followModel);
	}
	
}
