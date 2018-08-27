package com.kh.sns;

import java.io.File;
import java.util.HashMap;
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

import com.kh.moduhome.CommandMap;
import com.kh.snsComment.SnsCommentService;



@Controller
public class SnsController {

	@Resource(name = "snsService")
	private SnsService snsService;
	
	@Resource(name = "snscommentService")
	private SnsCommentService snscommentService;
	

	//스토리 리스트
	@RequestMapping(value = "/snslist")
	public ModelAndView snsList(HttpSession session,CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		String MEMBER_NUMBER = session.getAttribute("MEMBER_NUMBER").toString();
		
		List<Map<String, Object>> snsList = snsService.snsList(commandMap.getMap());
		List<Map<String, Object>> snsCommentList = snscommentService.snsCommentList(commandMap.getMap());
		//프로젝트옮길때 리뷰리스트 코맨트패키지로 옮기기	
		mv.addObject("MEMBER_NUMBER", MEMBER_NUMBER);
		mv.addObject("snsCommentList", snsCommentList);
		mv.addObject("snsList", snsList);
		mv.setViewName("/sns/snsList");
		
		return mv;
	}
	
	
	//스토리 리스트
	@RequestMapping(value = "/snslist2")
	public ModelAndView snsList2(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> snsList = snsService.snsList(commandMap.getMap());
		List<Map<String, Object>> snsCommentList = snscommentService.snsCommentList(commandMap.getMap());
		
		//likeexist 를 여기서 보여줘야 할거같음.
		
		mv.addObject("snsCommentList", snsCommentList);
		mv.addObject("snsList", snsList);
		mv.setViewName("snsList2");
		
		return mv;
	}
	

	// 스토리 등록
	@RequestMapping(value = "/snsinsert", method = RequestMethod.POST)
	public ModelAndView snsInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/snslist");

		System.out.println("member_number의 값은?" + commandMap.get("MEMBER_NUMBER"));
		
		snsService.snsInsert(commandMap.getMap(), request);

		return mv;
	}

	
}
