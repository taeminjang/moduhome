package com.kh.follow;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.moduhome.CommandMap;

import com.kh.follow.MemberModel;


@Controller
public class FollowController {

	
	@Resource(name="followService")
	private FollowService followService;
	
	//�ȷο� ������
/*	@RequestMapping(value = "/follow2")
	public ModelAndView followPerson1() throws Exception {
		ModelAndView mv = new ModelAndView();

		//Map<String, Object> memberOne = followService.selectMemberOne(commandMap.getMap());
		//mv.addObject("MEMBER", memberOne);

		mv.setViewName("myfollow");
		return mv;
	}*/
	
	//�ȷο� ������ -> ���� ������������ �ű��
	@RequestMapping(value = "/follow")
	public ModelAndView followPerson(@ModelAttribute("MemberModel") MemberModel memberModel, CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		int MEMBER_NUMBER =  Integer.parseInt(request.getParameter("MEMBER_NUMBER"));
		
		System.out.println("get���� ���۵Ǵ� member_number ��"+ MEMBER_NUMBER);
		
		memberModel = followService.selectIdMember(MEMBER_NUMBER);
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("MEMBER_NUMBER")!=null){
			//int session_mem_number = session.getAttribute("MEMBER_NUMBER");
			//int follow_exist = followService.followExist((session.getAttribute("MEMBER_NUMBER")), MEMBER_NUMBER);
			int follow_exist = followService.followExist(MEMBER_NUMBER, MEMBER_NUMBER);
			mv.addObject("follow_exist", follow_exist);
			
			System.out.println("follow_exist�� ����ǳ�?? "+ follow_exist);
		}
		//HttpSession session = request.getSession();
	      
		//Map<String, Object> memberOne = followService.selectMemberOne(commandMap.getMap());
/*		mv.addObject("MEMBER", memberOne);
        session.setAttribute("MEMBER_NUMBER", memberOne.get("MEMBER_NUMBER"));
        session.setAttribute("MEMBER_NAME", memberOne.get("MEMBER_NAME"));
        session.setAttribute("MEMBER_NICKNAME", memberOne.get("MEMBER_NICKNAME"));
        session.setAttribute("MEMBER_PHONE", memberOne.get("MEMBER_PHONE"));
        session.setAttribute("MEMBER_EMAIL", memberOne.get("MEMBER_EMAIL"));
        session.setAttribute("MEMBER_ADMIN", memberOne.get("MEMBER_ADMIN"));*/

		
		
		mv.addObject("memberModel", memberModel);
		mv.setViewName("myfollow");
		return mv;
	}
	
	@RequestMapping(value="/followDo", method = RequestMethod.POST)
	public @ResponseBody int followDo(@RequestBody FollowModel followModel) throws Exception{

		int state = followService.followExist(followModel.getFollow(), followModel.getFollowing());
		
		System.out.println("state �� : "+ state);
		
		if(state == 0){
			followService.followReg(followModel);
			
			//String following = followModel.getFollowing_id();
			//String reg_id = followModel.getFollow_id();
			//alramService.regAlram(following_id, reg_id, 0, 3);
			
		}
		if(state == 1){
			followService.followDel(followModel);
		}
		
		return followService.followExist(followModel.getFollow(), followModel.getFollowing());
	}
	
	
	
	
	
	
	
	
	
	
	

	// �������� ����
	@RequestMapping(value = "notify/adminNotifyModify")
	public ModelAndView adminNotifyModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/notify/adminNotifyList");

		//adminNotifyService.notifyModify(commandMap.getMap(), request);
		//mv.addObject("NOTIFY_NUMBER", commandMap.get("NOTIFY_NUMBER"));

		return mv;
	}	
}
