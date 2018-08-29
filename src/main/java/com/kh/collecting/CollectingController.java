package com.kh.collecting;

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

import com.kh.follow.MemberModel;
import com.kh.moduhome.CommandMap;


@Controller
public class CollectingController {
	
	@Resource(name="collectingService")
	private CollectingService collectingService;
	
	//보관하기 화면출력용. 매거진 화면이 될 예정?
	@RequestMapping(value = "/collecting")
	public ModelAndView collecting(@ModelAttribute("MemberModel") MemberModel memberModel, CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		int MG_NUMBER =  Integer.parseInt(request.getParameter("MG_NUMBER"));
		String collecting_quan = collectingService.collectingQuan(MG_NUMBER);
		

		mv.addObject("MG_NUMBER", MG_NUMBER);
		mv.addObject("collecting_quan", collecting_quan);
		
		mv.setViewName("mycollecting");
		return mv;
	}
	
	//마이페이지- 매거진 보관함 페이지  ->마이페이지로 이동할 예정
	@RequestMapping(value = "/mycollecting")
	public ModelAndView mycollecting(@ModelAttribute("MemberModel") MemberModel memberModel, CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		int MG_NUMBER =  Integer.parseInt(request.getParameter("MG_NUMBER"));
		
		mv.addObject("MG_NUMBER", MG_NUMBER);
		
		mv.setViewName("mycollectingdis");
		return mv;
	}
	
	
	@RequestMapping(value="/collectingReg", method = RequestMethod.POST)
	public @ResponseBody int regCollecting(@RequestBody CollectingModel collectingModel) throws Exception{

		System.out.println("collectingReg가 실행?");
		System.out.println(collectingModel.getMg_number());
		System.out.println(collectingModel.getMember_number());

		int exist = collectingService.collectingExist(collectingModel.getMg_number(), collectingModel.getMember_number());
		System.out.println("exist의 값은 : " + exist);
		if(exist == 1) {
			collectingService.collectingReg(collectingModel.getMg_number(), collectingModel.getMember_number());
			return 1;
		}
		else {
			return 0;
		}
		
	}
	
/*	@RequestMapping(value="/collectionStyleList.do", method = RequestMethod.POST)
	public @ResponseBody List<ArticleListModel> collectionStyleList(@RequestBody ArticleListModel articleListModel) throws Exception{
		
		Integer A_no_Start = articleListModel.getA_no();
		int collection_seq = articleListModel.getCollection_seq();
		String id = articleListModel.getId();
		
		return articleService.collectionStyleList(A_no_Start, collection_seq, id);
	}*/
	
	@RequestMapping(value="/disCollecting", method = RequestMethod.POST)
	public @ResponseBody int disCollecting(@RequestBody CollectingModel collectingModel) throws Exception{
		return collectingService.disCollecting(collectingModel.getMg_number(), collectingModel.getMember_number());
	}
		
	
}
