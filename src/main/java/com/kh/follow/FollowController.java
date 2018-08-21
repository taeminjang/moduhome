package com.kh.follow;

import java.util.List;
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
import com.kh.alarm.AlarmService;
import com.kh.follow.MemberModel;


@Controller
public class FollowController {

	
	@Resource(name="followService")
	private FollowService followService;
	
	@Resource(name="alarmService")
	private AlarmService alarmService;
	
	//팔로우 개인폼 -> 추후 마이페이지로 옮기기
	@RequestMapping(value = "/follow")
	public ModelAndView followPerson(@ModelAttribute("MemberModel") MemberModel memberModel, CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();
		
		int MEMBER_NUMBER =  Integer.parseInt(request.getParameter("MEMBER_NUMBER"));
		String mem_id = request.getParameter("MEMBER_NUMBER");
		
		System.out.println("get으로 전송되는  member_number 는"+ MEMBER_NUMBER);
		System.out.println("session_membernumber의 값은 : "+ session.getAttribute("MEMBER_NUMBER") );
		memberModel = followService.selectIdMember(MEMBER_NUMBER);
		
		if(session.getAttribute("MEMBER_NUMBER")!=null){
			int follow_exist = followService.followExist(MEMBER_NUMBER, session.getAttribute("MEMBER_NUMBER"));
			mv.addObject("follow_exist", follow_exist);
			System.out.println("follow_exist가 실행되나?? "+ follow_exist);
		}
		
		//String like_quantity = likeService.selectLikeQuan(mem_id);
		String follow_quantity = followService.selectfollowQuan(mem_id);
		String following_quantity = followService.selectfollowingQuan(mem_id);
		//int act_quantity = article_quan + collection_quan;

		mv.addObject("follow_quantity", follow_quantity);
		mv.addObject("following_quantity", following_quantity);
		//mav.addObject("like_quantity", like_quantity);
		//mav.addObject("act_quantity", act_quantity);
		//mav.addObject("article_quan", article_quan);
		//mav.addObject("collection_quan", collection_quan);		
		
		mv.addObject("memberModel", memberModel);
		mv.setViewName("myfollow");
		return mv;
	}


	//팔로우 버튼을 누르면 동작하는 메서드
	@RequestMapping(value="/followDo", method = RequestMethod.POST)
	public @ResponseBody int followDo(@RequestBody FollowModel followModel) throws Exception{

		System.out.println("followDo가 실행되긴 한가?");
		
		int state = followService.followExist(followModel.getFollow(), followModel.getFollowing());
		
		System.out.println("state 는 : "+ state);
		
		if(state == 0){
			followService.followReg(followModel);
			
			int following = followModel.getFollow();
			int reg_id = followModel.getFollowing();
			alarmService.regAlarm(following, reg_id, 0, 2);
			
		}
		if(state == 1){
			followService.followDel(followModel);
		}
		
		return followService.followExist(followModel.getFollow(), followModel.getFollowing());
	}
/*	원본소스코드
	@RequestMapping(value="/followerViewData", method = RequestMethod.POST)
	public @ResponseBody List<FollowListModel> followerViewData(@RequestBody FollowListModel followListModel, HttpSession session) throws Exception{
		
		String mem_id = followListModel.
		System.out.println("followerViewData가 실행?");
		return followService.followerViewData(followListModel, following);
	}*/
	
	@RequestMapping(value="/followerViewData", method = RequestMethod.POST)
	public @ResponseBody List<FollowListModel> followerViewData(@RequestBody FollowListModel followListModel, HttpSession session) throws Exception{
			
		int mem_id = followListModel.getFollow();
		System.out.println("followerViewData가 실행?");
		System.out.println("mem_id의 값은?" + mem_id);
		
		return followService.followerViewData(followListModel, mem_id);
	}
	
	
	@RequestMapping(value="/followingViewData", method = RequestMethod.POST)
	public @ResponseBody List<FollowListModel> followingViewData(@RequestBody FollowListModel followListModel, HttpSession session) throws Exception{
		
		System.out.println("followingViewData가 실행?");
		return followService.followingViewData(followListModel, (String) session.getAttribute("session_mem_id"));
	}
	
	

}
