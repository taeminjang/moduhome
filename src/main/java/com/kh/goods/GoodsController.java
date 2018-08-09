package com.kh.goods;

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

		
		return mv;
		
	}
	
	@RequestMapping(value = "/goods/category")
	public ModelAndView goodsCategory(HttpServletResponse response, HttpServletRequest request, CommandMap Map) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("goodsCategory");

		
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
