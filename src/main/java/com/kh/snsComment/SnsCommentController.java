package com.kh.snsComment;

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

@Controller
public class SnsCommentController {

	@Resource(name = "snscommentService")
	private SnsCommentService snscommentService;
	
	
	//스토리 댓글 등록
	@RequestMapping(value="/snsCommentInsert", method= RequestMethod.POST)
	public ModelAndView snsCommentInsert(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception{
		
		ModelAndView mv=new ModelAndView("redirect:/snslist");
		/*commandMap.getMap().put("MEMBER_NUMBER", session.getAttribute("MEMBER_NUMBER").toString());*/
		System.out.println("파람" + commandMap.getMap());
		snscommentService.snsCommentInsert(commandMap.getMap(),request);
		return mv;
	}

	
}
