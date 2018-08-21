/*package com.kh.magazine;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;

import kh.command.CommandMap;
import kh.paging.Paging;
import kh.magazine.comment.MagazineCMService;


@Controller
public class MagazineController {

	private int searchNum;

	private String isSearch;

	// 페이징 변수
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 7;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;
	private String filePath = "C:\\maven\\MODA\\src\\main\\webapp\\file\\noticeFile\\";

	@Resource(name = "magazineService")
	private MagazineService magazineService;
	
	@Resource(name = "magazinecmService")
	private MagazineCMService magazinecmService;

	
	@RequestMapping(value = "/mglist")
	public ModelAndView magazineList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> mgList = magazineService.mgList(commandMap.getMap());
		
				
	
		mv.addObject("mgList", mgList);
		mv.setViewName("mglist");
		
		return mv;
	}
	
	@RequestMapping(value = "/mgDetail")
	public ModelAndView mgDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> mgDetail = magazineService.mgDetail(commandMap.getMap());
		List<Map<String, Object>> magazineCmList = magazinecmService.magazineCmList(commandMap.getMap());
		List<Map<String, Object>> mgContentList = magazineService.mgContentList(commandMap.getMap());
		
		mv.addObject("mgContentList", mgContentList);
		mv.addObject("magazineCmList", magazineCmList);
		mv.addObject("mgDetail", mgDetail);
		mv.setViewName("mgdetail");
		
		return mv;
	}
	
	
	@RequestMapping(value = "/mgInsertForm")
	public ModelAndView magazineInsertForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/mginsert");

		return mv;
	}
	
	// 매거진 타이틀 등록
	@RequestMapping(value = "/mgInsert2")
	public ModelAndView magazineInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("0");
		magazineService.mgInsert(commandMap.getMap(), request);
		System.out.println("1");
		Map<String, Object> mgNew = magazineService.mgNew(commandMap.getMap());
		System.out.println("2");
		mv.addObject("mgNew", mgNew);
		System.out.println("파람" + commandMap.getMap());
		mv.setViewName("/mgcontentinsert");
		
		return mv;
	}
	

	
	// 매거진 내용 등록
	@RequestMapping(value = "/mgContentInsert")
	public ModelAndView magazineContentInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/mgcontentinsert?MG_NUMBER="+commandMap.get("MG_NUMBER"));

		commandMap.getMap().put("MEMBER_NUMBER", session.getAttribute("MEMBER_NUMBER").toString());
		System.out.println("파람" + commandMap.getMap());
		magazineService.mgContentInsert(commandMap.getMap(),request);
		
		List<Map<String, Object>> mgContentList = magazineService.mgContentList(commandMap.getMap());
		Map<String, Object> mgNew = magazineService.mgNew(commandMap.getMap());
		
		mv.addObject("mgContentList", mgContentList);
		mv.addObject("mgNew", mgNew);
		
	
		mv.setViewName("/mgcontentinsert");
		
		
		return mv;
	}
	
	
	// 공지사항 등록 폼
	@RequestMapping(value = "/snsboard")
	public ModelAndView adminNotifyForm() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("snsboard");
		return mv;
	}



	// 공지사항 목록
	@RequestMapping(value = "/snslist")
	public ModelAndView adminNotifyList(CommandMap commandMap, HttpServletRequest request) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> notifyAdminlist = adminNotifyService.snsList(commandMap.getMap());

		
		Map<String, Object> isSearchMap = new HashMap<String, Object>();
		
		isSearch = request.getParameter("isSearch");

		if (isSearch != null) {
		
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			isSearchMap.put("isSearch", isSearch);

			if (searchNum == 0) { // 회원ID
				notifyAdminlist = adminNotifyService.notifyTitleSearch(isSearchMap);
			} else if (searchNum == 1) { // 상품이름
				notifyAdminlist = adminNotifyService.notifyContentSearch(isSearchMap);
			}

			totalCount = notifyAdminlist.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminNotifyList", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			notifyAdminlist = notifyAdminlist.subList(page.getStartCount(), lastCount);

			mv.addObject("isSearch", isSearch);
			mv.addObject("searchNum", searchNum);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("notifyList", notifyAdminlist);
			mv.setViewName("notifyAdminList");

			return mv;

		} else {
			totalCount = notifyAdminlist.size();

			page = new Paging(currentPage, totalCount, blockCount, blockPage, "adminNotifyList");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			notifyAdminlist = notifyAdminlist.subList(page.getStartCount(), lastCount);

			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);

			mv.addObject("snslist", notifyAdminlist);
			mv.setViewName("list");

			return mv;
		}
	}



	// 공지사항 수정 폼
	@RequestMapping(value = "/notify/adminNotifyDetail")
	public ModelAndView adminNotifyDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		Map<String, Object> notifyDetail = adminNotifyService.notifyDetail(commandMap.getMap());
		mv.addObject("notifyDetail", notifyDetail);

		mv.setViewName("notifyModifyForm");
		return mv;
	}

	// 공지사항 수정
	@RequestMapping(value = "notify/adminNotifyModify")
	public ModelAndView adminNotifyModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/notify/adminNotifyList");

		adminNotifyService.notifyModify(commandMap.getMap(), request);
		mv.addObject("NOTIFY_NUMBER", commandMap.get("NOTIFY_NUMBER"));

		return mv;
	}

	// 공지사항 삭제
	@RequestMapping(value = "/notify/adminDeleteNotify")
	public ModelAndView adminDeleteNotify(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/notify/adminNotifyList");

		Map<String, Object> deleteNotify = adminNotifyService.notifyDetail(commandMap.getMap());

		if (deleteNotify.get("NOTIFY_IMAGE") != null) {
			File removeFile = new File(filePath + deleteNotify.get("NOTIFY_IMAGE"));
			removeFile.delete();
		}

		adminNotifyService.notifyDelete(commandMap.getMap());

		return mv;
	}
	
	
}
*/