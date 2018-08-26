package com.kh.mg;

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

import com.kh.collecting.CollectingService;
import com.kh.mgComment.MgCommentService;
import com.kh.moduhome.CommandMap;


@Controller
public class MgController {


	@Resource(name = "mgService")
	private MgService mgService;
	
	@Resource(name = "mgcommentService")
	private MgCommentService mgcommentService;	
	
	//보관하기 관련 서비스 등록
	@Resource(name="collectingService")
	private CollectingService collectingService;

	//매거진 리스트
	@RequestMapping(value = "/mglist")
	public ModelAndView mgList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> mgList = mgService.mgList(commandMap.getMap());
		
				
	
		mv.addObject("mgList", mgList);
		mv.setViewName("mgList");
		
		return mv;
	}

/*	@RequestMapping(value = "/mglist")
	public ModelAndView mgList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> mgList = mgService.mgList(commandMap.getMap());
		
				
	
		mv.addObject("mgList", mgList);
		mv.setViewName("/mg/mgList");
		
		return mv;
	}	*/
	
	
	//매거진 상세보기
	@RequestMapping(value = "/mgDetail")
	public ModelAndView mgDetail(HttpSession session, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		//String MEMBER_NUMBER = session.getAttribute("MEMBER_NUMBER").toString();
		
		Map<String, Object> mgDetail = mgService.mgDetail(commandMap.getMap());
		List<Map<String, Object>> mgCommentList = mgcommentService.mgCommentList(commandMap.getMap());
		List<Map<String, Object>> mgContentList = mgService.mgContentList(commandMap.getMap());
		
		System.out.println("mgnumber의 값은 뭘까용 ??" + mgDetail.get("MG_NUMBER"));
		
		//보관되어 있는 수를 가져오는 동작로직
		int MG_NUMBER = Integer.parseInt(mgDetail.get("MG_NUMBER").toString());
		String collecting_quan = collectingService.collectingQuan(MG_NUMBER);		
		System.out.println("보관한 수는 ? "+collecting_quan);
		
		//mv.addObject("MEMBER_NUMBER", MEMBER_NUMBER);
		mv.addObject("mgContentList", mgContentList);
		mv.addObject("mgCommentList", mgCommentList);
		mv.addObject("mgDetail", mgDetail);
		mv.addObject("collecting_quan", collecting_quan);
		mv.setViewName("mgDetail");

		
		return mv;
	}
	
	
	//매거진 등록 폼
	@RequestMapping(value = "/mgInsertForm")
	public ModelAndView mgInsertForm(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("/mg/mgTitleInsert");
		String MEMBER_NUMBER = session.getAttribute("MEMBER_NUMBER").toString();
		
		mv.addObject("MEMBER_NUMBER", MEMBER_NUMBER);
		mv.setViewName("/mg/mgTitleInsert");

		return mv;
	}
	
	// 매거진 타이틀 등록
	@RequestMapping(value = "/mgTitleInsert")
	public ModelAndView mgTitleInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("0");
		mgService.mgTitleInsert(commandMap.getMap(), request);
		System.out.println("1");
		Map<String, Object> mgNew = mgService.mgNew(commandMap.getMap());
		System.out.println("2");
		mv.addObject("mgNew", mgNew);
		System.out.println("파람" + commandMap.getMap());
		mv.setViewName("/mg/mgContentInsert");
		
		return mv;
	}
	

	
	// 매거진 내용 등록
	@RequestMapping(value = "/mgContentInsert")
	public ModelAndView mgContentInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/mgContentInsert?MG_NUMBER="+commandMap.get("MG_NUMBER"));

		/*commandMap.getMap().put("MEMBER_NUMBER", session.getAttribute("MEMBER_NUMBER").toString());*/
		System.out.println("파람" + commandMap.getMap());
		mgService.mgContentInsert(commandMap.getMap(),request);
		
		List<Map<String, Object>> mgContentList = mgService.mgContentList(commandMap.getMap());
		Map<String, Object> mgNew = mgService.mgNew(commandMap.getMap());
		
		mv.addObject("mgContentList", mgContentList);
		mv.addObject("mgNew", mgNew);
		
	
		mv.setViewName("/mg/mgContentInsert");
		
		
		return mv;
	}
	
	




	
	
}
