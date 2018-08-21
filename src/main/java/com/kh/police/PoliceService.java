package com.kh.police;

import java.util.List;
import java.util.Map;

public interface PoliceService {

	void policeReg(Map<String, Object> map)throws Exception;

	List<Map<String, Object>> policelist() throws Exception;

}
