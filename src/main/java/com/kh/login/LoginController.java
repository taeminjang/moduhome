package com.kh.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.alarm.AlarmModel;
import com.kh.alarm.AlarmService;
//import kh.spring.cart.CartService;
import com.kh.moduhome.CommandMap;

/* -1- import spring.siroragi.cart.CartService;
import spring.siroragi.member.MemberService;
*/
@Controller
public class LoginController {
  
	//장바구니
/*   @Resource(name = "cartService")
   private CartService cartService;*/
   
   /*
    * @Resource(name = "memberService") private MemberService memberService;
    */
   
	
	
	@Resource(name = "loginService")
	private LoginService loginService;
	@Resource(name = "alarmService")
	private AlarmService alarmService;

   // 로그인 폼
   // 로그인 폼
   
   
   @RequestMapping("/main")
   public ModelAndView main() {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("main");
      return mv;
   }
   @RequestMapping(value = "/loginForm")
   public ModelAndView loginForm() {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("loginForm-m");
      return mv;
   }
 
   
  /* @RequestMapping(value = "/loginComplete")
   public ModelAndView loginComplete() {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("loginComplete");
      return mv;
   }*/
   
   //로그인 됨
   @SuppressWarnings("unchecked")
   @RequestMapping(value = "/login", method = RequestMethod.POST)
   public ModelAndView loginComplete(CommandMap commandMap, HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView();
      
      
      HttpSession session = request.getSession();
      
      System.out.println("아이디" + commandMap.get("MEMBER_ID"));
      
      Map<String, Object> chk = loginService.loginGo(commandMap.getMap());
      if (chk == null) {	//아이디 값이 없으면
         mv.setViewName("loginForm");
         mv.addObject("message", "해당 아이디가 없습니다.");
         return mv;
      } 
      else {	//아이디 값이 있으면
    	  								//비밀번호 1 = DB에 저장된 해당 아이디 비밀번호,		비밀번호 2 = 로그인시 회원이 입력한 비밀번호 
         System.out.println("비밀번호 1 : " + chk.get("MEMBER_PASSWORD") + "\n비밀번호 2 : " + commandMap.get("MEMBER_PASSWORD"));
         			//멤버 비밀번호가 입력한 비밀번호 값이 같으면
         if (chk.get("MEMBER_PASSWORD").equals(commandMap.get("MEMBER_PASSWORD"))) {
            session.setAttribute("MEMBER_ID", commandMap.get("MEMBER_ID"));	//세션에 아이디를 넣어라
            mv.addObject("MEMBER", chk);	//
            mv.setViewName("redirect:main");
            session.setAttribute("MEMBER_NAME", chk.get("MEMBER_NAME"));
            session.setAttribute("MEMBER_NICKNAME", chk.get("MEMBER_NICKNAME"));
            session.setAttribute("MEMBER_NUMBER", chk.get("MEMBER_NUMBER"));
            session.setAttribute("MEMBER_PHONE", chk.get("MEMBER_PHONE"));
            session.setAttribute("MEMBER_EMAIL", chk.get("MEMBER_EMAIL"));
            session.setAttribute("MEMBER_ADMIN", chk.get("MEMBER_ADMIN"));
            session.setAttribute("MEMBER_EMAIL", chk.get("MEMBER_EMAIL"));
            
            //로그인시 그 회원에게 알람이 있는지 체크 및 영역에 알람목록 등록
    		List<AlarmModel> mem_alarm = null;
    		String mem_id = chk.get("MEMBER_NUMBER").toString();
    		if(alarmService.alarmExist(mem_id) != 0){
    			mem_alarm = alarmService.alarmLoad(mem_id);
    			System.out.println("mem_id ? "+mem_id);
    			
    		}
    		//System.out.println("mem_alarm의 크기는? " + mem_alarm.size());
    		session.setAttribute("session_mem_alarm", mem_alarm);
    		
    		
            // 이메일 포맷 변경
            /*String email = chk.get("MEMBER_EMAIL").toString();
            System.out.println("이메일 : " + email);
            String[] sessionEmail = email.split("@");
            session.setAttribute("MEMBER_EMAIL", sessionEmail.toString());
            session.setAttribute("MEMBER_EMAIL1", sessionEmail[0].toString());	//이메일 앞부분
            session.setAttribute("MEMBER_EMAIL2", sessionEmail[1].toString());	//이메일 뒷부분
*/            
       
            /*
            
            Map<String, Object> cart = new HashMap<String, Object>(); //장바구니 정보

            // 로그인하면 등록기간 3일 이상된 상품 지우기
            cart.put("MEMBER_NUMBER", chk.get("MEMBER_NUMBER"));
            cartService.deleteCarts(cart);
            cart.remove("MEMBER_NUMBER");*/

            // 로그인하면 세션에 있던 장바구니 정보넣기
      /*      if (session.getAttribute("cartSession") != null) {
               List<Map<String, Object>> cartSession = (List<Map<String, Object>>) session.getAttribute("cartSession");

               for (int i = 0; i < cartSession.size(); i++) {
                  cart = cartSession.get(i);
                  System.out.println("장바구니 세션" + i + " : " + cartSession.get(i));

                  cart.put("MEMBER_NUMBER", chk.get("MEMBER_NUMBER"));

                  cartService.cartInsert2(cart);
               }
               session.removeAttribute("cartSession");
            }*/
            
            
            //AOP로 비회원으로 구매시 일단 정지
         /*   if(commandMap.get("viewName") != null) {
            	String view = (String)commandMap.get("viewName");
            	if(!view.equals("")) {
               System.out.println("AOP 로전송된 VIEW NAME = " + commandMap.getMap().get("viewName"));
               String viewName = (String)commandMap.getMap().get("viewName");    
               mv.setViewName("redirect:"+viewName);
               
               
               }
               
             }*/
             
            return mv;
            
         } else {	//비밀번호 틀렸을때
        	mv.setViewName("loginForm");
            mv.addObject("message", "비밀번호를 확인해 주세요.");
            return mv;
         }
      }
    }
      

   @RequestMapping(value = "/logout")		//로그아웃
   public ModelAndView logout(HttpServletRequest request, CommandMap commandMap) {
      HttpSession session = request.getSession(false);
      if (session != null)
         session.invalidate();
      ModelAndView mv = new ModelAndView();
      mv.setViewName("redirect:/main");
      return mv;
   }
}