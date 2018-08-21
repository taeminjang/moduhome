/*package com.kh.magazineComment;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.command.GoodsImageUtils;



@Service("magazinecmService")
public class MagazineCMServiceImpl implements MagazineCMService {

	private static final String filePath = "C:\\maven\\MODA\\src\\main\\webapp\\file\\reviewFile\\";
	@Resource(name = "magazinecmDAO")
	private MagazineCMDAO magazinecmDAO;
	
	@Resource(name = "goodsImageUtils")
	private GoodsImageUtils goodsImageUtils;
	
	// 댓글 리스트
	@Override
	public List<Map<String, Object>> magazineCmList(Map<String, Object> map) throws Exception {
		return magazinecmDAO.magazineCmList(map);
	}


	@Override
	public void magazineCmWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
		System.out.println("셀렉키삽입전" + map.get("MG_NUMBER"));
		magazinecmDAO.magazineCmWrite(map);
		System.out.println("셀렉키삽입후" + map.get("MG_NUMBER"));

	}

	

	


}
*/