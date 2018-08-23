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
		//비로그인 사용자 처리 필요
		
		//회원정보
		System.out.println("commandMap.getMap():"+commandMap.getMap());
		
		System.out.println("11:"+commandMap.get("MEMBER_NUMBER"));
		
		
		Map<String, Object> orderMember = orderService.orderMember(commandMap.getMap());
		mv.addObject("orderMember", orderMember);
		
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
		
		mv.addObject("GOODS_NUMBER", request.getParameter("goodsno"));
		mv.addObject("goods", goods);
		mv.addObject("goods_kind_number", goods_kinds_number);
		mv.addObject("ea", ea);
		
		return mv;
	
	}
	
	@RequestMapping(value="/orderEnd")
	public ModelAndView orderEnd(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("orderEnd");
		//멤버 넘버가 세션으로 넘어오도록
		//mv.setViewName("redirect:/orderEnd");
		System.out.println("orderendMap:"+commandMap.getMap());
		commandMap.put("MEMBER_NUMBER", request.getParameter("MEMBER_NUMBER"));
		
		Map<String, Object> orderMember = orderService.orderMember(commandMap.getMap());
		
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();

		for (int i = 0; i < 5; i++) {
			temp.append((char) ((rnd.nextInt(26)) + 65));
		}

		List<Map<String, Object>> goods = new ArrayList<Map<String, Object>>();

		String[] goods_kinds_number = request.getParameterValues("kinds[]");
		String[] ea = request.getParameterValues("ea[]");
		//포인트 사용 후 총 포인트
		//String[] goods_total = request.getParameterValues("goods_total[]");
		String[] goods_number = request.getParameterValues("GOODS_NUMBER");

		int total = 0;

		for (int i = 0; i < goods_kinds_number.length; i++) {

			commandMap.put("GOODS_KIND_NUMBER", goods_kinds_number[i]);
			commandMap.put("EA", ea[i]);
			commandMap.put("GOODS_NUMBER", goods_number[i]);

			Map<String, Object> orderGoods = orderService.orderGoods(commandMap.getMap());

			orderGoods.put("EA", ea[i]);

			goods.add(orderGoods);

			System.out.println("goods : " + goods);

			//total += Integer.parseInt(goods_total[i]);
		}
		System.out.println("total:"+total);
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String date = sdf.format(d);

		String ORDER_CODE = ("S" + date + temp);

		System.out.println(ORDER_CODE);

		commandMap.put("ORDER_CODE", ORDER_CODE);
		

		commandMap.put("BUYER_ZIPCODE", orderMember.get("MEMBER_ZIPCODE"));
		commandMap.put("BUYER_ADDRESS1", orderMember.get("MEMBER_ADDRESS1"));
		commandMap.put("BUYER_ADDRESS2", orderMember.get("MEMBER_ADDRESS2"));
		commandMap.put("BUYER_NAME", orderMember.get("MEMBER_NAME"));
		commandMap.put("BUYER_EMAIL", orderMember.get("MEMBER_EMAIL"));
		commandMap.put("BUYER_NUMBER", orderMember.get("MEMBER_PHONE"));

		
		if (request.getParameter("DELIVERY_MESSAGE").isEmpty()) {
			commandMap.put("DELIVERY_MESSAGE", " ");
		}

		commandMap.put("GOODS_NUMBER", request.getParameter("GOODS_NUMBER"));
		commandMap.put("RECEIVER_NAME", request.getParameter("RECEIVER_NAME"));
		commandMap.put("RECEIVER_ZIPCODE", request.getParameter("RECEIVER_ZIPCODE"));
		commandMap.put("RECEIVER_ADDRESS1", request.getParameter("RECEIVER_ADDRESS1"));
		commandMap.put("RECEIVER_ADDRESS2", request.getParameter("RECEIVER_ADDRESS2"));
		commandMap.put("RECEIVER_NUMBER", request.getParameter("RECEIVER_NUMBER"));
		commandMap.put("DELIVERY_MESSAGE", request.getParameter("DELIVERY_MESSAGE"));
		commandMap.put("RECEIVER_NUMBER", request.getParameter("RECEIVER_PHONE"));
		commandMap.put("TOTALPRICE", request.getParameter("TOTALPRICE"));
	

		orderService.createDeliveryList(commandMap.getMap());
		
		for (int i = 0; i < goods_kinds_number.length; i++) {

			commandMap.put("GOODS_KIND_NUMBER", goods_kinds_number[i]);
			commandMap.put("ORDER_AMOUNT", ea[i]);
			//commandMap.put("ORDER_TOTAL_PRICE", goods_total[i]);
			commandMap.put("ORDER_TOTAL_PRICE", request.getParameter("TOTALPRICE"));
			commandMap.put("GOODS_NUMBER", goods_number[i]);

			System.out.println("GOODS_NUMBER : " + commandMap.get("GOODS_NUMBER"));
			System.out.println("GOODS_KIND_NUMBER : " + commandMap.get("GOODS_KIND_NUMBER"));
			System.out.println("ORDER_AMOUNT : " + commandMap.get("ORDER_AMOUNT"));
			System.out.println("ORDER_CODE : " + commandMap.get("ORDER_CODE"));
			
			orderService.createOrderList(commandMap.getMap());
			orderService.goodsCountDown(commandMap.getMap());

		}


		mv.addObject("orderMember", orderMember);

		System.out.println("TOTALPRICE : " + commandMap.get("TOTALPRICE"));

		mv.addObject("goods", goods);

		mv.addObject("goods_kind_number", goods_kinds_number);
		mv.addObject("ea", ea);
		System.out.println("포인트 사용");
		//포인트 사용
		if (commandMap.getMap().get("usePoint") != null) {
			if(!((String)commandMap.getMap().get("usePoint")).isEmpty()){
			int usePoint = Integer.parseInt((String) commandMap.getMap().get("usePoint"));
			System.out.println("사용포인트:" + usePoint);

			if (usePoint != 0) {
				System.out.println("포인트가 0이 아닌것들만 적립내역DB에 들어가거라");

				int POINT_POINT = -(usePoint);

				System.out.println("POINT_POINT" + POINT_POINT);

				commandMap.getMap().put("POINT_POINT", POINT_POINT);
				commandMap.getMap().put("POINT_CONTENT", "상품 구매");

				orderService.insertPoint(commandMap.getMap());

			}

			mv.addObject("usePoint", usePoint);
		  }
			
		}
		mv.addObject("ORDER_CODE", ORDER_CODE);
		mv.addObject("BUYER_NUMBER", commandMap.get("BUYER_NUMBER"));
		mv.addObject("TOTALPRICE", commandMap.get("TOTALPRICE"));
		System.out.println(commandMap.get("TOTALPRICE"));
		mv.addObject("RECEIVER_NAME", commandMap.get("RECEIVER_NAME"));
		mv.addObject("RECEIVER_ZIPCODE", commandMap.get("RECEIVER_ZIPCODE"));
		mv.addObject("RECEIVER_ADDRESS1", commandMap.get("RECEIVER_ADDRESS1"));
		mv.addObject("RECEIVER_ADDRESS2", commandMap.get("RECEIVER_ADDRESS2"));
		mv.addObject("DELIVERY_MESSAGE", commandMap.get("DELIVERY_MESSAGE"));
		mv.addObject("RECEIVER_PHONE", commandMap.get("RECEIVER_NUMBER"));
		System.out.println("주소1:"+commandMap.get("RECEIVER_ADDRESS1"));
		System.out.println("주소2:"+commandMap.get("RECEIVER_ADDRESS2"));
		
		return mv;
	}
	
	
}
