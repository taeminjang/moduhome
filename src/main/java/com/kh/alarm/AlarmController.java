package com.kh.alarm;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AlarmController {

	@Resource(name="alarmService")
	private AlarmService alarmService;
	
	@RequestMapping(value="/alarmRead.do")
	public ModelAndView alarmRead(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		String alarm_seq = request.getParameter("alarm_seq");
		
		alarmService.readAlarm(alarm_seq);
		AlarmModel alarmModel = alarmService.selectAlarmOne(alarm_seq);
		
		String url = "";
		if(alarmModel.getAlarm_index_no() == 1 || alarmModel.getAlarm_index_no() == 4 || alarmModel.getAlarm_index_no() == 5 || alarmModel.getAlarm_index_no() == 6 || alarmModel.getAlarm_index_no() == 7){
			url = "viewStyle.do?url=main&article_seq="+alarmModel.getAlarm_contnum();
		}else if(alarmModel.getAlarm_index_no() == 2){
			url = "viewCollection.do?url=myPageActivity&mem_id="+alarmModel.getAlarm_id()+"&collection_seq="+alarmModel.getAlarm_contnum();
		}else if(alarmModel.getAlarm_index_no() == 3){
			url = "myPageActivitySty.do?mem_id="+alarmModel.getAlarm_id();
		}
		
		mav.setViewName("redirect:"+url);
		
		return mav;
	}
	
}
