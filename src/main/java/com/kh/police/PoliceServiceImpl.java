package com.kh.police;

import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;


@Service("policeService")
public class PoliceServiceImpl implements PoliceService {
         
	@Resource(name = "policeDao")
	private  PoliceDao policeDao;
	
	@Override
	public void policeReg(Map<String,Object> map) throws Exception{
		policeDao.policeReg(map); 
	}
}