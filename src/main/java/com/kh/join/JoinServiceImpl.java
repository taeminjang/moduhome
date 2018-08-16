package com.kh.join;

import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service("joinService")
public class JoinServiceImpl implements JoinService {
       
	  @Resource(name="joinDAO")
	  private JoinDAO joinDAO;
	  
	  @Override
		public void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
			joinDAO.insertMember(map);   
		}
	  
	  @Override
		public int checkMember(Map<String, Object> map) throws Exception {
			return joinDAO.checkMember(map);
			
		}
	  
	  
	  @Override
	  public int checkId(String mem_id)throws Exception{
		  return joinDAO.checkId(mem_id);
	  }
}
