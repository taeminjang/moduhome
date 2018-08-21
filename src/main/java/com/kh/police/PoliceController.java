package com.kh.police;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.like.LikeService;
import com.kh.moduhome.CommandMap;
/*import com.mycom.paging.Paging;
import com.mycom.article.PoliceModel;*/

@Controller
public class PoliceController {

	
	
	@Resource(name="policeService")
	private PoliceService policeService;
	
	@RequestMapping(value="/police")  //후에 스토리view에 추가해줘야됨 신고작성할때 필요한 내용 솔직히 다 있는내용 구지 안해도될듯
	public ModelAndView police(HttpSession session,CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();		
		String mem_id = session.getAttribute("MEMBER_NUMBER").toString();  //세션에서 아이디가져오기		
		String article_seq = "124";  //게시물번호 설정
		
		String url = request.getRequestURL().toString();
        mv.addObject("mem_id", mem_id);
        mv.addObject("article_seq", article_seq);
        mv.addObject("url", url);  //지금 현재 url 보내줌
		mv.setViewName("police"); 
		return mv;
	}
	
	@RequestMapping(value="/policeReg",method= RequestMethod.POST)
	public ModelAndView policeReg(HttpServletRequest request, CommandMap Map)throws Exception{
		ModelAndView mav = new ModelAndView();
		
		policeService.policeReg(Map.getMap());   //신고내용 넣기
		
		String url = Map.get("url").toString(); //돌아가기 위한 url
		
		mav.addObject("url", url); // alert 확인을 누르고 돌아갈 경로
		mav.setViewName("policeRegSuc"); //신고완료 alert를 띄어줄 jsp
		
		return mav;
		
	}
}
