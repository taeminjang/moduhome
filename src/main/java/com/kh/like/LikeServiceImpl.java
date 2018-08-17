package com.kh.like;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


@Service("likeService")
public class LikeServiceImpl implements LikeService {
        
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "likeDao")
	private LikeDao likeDao;
	
	@Override
	public void likeSNSReg(Map<String, Object> map) throws Exception{
		likeDao.likeSNSReg(map); 
	}
}
