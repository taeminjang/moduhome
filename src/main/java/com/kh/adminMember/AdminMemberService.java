package com.kh.adminMember;

import java.util.List;
import java.util.Map;

import com.kh.moduhome.CommandMap;

public interface AdminMemberService {

	public List<Map<String, Object>> adminMemberList(Map<String, Object> map) throws Exception;
}
