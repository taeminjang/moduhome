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
	 private int blockCount = 9;
	 private int blockPage = 5;
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
		System.out.println("ajaxmap:"+ Map.getMap());
		
		String categoryName = (String) Map.getMap().get("CATEGORY");
		String subCategoryName = (String) Map.getMap().get("SUBCATEGORY");
		
		System.out.println("categoryName:"+categoryName);
		System.out.println("subCategoryName:"+subCategoryName);
		
		String sort = (String) Map.getMap().get("sort");
		
		if(sort != null) {
			System.out.println("sort:"+sort);
			mv.setViewName("store/goodsSort");
			Map.getMap().put("sort", sort);
		} else {
			sort = "1";
			Map.getMap().put("sort", sort);
		}
		
		if(subCategoryName == null || subCategoryName == "") {
			subCategoryName = null;
			Map.getMap().put("SUBCATEGORY", subCategoryName);
		}
		
		if(categoryName.equals("전체")) {
			System.out.println("전체출력");
			Map.getMap().put("CATEGORY", null);
		}
		
		List<String> goodsCategory = new ArrayList<>();
		
		 if (categoryName.equals("가구")) {
	         goodsCategory.add("침실가구");
	         goodsCategory.add("거실가구");
	         goodsCategory.add("주방가구");
	         goodsCategory.add("홈오피스");
	         goodsCategory.add("테이블");
	         goodsCategory.add("체어");
		 }
		 
		 if (categoryName.equals("가전")) {
	         goodsCategory.add("생활가전");
	         goodsCategory.add("주방가전");
	         goodsCategory.add("시즌가전");
		 }
		 
		 if (categoryName.equals("패브릭")) {
	         goodsCategory.add("커튼/블라인드");
	         goodsCategory.add("매트·러그");
	         goodsCategory.add("패브릭소품");
		 }
		 
		 if (categoryName.equals("주방")) {
	         goodsCategory.add("주방용품");
	         goodsCategory.add("주방수납");
	         goodsCategory.add("주방소품");
		 }
	
		 if (categoryName.equals("생활·수납")) {
	         goodsCategory.add("홈케어");
	         goodsCategory.add("욕실용품");
	         goodsCategory.add("생활용품");
		 }

		/* if(Map.getMap().get("SUBCATEGORY")!=null) {
			 if (!((String) Map.getMap().get("SUBCATEGORY")).equals("")) {
			 
			 }
		 }*/
		System.out.println("Map.getMap():"+Map.getMap());
		
		if(Map.getMap() !=null) {
		List<Map<String, Object>> goodsCategoryList = goodsService.goodsCategory(Map.getMap());
		System.out.println("goodsCategoryList:"+goodsCategoryList);
		
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

	      page = new GoodsPaging(currentPage, totalCount, blockCount, blockPage);
	      pagingHtml = page.getPagingHtml().toString();

	      int lastCount = totalCount;

	      if (page.getEndCount() < totalCount)
	         lastCount = page.getEndCount() + 1;

	      goodsCategoryList = goodsCategoryList.subList(page.getStartCount(), lastCount);

		
	    mv.addObject("totalCount", totalCount);
	    mv.addObject("pagingHtml", pagingHtml);
	     
		mv.addObject("categoryName", categoryName);
		mv.addObject("subCategory", goodsCategory);
		mv.addObject("subCategoryOne", subCategoryName);
		mv.addObject("goodsCategoryList", goodsCategoryList);
		}
		return mv;
		
	}
	
	@RequestMapping(value = "/goods/detail")
	public ModelAndView goodsDetail(HttpServletResponse response, HttpServletRequest request, CommandMap Map, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("pagingReviewOnOff:"+Map.getMap().get("pagingReviewOnOff"));
		
		//상품페이지 첫 요청시 (ajax 요청이 아닐 경우)
		if(Map.getMap().get("pagingReviewOnOff") == null && Map.getMap().get("pagingQnaOnOff") == null) {
			System.out.println("상품페이지 첫 요청");
			mv.setViewName("goodsDetail");
			int checkBuy;
			
			goodsService.goodsCountUp(Map.getMap());
			System.out.println("goodsdetailMap:"+Map.getMap());
			List<Map<String, Object>> goodsDetail = goodsService.selectOneGood(Map.getMap());
		    List<Map<String, Object>> goodsImage = goodsService.selectImage(Map.getMap());
		    
		    Map<String, Object> goodsBasic = goodsDetail.get(0);
		    System.out.println("goodsBasic:"+goodsBasic);
		    
		    mv.addObject("goodsBasic", goodsBasic);
		    mv.addObject("GOODS_NUMBER", goodsDetail.get(0).get("GOODS_NUMBER"));
		
		    
		    List<Map<String, Object>> relatedGoods = goodsService.selectRelatedGoods(goodsBasic);
		    
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
		         System.out.println("checkBuy:"+checkBuy);
	         
	      }
		    
		     mv.addObject("goodsDetail", goodsDetail);
		     mv.addObject("relatedGoods", relatedGoods);
			 mv.addObject("goodsImage", goodsImage);
			 System.out.println("goodsImage"+ goodsImage);
		}
		
	    //상품후기 리스트
	    List<Map<String, Object>> reviewList = goodsService.selectReview(Map.getMap());
	    System.out.println("reviewList:"+reviewList);
	    
	      int reviewEndPagingNum = pagingSet;
	      int reviewStartPagingNum = 0;
	      int reviewNowPage = 1;

	      String pagingReviewOnOff = (String) Map.getMap().get("pagingReviewOnOff");
	      System.out.println("후기pagingReviewOnOff:"+pagingReviewOnOff);
	      
	      //상품 후기 ajax 페이징
	      if (pagingReviewOnOff != null) {
	         String i = (String) Map.getMap().get("i");
	         reviewEndPagingNum = Integer.parseInt((String) Map.getMap().get("reviewEndPagingNum"));
	         reviewStartPagingNum = Integer.parseInt((String) Map.getMap().get("reviewStartPagingNum"));
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
	            if (reviewEndPagingNum < reviewList.size()) {
	               reviewStartPagingNum = reviewStartPagingNum + pagingSet;
	               reviewEndPagingNum = reviewEndPagingNum + pagingSet;
	               reviewNowPage = reviewNowPage + 1;
	               System.out.println("리뷰다음페이지이동");
	            } else {
	               System.out.println("마지막페이지");
	            }
	         }
	         System.out.println("페이징 넘연산결과 " + reviewEndPagingNum);
	         mv.setViewName("store/review/goodsDetail_Review");
	      }
	      mv.addObject("reviewEndPagingNum", reviewEndPagingNum);
	      mv.addObject("reviewStartPagingNum", reviewStartPagingNum);
	      mv.addObject("reviewNowPage", reviewNowPage);
	      mv.addObject("reviewSize", reviewList.size());
	      mv.addObject("reviewTotalPage", (int) Math.ceil((double) reviewList.size() / pagingSet));
	    
	    
	    //QnA 리스트
	    List<Map<String, Object>> qnaList = goodsService.selectQNA(Map.getMap());
	    System.out.println("qnaList:"+qnaList);
	    System.out.println("qnaListSIze:"+qnaList.size());
	    
	    //QNA 페이징
	    int qnaEndPagingNum = pagingSet; // 5
        int qnaStartPagingNum = 0;
        int qnaNowPage = 1;

	      String pagingQnaOnOff = (String) Map.getMap().get("pagingQnaOnOff");
	      System.out.println("상품문의pagingQnaOnOff:"+pagingQnaOnOff);
	      System.out.println("pagingQnaOnOff: " + (String) Map.getMap().get("pagingQnaOnOff"));
	      if (pagingQnaOnOff != null) {
	         String i = (String) Map.getMap().get("i");
	         qnaEndPagingNum = Integer.parseInt((String) Map.getMap().get("qnaEndPagingNum"));
	         qnaStartPagingNum = Integer.parseInt((String) Map.getMap().get("qnaStartPagingNum"));
	         qnaNowPage = Integer.parseInt((String) Map.getMap().get("qnaNowPage"));
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
	            if (qnaEndPagingNum < qnaList.size()) {
	               qnaStartPagingNum = qnaStartPagingNum + pagingSet;
	               qnaEndPagingNum = qnaEndPagingNum + pagingSet;
	               qnaNowPage = qnaNowPage + 1;
	               System.out.println("다음페이지이동");
	            } else {
	               System.out.println("마지막페이지");
	            }

	         }
	         System.out.println("qnaEndPagingNum 연산결과  :" + qnaEndPagingNum);
	         mv.setViewName("store/qna/goodsDetail_Qna");
	      }

	      int totalPage = (int) Math.ceil((double) qnaList.size() / pagingSet);
	      System.out.println("총 페이지 갯수 :" + totalPage);
	      mv.addObject("qnaEndPagingNum", qnaEndPagingNum);
	      mv.addObject("qnaStartPagingNum", qnaStartPagingNum);
	      mv.addObject("qnaNowPage", qnaNowPage);
	      mv.addObject("qnaSize", qnaList.size());
	      mv.addObject("qnaTotalPage", totalPage);
	    
	     mv.addObject("qnaList", qnaList);
	     mv.addObject("reviewList", reviewList);
	     mv.addObject("GOODS_NUMBER", Map.getMap().get("GOODS_NUMBER"));
		System.out.println("아아:"+Map.getMap().get("GOODS_NUMBER"));
	     
		
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
