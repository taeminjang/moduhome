package com.kh.goods;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.moduhome.CommandMap;


@Controller
public class GoodsController {

	@Resource(name="goodsService")
	private GoodsService goodsService;
	
	
	@RequestMapping(value = "/goods")
	public ModelAndView goodsMain(HttpServletResponse response, HttpServletRequest request, CommandMap Map) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("goodsMain");
		//신상품, 인기상품 정렬
		List<Map<String, Object>> sellBestItem = goodsService.bestSellAll(Map.getMap());
		
		//DB에서 넘어오는 값 확인
		Object test = (String)sellBestItem.get(0).get("GOODS_NAME");
		System.out.println("test:"+test);
		System.out.println("test:"+test instanceof String);
		
		mv.addObject("sellBestItem", sellBestItem);
		return mv;
		
	}
	
	@RequestMapping(value = "/goods/category")
	public ModelAndView goodsCategory(HttpServletResponse response, HttpServletRequest request, CommandMap Map) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("goodsCategory");
		
		String categoryName = (String) Map.getMap().get("CATEGORY");
		System.out.println("categoryName:"+categoryName);
		
		//http://localhost:8080/ModuHome/goods/category?CATEGORY=%EA%B0%80%EA%B5%AC&SUBCATEGORY=침실
		
		List<String> goodsCategory = new ArrayList<>();
		
		
		 if (categoryName.equals("가구")) {
	         goodsCategory.add("침실");
	         goodsCategory.add("주방");
	         goodsCategory.add("거실");
		 }
		 
		 
		 
		 if(Map.getMap().get("SUBCATEGORY")!=null) {
			 if (!((String) Map.getMap().get("SUBCATEGORY")).equals("")) {
			 
			 }
		 }
		 
		 
		List<Map<String, Object>> goodsCategoryList = goodsService.newItemCategory(categoryName);

		mv.addObject("categoryName", categoryName);
		mv.addObject("goodsCategory", goodsCategory);
		mv.addObject("goodsCategoryList", goodsCategoryList);
		
		return mv;
		
	}
	
	@RequestMapping(value = "/goods/detail")
	public ModelAndView goodsDetail(HttpServletResponse response, HttpServletRequest request, CommandMap Map) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("goodsDetail");

		
		return mv;
		
	}
	
	
	@RequestMapping(value = "/goods/search")
	public ModelAndView goodsSearch(HttpServletResponse response, HttpServletRequest request, CommandMap Map) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("");

		
		return mv;
		
	}
}
