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
		// 리뷰 평점 가져오기
	      mv.addObject("avgGrade", goodsService.reviewScore(Map.getMap()));

	      // 상품qna 가져오기
	      List<Map<String, Object>> goodsQna = goodsService.selectQNA(Map.getMap());

	      System.out.println("goodsQna.size() =" + goodsQna.size());
	      mv.addObject("goodsQna", goodsQna);

	      int qnaEndPagingNum = pagingSet; // 5
	      int qnaStartPagingNum = 0;
	      int qnaNowPage = 1;

	      String pagingQnaOnOff = (String) Map.getMap().get("pagingQnaOnOff");
	      System.out.println("pagingQnaOnOff: " + (String) Map.getMap().get("pagingQnaOnOff"));
	      if (pagingQnaOnOff != null) {
	         String i = (String) Map.getMap().get("i");
	         // System.out.println("i값 :" + i);
	         qnaEndPagingNum = Integer.parseInt((String) Map.getMap().get("qnaEndPagingNum"));
	         // System.out.println("qnaEndPagingNum :" + qnaEndPagingNum);
	         qnaStartPagingNum = Integer.parseInt((String) Map.getMap().get("qnaStartPagingNum"));
	         // System.out.println("qnaStartPagingNum :" + qnaStartPagingNum);
	         qnaNowPage = Integer.parseInt((String) Map.getMap().get("qnaNowPage"));
	         // System.out.println("qnaNowPage : " + qnaNowPage);
	         if (i.equals("1"))// prev 클릭
	         {
	            if (qnaEndPagingNum == pagingSet) {
	               System.out.println("첫페이지");
	            } else {
	               qnaStartPagingNum = qnaStartPagingNum - pagingSet;
	               qnaEndPagingNum = qnaEndPagingNum - pagingSet;
	               qnaNowPage = qnaNowPage - 1;
	               System.out.println("전페이지이동");
	            }
	         } else if (i.equals("2")) // next 클릭
	         {
	            if (qnaEndPagingNum < goodsQna.size()) {
	               qnaStartPagingNum = qnaStartPagingNum + pagingSet;
	               qnaEndPagingNum = qnaEndPagingNum + pagingSet;
	               qnaNowPage = qnaNowPage + 1;
	               System.out.println("다음페이지이동");
	            } else {
	               System.out.println("마지막페이지");
	            }

	         }
	         System.out.println("qnaEndPagingNum 연산결과  :" + qnaEndPagingNum);
	         mv.setViewName("goods/qna/goodsDetail_Qna");
	      }

	      int totalPage = (int) Math.ceil((double) goodsQna.size() / pagingSet);
	      System.out.println("총 페이지 갯수 :" + totalPage);
	      mv.addObject("qnaEndPagingNum", qnaEndPagingNum);
	      mv.addObject("qnaStartPagingNum", qnaStartPagingNum);
	      mv.addObject("qnaNowPage", qnaNowPage);
	      mv.addObject("qnaSize", goodsQna.size());
	      mv.addObject("qnaTotalPage", totalPage);

	      // 상품 Review 가져오기
	      List<Map<String, Object>> goodsReview = goodsService.selectReview(Map.getMap());

	      mv.addObject("goodsReview", goodsReview);

	      int reviewEndPagingNum = pagingSet;
	      int reviewStartPagingNum = 0;
	      int reviewNowPage = 1;

	      String pagingReviewOnOff = (String) Map.getMap().get("pagingReviewOnOff");
	      if (pagingReviewOnOff != null) {
	         String i = (String) Map.getMap().get("i");
	         reviewEndPagingNum = Integer.parseInt((String) Map.getMap().get("reviewEndPagingNum"));
	         // String
	         // qnaStartPagingNumCheck=((String)commandMap.getMap().get("qnaStartPagingNum"));
	         // if(qnaStartPagingNumCheck!=null)
	         // {
	         reviewStartPagingNum = Integer.parseInt((String) Map.getMap().get("reviewStartPagingNum"));
	         // }
	         // System.out.println("페이징 넘1 :" + qnaStartPagingNum);
	         // System.out.println("페이징 넘 :" + qnaEndPagingNum);
	         reviewNowPage = Integer.parseInt((String) Map.getMap().get("reviewNowPage"));
	         if (i.equals("1"))// prev 클릭
	         {
	            if (reviewEndPagingNum == pagingSet) {
	               System.out.println("첫페이지");
	            } else {
	               reviewStartPagingNum = reviewStartPagingNum - pagingSet;
	               reviewEndPagingNum = reviewEndPagingNum - pagingSet;
	               reviewNowPage = reviewNowPage - 1;
	               System.out.println("리뷰전페이지이동");
	            }
	         } else if (i.equals("2")) // next 클릭
	         {
	            if (reviewEndPagingNum < goodsReview.size()) {
	               reviewStartPagingNum = reviewStartPagingNum + pagingSet;
	               reviewEndPagingNum = reviewEndPagingNum + pagingSet;
	               reviewNowPage = reviewNowPage + 1;
	               System.out.println("리뷰다음페이지이동");
	            } else {
	               System.out.println("마지막페이지");
	            }

	         }
	         System.out.println("페이징 넘연산결과 " + reviewEndPagingNum);
	         mv.setViewName("goods/review/goodsDetail_Review");
	      }
	      mv.addObject("reviewEndPagingNum", reviewEndPagingNum);
	      mv.addObject("reviewStartPagingNum", reviewStartPagingNum);
	      mv.addObject("reviewNowPage", reviewNowPage);
	      mv.addObject("reviewSize", goodsReview.size());
	      mv.addObject("reviewTotalPage", (int) Math.ceil((double) goodsReview.size() / pagingSet));

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
