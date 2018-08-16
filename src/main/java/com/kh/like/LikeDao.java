package com.kh.like;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.kh.moduhome.AbstractDAO;

@Repository("likeDao")
public class LikeDao extends AbstractDAO{
        
	public void likeSNSReg(Map<String, Object> map) {
		insert("like.likeReg",map);
	}
}
