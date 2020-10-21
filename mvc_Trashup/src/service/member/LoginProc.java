package service.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

public class LoginProc {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pageChoose = request.getParameter("pageChoose");
	
		MemberDao m = new MemberDao();
		
		map = m.loginMember(id, pw);
		
		String rs = map.get("login");
		
		if(rs.equals("ok")) {
			//세셩생성, view 분기
			HttpSession session = request.getSession();
			session.setAttribute("sessId", id);
			session.setAttribute("sessName", map.get("name"));
			session.setAttribute("sessNickname", map.get("nickname"));
			
		} else if(rs.equals("pwFail")) {
			request.setAttribute("preView", "login");
			request.setAttribute("stateRes", "pwFail");
			
		} else if(rs.equals("fail")) {			
			request.setAttribute("preView", "login");
			request.setAttribute("stateRes", "fail");
			
		}
		
		return pageChoose;
	}
	


}
