/*package com.kh.magazineComment;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import kh.command.AbstractDAO;

@Repository("magazinecmDAO")
public class MagazineCMDAO extends AbstractDAO {
	
	
	// 댓글리스트
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> magazineCmList(Map<String, Object> map) throws Exception {
			return (List<Map<String, Object>>) selectList("magazine_cm.MGCOMMENTLIST", map);
		}


	// 리뷰 등록
	public void magazineCmWrite(Map<String, Object> map) throws Exception {
		insert("magazine_cm.INSERTMGCOMMENT", map);
	}



	// 전체 리스트(Admin Page)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("snsboard_cm.SNSCOMMENTLIST", map);
	}

}


*/