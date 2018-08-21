package com.kh.police;

import java.util.Map;

import org.springframework.stereotype.Repository;
import com.kh.moduhome.AbstractDAO;

@Repository("policeDao")
public class PoliceDao extends AbstractDAO{
	
	public void policeReg(Map<String, Object> map)throws Exception{
		insert("police.policeReg",map);
	}
}
