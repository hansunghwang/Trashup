package service.member;

import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ServiceMember;
import dao.MemberDao;
import dto.Member;

public class MemRegProc implements ServiceMember {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String password = request.getParameter("pw");
			String name = request.getParameter("name");
			String nickname = request.getParameter("nickname");
			
			Member m = new Member();
			m.setId(id);
			m.setPassword(password);
			m.setName(nickname);
			m.setNickname(nickname);
			
			MemberDao dao = new MemberDao();
			int rs = dao.insertMember(m);
			System.out.println("삽인된 행: " +rs);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		

		
	}
}
