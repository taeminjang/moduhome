package com.kh.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import com.kh.util.FileUtils;
import com.kh.join.JoinDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	 
	  @Resource(name="joinDAO")
	  private JoinDAO joinDAO;
	
	 @Resource(name="fileUtils")
	 private FileUtils fileUtils;
	
	@Resource(name="memberDao")
	private MemberDao memberDao;

	@Override
	public Map<String, Object> memberInfo(String member_number) throws Exception {
		
	          return memberDao.memberInfo(member_number);
	}

	@Override
	public void ModifyMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		memberDao.ModifyMember(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
        for(int i=0, size=list.size(); i<size; i++){
            joinDAO.updateFile(list.get(i));
	     }
	}
}

