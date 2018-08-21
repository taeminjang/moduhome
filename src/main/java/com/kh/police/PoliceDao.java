package com.kh.police;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.kh.moduhome.AbstractDAO;

@Repository("policeDao")
public class PoliceDao extends AbstractDAO{
	
	public void policeReg(Map<String, Object> map)throws Exception{
		insert("police.policeReg",map);
	}
    
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> policeList() {
		return (List<Map<String, Object>>) selectList("police.policeList");
	}
}
