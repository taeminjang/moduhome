package com.kh.sns;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import com.kh.moduhome.AbstractDAO;

@Repository("snsDAO")
public class SnsDAO extends AbstractDAO {
	
	
	//스토리 메인 이미지 등록
	public void snsMainImage(Map<String, Object> map) throws Exception {
	   update("snsboard.SNSMAINIMAGE", map);
	}

	// 스토리 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> snsList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("snsboard.SNSLIST", map);
	}

	
	// 스토리 등록
	public void snsInsert(Map<String, Object> map) throws Exception {
		insert("snsboard.SNSINSERT", map);
	}
    
	//스토리 숨기기
	public void snsHide(String sns_num)throws Exception {
	    update("snsboard.SNSHIDE", sns_num);
	}
	
		
	
}