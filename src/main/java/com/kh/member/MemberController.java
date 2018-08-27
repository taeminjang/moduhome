package com.kh.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
       
	@Resource(name="memberService")
	private MemberService memberService;
	
	/*@RequestMapping(value="memModify")
	public ModelAndView memModifyForm(HttpSession session)throws Exception{
	   ModelAndView mv = new ModelAndView();	
	   String MEMBER_NUMBER = session.getAttribute("MEMBER_NUMBER").toString();
	   
	    Map<String, String> map = new HashMap<String,String>();
	    map = memberService
	}*/
	
}
