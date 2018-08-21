/*package com.kh.magazineComment;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;

import kh.command.CommandMap;

@Controller
public class MagazineCMController {

	@Resource(name = "magazinecmService")
	private MagazineCMService magazinecmService;
	
	//리뷰 폼으로 이동
	@RequestMapping(value="/review/reviewForm")
	public ModelAndView reviewForm(){
		ModelAndView mv=new ModelAndView("goods/review/modal_reviewForm");
		return mv;
	}
	
	//리뷰 등록
	@RequestMapping(value="/magazineCM")
	public ModelAndView magazineCmWrite(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception{
		
		ModelAndView mv=new ModelAndView("redirect:/mgDetail?MG_NUMBER="+commandMap.get("MG_NUMBER"));
		commandMap.getMap().put("MEMBER_NUMBER", session.getAttribute("MEMBER_NUMBER").toString());
		System.out.println("파람" + commandMap.getMap());
		magazinecmService.magazineCmWrite(commandMap.getMap(),request);
		return mv;
	}
	
	@RequestMapping(value = "/reviewList")
	public ModelAndView SNSreviewList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> reviewList = reviewService.reviewList(commandMap.getMap());
			
		mv.addObject("reviewList", reviewList);
		mv.setViewName("list2");
		
		return mv;
	}
	
	
}
*/