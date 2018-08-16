package com.kh.follow;

import java.util.Map;

import com.kh.follow.FollowModel;


public interface FollowService {

	
	//개인의 상세정보 불러오기
		MemberModel selectIdMember(int MEMBER_NUMBER) throws Exception;

		int followExist(int follow_id, int following_id) throws Exception;
		
		void followReg(FollowModel followModel) throws Exception;

		void followDel(FollowModel followModel) throws Exception;
}
