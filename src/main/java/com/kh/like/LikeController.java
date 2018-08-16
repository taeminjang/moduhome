package com.kh.like;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.moduhome.CommandMap;

@Controller
public class LikeController {
    
	@Resource(name="likeService")
	private LikeService likeService;
	
	@RequestMapping(value="/likeSNS", method=RequestMethod.POST)
	public @ResponseBody int likeSnsReg(@RequestBody CommandMap map)throws Exception{
		
		likeService.likeSNSReg(map.getMap());
		
		/*String Story_writer = //스토리 쓴사람 불러오기 
		String reg_id = map.getId(); //좋아요 누른 사람 아이디
		int Story_seq = map.getStory_num();
		alramService.regAlram(Story_writer, reg_id, Story_seq, 1);*/
		
		return 1;
		
	}
	
}
