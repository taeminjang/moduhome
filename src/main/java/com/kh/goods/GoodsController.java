package com.kh.goods;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.moduhome.CommandMap;

import com.kh.paging.GoodsPaging;
import com.thoughtworks.xstream.io.path.Path;


@Controller
public class GoodsController {

	@Resource(name="goodsService")
	private GoodsService goodsService;
	
	
	 public static final int pagingSet = 5;
	 private int currentPage = 1;
	 private int totalCount;
	 private int blockCount = 16;
	 private int blockPage = 10;
	 private String pagingHtml;
	 private GoodsPaging page;
	
	
	@RequestMapping(value = "/goods")
	public ModelAndView goodsMain(HttpServletResponse response, HttpServletRequest request, CommandMap Map) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("check:"+request.getSession().getServletContext().getRealPath("/"));
		System.out.println("user:"+System.getProperty("user.name"));
		mv.setViewName("goodsMain");
		//신상품, 인기상품 정렬
		List<Map<String, Object>> sellBestItem = goodsService.bestSellAll(Map.getMap());
		List<Map<String, Object>> newItem = goodsService.newItemAll(Map.getMap());
		
		//DB에서 넘어오는 값 확인
		Object test = (String)sellBestItem.get(0).get("GOODS_NAME");
		
		
		mv.addObject("sellBestItem", sellBestItem);
		mv.addObject("newItem", newItem);
		return mv;
		
	}
	
	@RequestMapping(value = "/goods/category")
	public ModelAndView goodsCategory(HttpServletResponse response, HttpServletRequest request, CommandMap Map) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("goodsCategory");
		
		String categoryName = (String) Map.getMap().get("CATEGORY");
		System.out.println("categoryName:"+categoryName);
		
		
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

		 //페이징
	      if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
	            || request.getParameter("currentPage").equals("0")) {
	         currentPage = 1;
	      } else {
	         currentPage = Integer.parseInt(request.getParameter("currentPage"));
	         System.out.println("CurrentPage :" + currentPage);
	      }
	      System.out.println("CurrentPage :" + currentPage);

	      totalCount = goodsCategoryList.size();

	      //page = new GoodsPaging(currentPage, totalCount, blockCount, blockPage, sort);
	      page = new GoodsPaging(currentPage, totalCount, blockCount, blockPage);
	      pagingHtml = page.getPagingHtml().toString();

	      int lastCount = totalCount;

	      if (page.getEndCount() < totalCount)
	         lastCount = page.getEndCount() + 1;

	      goodsCategoryList = goodsCategoryList.subList(page.getStartCount(), lastCount);

		
	    mv.addObject("totalCount", totalCount);
	    mv.addObject("pagingHtml", pagingHtml);
	     
		mv.addObject("categoryName", categoryName);
		mv.addObject("goodsCategory", goodsCategory);
		mv.addObject("goodsCategoryList", goodsCategoryList);
		
		return mv;
		
	}
	
	@RequestMapping(value = "/goods/detail")
	public ModelAndView goodsDetail(HttpServletResponse response, HttpServletRequest request, CommandMap Map, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("goodsDetail");
		int checkBuy;
		
		goodsService.goodsCountUp(Map.getMap());
		
		List<Map<String, Object>> goodsDetail = goodsService.selectOneGood(Map.getMap());
	    List<Map<String, Object>> goodsImage = goodsService.selectImage(Map.getMap());
	    Map<String, Object> goodsBasic = goodsDetail.get(0);
		
	    if (session.getAttribute("MEMBER_NUMBER") != null) {
	         String mem_num = session.getAttribute("MEMBER_NUMBER").toString();
	         Map.put("MEMBER_NUMBER", mem_num);
	         
	         try { 

	            checkBuy = goodsService.checkBuy(Map.getMap());
	            mv.addObject("checkBuy", checkBuy);
	            
	         } catch (Exception e) { 
	            checkBuy = 0;
	            mv.addObject("checkBuy", checkBuy);
	         }
	         System.out.println("checkBuy"+checkBuy);
	         
	      }

		 mv.addObject("goodsDetail", goodsDetail);
		 mv.addObject("goodsBasic", goodsBasic);
		 mv.addObject("goodsImage", goodsImage);
		 System.out.println("goodsImage"+ goodsImage);
		 
		//리뷰점수
		//qna 글
		//페이징
		//추천상품
		
		return mv;
		
	}
	
	
	@RequestMapping(value = "/goods/search", produces = "application/json; charset=utf8")
	public ModelAndView goodsSearch(HttpServletResponse response, HttpServletRequest request, CommandMap Map) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("goodsSearch");

		List<Map<String, Object>> goodsSearchList = goodsService.goodsSearchList(Map.getMap());
	    String searchKeyWord = (String) Map.getMap().get("isSearch");

	     //페이징
	      if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
	            || request.getParameter("currentPage").equals("0")) {
	         currentPage = 1;
	      } else {
	         currentPage = Integer.parseInt(request.getParameter("currentPage"));
	         System.out.println("CurrentPage :" + currentPage);
	      }
	      System.out.println("CurrentPage :" + currentPage);

	      totalCount = goodsSearchList.size();

	      page = new GoodsPaging(currentPage, totalCount, blockCount, blockPage);
	      pagingHtml = page.getPagingHtml().toString();

	      int lastCount = totalCount;

	      if (page.getEndCount() < totalCount)
	         lastCount = page.getEndCount() + 1;

	      goodsSearchList = goodsSearchList.subList(page.getStartCount(), lastCount);
		
	      
	      mv.addObject("goodsSearchList", goodsSearchList);
	      mv.addObject("searchKeyWord", searchKeyWord);
	      mv.addObject("totalCount", totalCount);
	      mv.addObject("pagingHtml", pagingHtml);
	      mv.addObject("currentPage", currentPage);
	      
		return mv;
		
	}
}
