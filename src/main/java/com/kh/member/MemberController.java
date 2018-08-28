package com.kh.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.moduhome.CommandMap;

@Controller
public class MemberController {
       
	@Resource(name="memberService")
	private MemberService memberService;
	
	@RequestMapping(value="memModify")
	public ModelAndView memModify(HttpSession session)throws Exception{
	   ModelAndView mv = new ModelAndView();	
	   String MEMBER_NUMBER = session.getAttribute("MEMBER_NUMBER").toString();
	   
	    Map<String, Object> member = new HashMap<String,Object>();
	    member = memberService.memberInfo(MEMBER_NUMBER);
	    mv.addObject("MEMBER_ID",member.get("MEMBER_ID"));
	    mv.addObject("member",member);
	    mv.setViewName("updateMemberInfo");
	    
	    return mv;
	}
	
	@RequestMapping(value="/updateMemComplete", method=RequestMethod.POST) //step2사용자 회원가입의 폼의 데이터를 받아서 처리 
	public ModelAndView updateMemComplete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();		
		Map<String, Object> memberMap=new HashMap<String, Object>();
		memberMap=commandMap.getMap();
		
		memberService.ModifyMember(memberMap, request);
		System.out.print("개인정보수정 DB");
		mv.setViewName("joinComplete");
		return mv;
		
	}
	
}
