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

import com.kh.alarm.AlarmService;
import com.kh.moduhome.CommandMap;
import com.kh.sns.SnsService;

@Controller
public class SnsCommentController {

	@Resource(name = "snscommentService")
	private SnsCommentService snscommentService;
	
	@Resource(name="alarmService")
	private AlarmService alarmService;
	
	@Resource(name="snsService")
	private SnsService snsService;	
	
	//스토리 댓글 등록
	@RequestMapping(value="/snsCommentInsert", method= RequestMethod.POST)
	public ModelAndView snsCommentInsert(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception{
		
		ModelAndView mv=new ModelAndView("redirect:/snslist");
		/*commandMap.getMap().put("MEMBER_NUMBER", session.getAttribute("MEMBER_NUMBER").toString());*/
		System.out.println("덧글작성은 여기에서 실행된다?");
		System.out.println("파람" + commandMap.getMap());
		
		
		/*알람 관련 코드*/
		int reg_id = Integer.parseInt(commandMap.get("MEMBER_NUMBER").toString());
		String sns_num = (String) commandMap.getMap().get("SNS_NUMBER"); //알람발생 sns_number
		int article_writer = snsService.snsWriter(sns_num);
		int article_num = Integer.parseInt(sns_num);
		alarmService.regAlarm(article_writer, reg_id, article_num, 3); //댓글등록시 story작성자에게 알람등록
		
		snscommentService.snsCommentInsert(commandMap.getMap(),request);
		return mv;
	}

	
}
