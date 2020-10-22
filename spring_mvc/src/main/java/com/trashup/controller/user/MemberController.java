package com.trashup.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.trashup.domain.Member;
import com.trashup.service.MemberService;


@Controller
@RequestMapping(value="/member/")
public class MemberController {
	
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);	
	
	//와이어링 : 객체를 자동으로 Spring bean에 생성
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "memRegForm")
	public String memRegForm() {	
		return "member/memRegForm";
	}
	
	@RequestMapping(value = "idDoubleCheck")
	public void idDoubleCheck(@RequestParam("id") String id, HttpServletResponse res) {
		int val = memberService.idDoubleCheck(id);
		
		try {
			PrintWriter out = res.getWriter();
			out.print(val);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="memRegProc")
//	public void memRegProc (HttpServletResponse member) {
//	public void memRegProc (@ModelAttribute("member") Member member)  {
//	public void memRegProc (@ModelAttribute Member member)  {
	public String memRegProc (Member member) {		
		memberService.insertMember(member);		
		return "redirect:/";
	}
	
	@RequestMapping(value="loginProc")
	public String loginProc(Member member, HttpSession session, Model model, @RequestParam String pageChoose) {
		Map<String, String> map = memberService.loginProc(member, session);
		model.addAttribute("preView", map.get("preView"));
		model.addAttribute("stateRes", map.get("stateRes"));
		
		if(pageChoose.equals("1")) {
			return "tupMap";
		} else if (pageChoose.equals("2")) {
			return "notice/noticeList";
		} else if (pageChoose.equals("3")) {
			return "notice/noticeContent";
		} else {
			return "redirect:/";
		}		
	}
	
	@RequestMapping(value="logoutProc")
	public String logoutProc(HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
}
