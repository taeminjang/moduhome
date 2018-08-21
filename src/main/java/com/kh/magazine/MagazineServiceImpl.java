/*package com.kh.magazine;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.command.GoodsImageUtils;

@Service("magazineService")
public class MagazineServiceImpl implements MagazineService {

	@Resource(name = "magazineDAO")
	private MagazineDAO magazineDAO;
	
	@Resource(name = "goodsImageUtils")
	private GoodsImageUtils goodsImageUtils;
	
	// 매거진 타이틀 등록
	@Override
	public void mgInsert(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		  magazineDAO.mgInsert(map);

	      map = goodsImageUtils.goodsMagazine(map, request);
	      magazineDAO.mgInsertImage(map);
			
	}

	//매거진 내용 등록
	@Override
	public void mgContentInsert(Map<String, Object> map, HttpServletRequest request) throws Exception {
		System.out.println("셀렉키삽입전" + map.get("MG_NUMBER"));
		   map = goodsImageUtils.mgContentInsert(map, request);
		      magazineDAO.mgContentInsert(map);
		System.out.println("셀렉키삽입후" + map.get("MG_NUMBER"));
		


	}
	
	//매거진 내용 리스트
	@Override
	public List<Map<String, Object>> mgContentList(Map<String, Object> map) throws Exception {
		
		return magazineDAO.mgContentList(map);
	}
	
	//최근 매거진 추출
	@Override
	public Map<String, Object> mgNew(Map<String, Object> map) throws Exception {
		Map<String, Object> mgNew = magazineDAO.mgNew(map);
		return mgNew;
	}
	
	// 매거진 리스트
	@Override
	public List<Map<String, Object>> mgList(Map<String, Object> map) throws Exception {
		
		return magazineDAO.mgList(map);
	}
	
	// 매거진 상세보기
	@Override
	public Map<String, Object> mgDetail(Map<String, Object> map) throws Exception {
		magazineDAO.updateHitCnt(map);
		Map<String, Object> mgDetail = magazineDAO.mgDetail(map);
		return mgDetail;
	}
	


}*/