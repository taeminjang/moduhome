package com.kh.order;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.moduhome.CommandMap;


@Controller
public class OrderController {

	@Resource(name="orderService")
	private OrderService orderService;
	
	//구매하기
	@RequestMapping(value="/order")
	public ModelAndView orderForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("orderForm");
		String member = "71";
		//비로그인 사용자 처리 필요
		
		//회원정보
		System.out.println("commandMap.getMap():"+commandMap.getMap());
		commandMap.put("MEMBER_NUMBER", member);
		//System.out.println("commandMap.getMap():"+commandMap.getMap());
		Map<String, Object> orderMember = orderService.orderMember(commandMap.getMap());
		
		//상품옵션 및 수량정보
		String[] goods_kinds_number = request.getParameterValues("kinds[]"); 
		String[] ea = request.getParameterValues("ea[]");
		
		List<Map<String, Object>> goods = new ArrayList<Map<String, Object>>();

		
		for (int i = 0; i < goods_kinds_number.length; i++) {

			System.out.println("ea[" + i + "] = " + ea[i]);
			commandMap.put("GOODS_NUMBER", request.getParameter("goodsno"));
			commandMap.put("GOODS_KIND_NUMBER", goods_kinds_number[i]);
			commandMap.put("EA", ea[i]);
			System.out.println("CommandMap!! :" +commandMap.getMap());
			
			Map<String, Object> orderGoods = orderService.orderGoods(commandMap.getMap());
			
			System.out.println("orderGoods : " + orderGoods);

			orderGoods.put("EA", ea[i]);

			goods.add(orderGoods);

			System.out.println("goods : " + goods);
		}
		
		
		mv.addObject("orderMember", orderMember);
		mv.addObject("goods", goods);
		mv.addObject("goods_kind_number", goods_kinds_number);
		mv.addObject("ea", ea);
		
		return mv;
	
	}
	
	@RequestMapping(value="/orderEnd")
	public ModelAndView orderEnd(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("orderEnd");
	
		
		
		
		return mv;
	}
	
	
	
	
	
}
