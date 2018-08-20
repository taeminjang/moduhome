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
		
		if(alarmCheck.size() != 0){
			String dual_id = alarmCheck.get(0).getReg_id();
			
			String regex = ",";
			Pattern pattern = Pattern.compile(regex);
			int cnt = 0;

			Matcher matcher = pattern.matcher(dual_id);
			
			while(matcher.find()){
				cnt++;
			}
			cnt = cnt+1;
			System.out.println("cnt"+cnt);
			if(cnt == 1){
				dual_id = dual_id+","+reg_id;
			}else if(cnt == 2){
				dual_id = dual_id+","+reg_id + "...";
			}
			alarmCheck.get(0).setReg_id(dual_id);
			
			update(NAMESPACE+"updateRegIdAlarm", alarmCheck.get(0));
			
		}else{
			
			Map param = new HashMap();
			param.put("alarm_index_no", alarm_index_no);
			param.put("alarm_contnum", alarm_contnum);
			param.put("alarm_id", writer_id);
			param.put("reg_id", reg_id);
			
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
