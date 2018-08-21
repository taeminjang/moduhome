/*package com.kh.magazine;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import kh.command.AbstractDAO;

@Repository("magazineDAO")
public class MagazineDAO extends AbstractDAO {
	
	

	//매거진 내용 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> mgContentList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("magazine_con.MGCONTENTLIST", map);
	}
	
	//최근 매거진 추출
	@SuppressWarnings("unchecked")
	public Map<String, Object> mgNew(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("magazine.MGNEW", map);
	}
	
	
	// 매거진 내용 등록
	public void mgContentInsert(Map<String, Object> map) throws Exception {
		insert("magazine_con.MGCONTENTINSERT", map);
	}
	

	// 매거진 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> mgList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("magazine.MGLIST", map);
	}
	
	
	// 매거진 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> mgDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("magazine.MGDETAIL", map);
	}
		
	// 조회수 증가
	public void updateHitCnt(Map<String, Object> map) throws Exception {
		update("magazine.UPDATEHITCNT", map);
	}
	
	// 매거진 타이틀 등록
	public void mgInsert(Map<String, Object> map) throws Exception {
		insert("magazine.MGINSERT", map);
	}
	
	
	//매거진 메인이미지 등록
	public void mgInsertImage(Map<String, Object> map) throws Exception {
	   update("magazine.MGINSERTIMAGE", map);
	}
	

	
}*/