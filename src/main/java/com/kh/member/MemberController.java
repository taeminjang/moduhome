package com.kh.member;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	    /*  @Resource(name="memberService")
	      private MemberService memberService;*/
	      
	      @RequestMapping(value="/modifyMem")
	      public ModelAndView modifyMem() {
	    	  ModelAndView mv = new ModelAndView();
	    	  mv.setViewName("modifyMem");
	    	  return mv;
	      }
	      
}
