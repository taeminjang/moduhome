package com.kh.moduhome;

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


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	

	
	// 홈
	@RequestMapping(value = "home")
	public ModelAndView home(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("home");
		

		
		return mv;
	}
	
	// 홈
	@RequestMapping(value = "main")
	public ModelAndView main(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/main");
		

		
		return mv;
	}

}
