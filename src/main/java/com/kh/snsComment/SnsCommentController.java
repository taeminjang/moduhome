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
		ModelAndView mv = new ModelAndView();
		System.out.println("멤버넘버"+commandMap.getMap().get("MEMBER_NUMBER"));
		System.out.println("글내용"+commandMap.get("SNS_NUMBER"));
		System.out.println("댓글 내용"+commandMap.get("SNS_CM_CONTENT"));
		
		/*알람 관련 코드*/
		int reg_id = Integer.parseInt(commandMap.get("MEMBER_NUMBER").toString());
		String sns_num = (String) commandMap.getMap().get("SNS_NUMBER"); //알람발생 sns_number
		int article_writer = snsService.snsWriter(sns_num);
		int article_num = Integer.parseInt(sns_num);
		alarmService.regAlarm(article_writer, reg_id, article_num, 3); //댓글등록시 story작성자에게 알람등록
		
		snscommentService.snsCommentInsert(commandMap.getMap(),request);
		
		//덧글을 쓴 곳이 스토리
		if(commandMap.get("CM_INDEX") == null) {
			mv.setViewName("redirect:/snslist");
		}
		//덧글을 쓴 곳이 마이페이지 -> hidden으로 cm_index를 보내서 값의 유무로 체크. 받아지는 값은 mypage
		else {
			mv.setViewName("redirect:/myStory");
		}
		
		return mv;
	}

	
}
