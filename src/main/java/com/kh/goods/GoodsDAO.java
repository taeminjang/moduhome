package com.kh.goods;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.moduhome.AbstractDAO;

@Repository("goodsDAO")
public class GoodsDAO extends AbstractDAO{

	
	//스토어 메인, 상품 판매순 정렬
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> bestSellAll() throws Exception{
		return selectList("goods.bestSellAll");
	}
	

	// 카테고리별 상품 정렬 상단부 인기아이템 4개
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsCategory(Map<String, Object> map) throws Exception{
		return selectList("goods.goodsCategory",map);
	}
	// 카테고리별 상품 정렬 소트 동적쿼리 (기본값  판매량수
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> sortGoodsCategory(Map<String, Object> map) throws Exception{
		return selectList("goods.sortGoodsCategory",map);
	}
	
	//소분류 카테고리 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsSubCategory(Map<String, Object> map) throws Exception {
	    return selectList("goods.allGoods" , map);
	}
	   
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> BestgoodsSubCategory(Map<String, Object> map) throws Exception {
	    return selectList("goods.bestGoods" , map);
	}
	   
	
	///////////////상세보기 (트랜잭션 묶음-->추후 추가)//////////////////
	//조회수증가
	public int goodsCountUp(Map<String, Object> map) throws Exception{
		return (int)update("goods.goodsCountUp",map);
	}
	//상품정보
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOneGoods(Map<String, Object> map) throws Exception{
		return selectList("goods.selectOneGoods",map);
	}
	//상품이미지
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectImage(Map<String, Object> map) throws Exception{
		return selectList("goods.selectImage",map);
	}
	
	//체크바이(구매했나 안했나 --> 상품리뷰작성가능)
	public int checkBuy(Map<String, Object> map) throws Exception{
		return (int)selectOne("goods.checkBuy",map);
	}
	
	//코디상품
	@SuppressWarnings("unchecked")
	  public Map<String, Object> selectRelatedGoods(Map<String, Object> map) throws Exception{
	      return selectOne1("goods.selectRelatedGoods",map);
	   }
	
	//상품문의리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQNA(Map<String, Object> map) throws Exception{
		return selectList("goods.selectQNA",map);
	}
	
	//리뷰가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReview(Map<String, Object> map) throws Exception{
		return selectList("goods.selectReview",map);
	}
	
	//리뷰평점
	@SuppressWarnings("unchecked")
	public int reviewScore(Map<String, Object> map) throws Exception{
		return (int)selectOne("goods.reviewScore",map);
	}
	//////////////////////////////상품 디테일 끝 //////////////////////////////////////////////
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsSearchList(Map<String, Object> map) throws Exception{
	    return selectList("goods.goodsSearchList",map);
    }
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsColorSearchList(Map<String, Object> map) throws Exception{
	    return selectList("goods.goodsColorSearchList",map);
    }
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> goodsSizeSearchList(Map<String, Object> map) throws Exception{
	    return selectList("goods.goodsSizeSearchList",map);
    }
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectCategoryCount(String category1) throws Exception{
	    return selectList("goods.selectCategoryCount",category1);
    }
	

	
	

}
