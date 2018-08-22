package com.kh.sns;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.moduhome.GoodsImageUtils;

@Service("snsService")
public class SnsServiceImpl implements SnsService {

	@Resource(name = "snsDAO")
	private SnsDAO snsDAO;
	
	@Resource(name = "goodsImageUtils")
	private GoodsImageUtils goodsImageUtils;
	
	
	// 스토리 등록
	@Override
	public void snsInsert(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		  snsDAO.snsInsert(map);

	      map = goodsImageUtils.snsMainImage(map, request);
	      snsDAO.snsMainImage(map);
			
	}
	
	// 스토리 리스트
	@Override
	public List<Map<String, Object>> snsList(Map<String, Object> map) throws Exception {
		
		return snsDAO.snsList(map);
	}
    
    //스토리 숨기기
	@Override
	public void snsHide(String sns_num) throws Exception {
		  snsDAO.snsHide(sns_num);
		
	}
	

}