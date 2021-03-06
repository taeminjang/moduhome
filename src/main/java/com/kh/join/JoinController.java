package com.kh.join;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.alarm.AlarmModel;
import com.kh.moduhome.CommandMap;




@Controller
public class JoinController {
	
	String authNUm = "";
	String Email = "";

	@Resource(name="joinService")
	private JoinService joinService;
	
	@RequestMapping(value="/joinForm")
	public ModelAndView join(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("joinForm");
		return mv;
	}
	
	@RequestMapping(value="/checkId")
	@ResponseBody
	public void checkId(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap) throws Exception{
		PrintWriter out = response.getWriter(); //자바에서 웹으로  데이터를 출력해주기 위해 사용
		String paramId= (request.getParameter("MEMBER_ID") == null)?"":String.valueOf(request.getParameter("MEMBER_ID"));
		int checkId = joinService.checkId(paramId); //MODA에서는 joinService.chekcId로 되어있다.
		System.out.println("아이디인증 : "+paramId);
		System.out.println("중복확인 결과 : "+checkId);
		out.print(checkId);
		out.flush();
		out.close();
	}

	@RequestMapping(value="/email_auth") //이메일 인증받기를 누른후 자바스크립트에서 이메일값 받은후  동작
	public ModelAndView email_auth(HttpServletResponse response, HttpServletRequest request,CommandMap Map)throws Exception{
		
		Email = (String) Map.getMap().get("email"); //전역 변수 : 이메일 인증시 유효성을 위해
		String email = (String) Map.getMap().get("email");
		System.out.println("email = " + email);
		Map.getMap().put("MEMBER_EMAIL", email); //Map에 DB컬럼명으로 이름을 정정한 후 다시 Map에 집어넣음
		
		int checkNum = joinService.checkMember(Map.getMap());
		System.out.println("checkNum="+checkNum);
		//System.out.println("mode"+Map.getMap().get("mode"));
		
		if(checkNum==0)
		{
		authNUm = RandomNum(); //이메일로 발송되는 인증번호
		sendEmail(email.toString(),authNUm);
		System.out.println("메일보냄");
		}
		String checkNumString=String.valueOf(checkNum);
		PrintWriter writer =response.getWriter(); //자바에서 웹으로 데이터 전송 script에서 사용 data가 됨
		writer.write(checkNumString);
		writer.flush();
		writer.close();
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("email",email); //이메일
		mv.addObject("authNum", authNUm); //인증번호
		mv.setViewName("joinForm");
		
		System.out.println("오드넘"+authNUm);
		return mv;
	}
	
	 @RequestMapping(value="/email_auth_success", method=RequestMethod.POST)
	    public @ResponseBody int clickMethod (HttpServletRequest request,CommandMap Map) throws Exception   {
	        
	    	String MapEmail =(String)Map.getMap().get("email");  /*input값으로 받아온 이메일과 인증번호값*/
	    	String MapAuth = (String)Map.getMap().get("auth");
	    	System.out.println("mapEmail : "+MapEmail);
	    	System.out.println("mapAuth : "+MapAuth);
	    	String email = Email;   
	        String str = authNUm;
	        int sss = 0;
	        
	    	if(MapEmail.equals(email) && MapAuth.equals(authNUm)) {
	    		sss = 1;
	    	}
	    	else {
	    		sss = 0;
	    	}
	    	
	         System.out.println("authNUm뭐냐?"+authNUm);
	        return sss;
	    }

	private void sendEmail(String email,String authNum)throws Exception{ //메일을 보내는 메서드
		String host ="smtp.gmail.com";
		String subject = "모두의 집 인증 번호 전달";
		String fromName ="모두의 집 관리자";
		String from="khiclass@gmail.com";//보내는메일
		String to1 = email;
		
		String content = "인증번호 : " + authNum;
		
		try{
			Properties props = new Properties();
			
			props.put("mail.smtp,starttls.enable","true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host",host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props,new javax.mail.Authenticator(){
					@Override
					protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication("khiclass@gmail.com","khacademy");
			}
			});
			
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"UTF-8","B"))); //보내는사람설정
			
			InternetAddress[] address1 = {new InternetAddress(to1)};
			
			msg.setRecipients(Message.RecipientType.TO, address1); //받는사람설정1
			msg.setSubject(subject); //제목설정
			msg.setSentDate(new java.util.Date()); //보내는 날짜설정
			msg.setContent(content,"text/html;charset=utf-8"); //내용설정
			
			Transport.send(msg);
		}catch (MessagingException e) {
			e.printStackTrace();
		Exception ex = new Exception();
			throw ex;	
		}catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	
	
	public String RandomNum(){ //임의의 랜덤한 6자리숫자 뽑아줌 
		StringBuffer buffer = new StringBuffer();
		for(int i = 0;i<=6;i++){
			int n= (int)(Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	//이메일인증 추가 여기까지

	@RequestMapping(value="/joinComplete", method=RequestMethod.POST) //step2사용자 회원가입의 폼의 데이터를 받아서 처리 
	public ModelAndView joinComplete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		Map<String, Object> memberMap=new HashMap<String, Object>();	
		memberMap=commandMap.getMap();
		joinService.insertMember(memberMap, request);
		
		session.setAttribute("MEMBER_ID", commandMap.get("MEMBER_ID"));	//세션에 아이디를 넣어라
        session.setAttribute("MEMBER_NAME", commandMap.get("MEMBER_NAME"));
        session.setAttribute("MEMBER_NICKNAME", commandMap.get("MEMBER_NICKNAME"));
        session.setAttribute("MEMBER_NUMBER", commandMap.get("MEMBER_NUMBER"));
        session.setAttribute("MEMBER_PHONE", commandMap.get("MEMBER_PHONE"));
        session.setAttribute("MEMBER_EMAIL", commandMap.get("MEMBER_EMAIL"));
        session.setAttribute("MEMBER_ADMIN", commandMap.get("MEMBER_ADMIN"));
        session.setAttribute("MEMBER_EMAIL", commandMap.get("MEMBER_EMAIL"));
        session.setAttribute("MEMBER_ADMIN", 0);
		mv.setViewName("joinComplete");
		mv.addObject("MEMBER_ID",commandMap.get("MEMBER_ID"));
		
		//로그인시 그 회원에게 알람이 있는지 체크 및 영역에 알람목록 등록
		/*List<AlarmModel> mem_alarm = null;
		String mem_id = commandMap.get("MEMBER_ID").toString();
		if(alarmService.alarmExist(mem_id) != 0){
			mem_alarm = alarmService.alarmLoad(mem_id);
			System.out.println("mem_id ? "+mem_id);
			
		}*/
		/*session.setAttribute("session_mem_alarm", mem_alarm);*/
		return mv;
		
	}
}