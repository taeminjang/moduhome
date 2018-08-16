package com.kh.follow;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("followService")
public class FollowServiceImpl implements FollowService{

	@Resource(name = "followDAO")
	private FollowDAO followDAO;
	

	@Override
	public MemberModel selectIdMember(int MEMBER_NUMBER) throws Exception {
		// TODO Auto-generated method stub
		return followDAO.selectIdMember(MEMBER_NUMBER);
	}

	@Override
	public int followExist(int follow_id, int following_id) throws Exception{
		// TODO Auto-generated method stub
		return followDAO.followExist(follow_id, following_id);
		
	}

	@Override
	public void followReg(FollowModel followModel) throws Exception {
		// TODO Auto-generated method stub
		followDAO.followReg(followModel);
	}

	@Override
	public void followDel(FollowModel followModel) throws Exception {
		// TODO Auto-generated method stub
		followDAO.followDel(followModel);
	}

	

}
