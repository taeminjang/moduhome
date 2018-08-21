package com.kh.alarm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Repository;
import com.kh.moduhome.AbstractDAO;

@Repository("alarmDAO")
public class AlarmDAO extends AbstractDAO{

	private final String NAMESPACE = "alarm.";
	
	public void regAlarm(int writer_id, int reg_id, int alarm_contnum, int alarm_index_no){

		List<AlarmModel> alarmCheck = (List<AlarmModel>) AlarmCheck(alarm_index_no, alarm_contnum, writer_id);
		
		if(alarmCheck.size() == 0){
			Map param = new HashMap();
			param.put("alarm_index_no", alarm_index_no);
			param.put("alarm_contnum", alarm_contnum);
			param.put("alarm_id", writer_id);
			param.put("alarm_reg_id", reg_id);
			
			insert(NAMESPACE+"regAlarm", param);
		}

	}
	
	public List<AlarmModel> AlarmCheck(int alarm_index_no, int alarm_contnum, int alarm_id){
		
		Map param = new HashMap();
		param.put("alarm_index_no", alarm_index_no);
		param.put("alarm_contnum", alarm_contnum);
		param.put("alarm_id", alarm_id);
		
		List<AlarmModel> alarmCheck = (List<AlarmModel>) selectList(NAMESPACE+"alarmCheck", param);
		
		return alarmCheck;
	}
	
	public int alarmExist(String id){
		List<AlarmModel> alarmExist = (List<AlarmModel>) selectList(NAMESPACE+"alarmLoad", id);
		
		return alarmExist.size();
	}
	
	public List<AlarmModel> alarmLoad(String id){
		List<AlarmModel> alarmLoad = (List<AlarmModel>) selectList(NAMESPACE+"alarmLoad", id);
		
		return alarmLoad;
	}
	
	public void readAlarm(String alarm_seq){
		update(NAMESPACE+"readAlarm", alarm_seq);
	}
	
	public AlarmModel selectAlarmOne(String alarm_seq){
		return (AlarmModel) selectOne(NAMESPACE+"selectAlarmOne", alarm_seq);
	}
}
